/*
	Zombie generator generator script
	
	Author: Celery
	Version: 2012.7.18
	
	Generates zombie generators in the area marked by a trigger called zombieboundary.
*/


_boundarypos = getPosATL zombieboundary;
_boundaryarea = triggerArea zombieboundary;
_xrad = _boundaryarea select 0;
_yrad = _boundaryarea select 1;
_boundarydir = _boundaryarea select 2;

_generatordiam = 1000;
_generatorrad = _generatordiam * 0.5;

_refobj = createVehicle ["HeliHEmpty", _boundarypos, [], 0, "CAN_COLLIDE"];
_refobj setDir _boundarydir;

"boundary" setMarkerPos _boundarypos;
"boundary" setMarkerSize [_xrad, _yrad];
"boundary" setMarkerDir _boundarydir;

_generators = [];
for "_x" from 0 to ceil (_xrad * 2 / _generatordiam) - 1 do
{
	for "_y" from 0 to ceil (_yrad * 2 / _generatordiam) - 1 do
	{
		_relpos = [- _xrad + _generatorrad + _generatordiam * _x, - _yrad + _generatorrad + _generatordiam * _y];
		_pos = if (_boundarydir == 0) then {[(_boundarypos select 0) + (_relpos select 0), (_boundarypos select 1) + (_relpos select 1)];} else {_refobj modelToWorld _relpos;};
		/*_mk = createMarker ["generator" + str _x + str _y, _pos];
		_mk setMarkerShape "RECTANGLE";
		_mk setMarkerBrush "Border";
		_mk setMarkerSize [_generatorrad, _generatorrad];
		_mk setMarkerDir _boundarydir;*/
		_generators set [count _generators, _pos];
	};
};
waitUntil {!isNil "BIS_fnc_inTrigger"};

_i = 0;
_steps = 10;
_step = _generatordiam / _steps;
{
	_generatorpos = _x;
	_refobj setPos _generatorpos;
	_refobj setDir _boundarydir;
	_count = 0;
	_minx = _generatorrad;
	_miny = _generatorrad;
	_maxx =  - _generatorrad;
	_maxy =  - _generatorrad;
	for "_xi" from 1 to _steps do
	{
		for "_yi" from 1 to _steps do
		{
			_relpos = [- _generatorrad - (_step / 2) + _step * _xi, - _generatorrad - (_step / 2) + _step * _yi];
			_pos = if (_boundarydir == 0) then {[(getPosATL _refobj select 0) + (_relpos select 0), (getPosATL _refobj select 1) + (_relpos select 1)];} else {_refobj modelToWorld _relpos;};
			//if ([zombieboundary, _pos] call BIS_fnc_inTrigger) then
			//{
				if (!surfaceIsWater _pos) then
				{
					//if ({[_x, _pos] call BIS_fnc_inTrigger} count CLY_nospawntriggers == 0) then
					//{
						/*_mk = createMarker ["pos" + str _i + "_" + str _xi + "_" + str _yi, _pos];
						_mk setMarkerType "hd_dot";
						_mk setMarkerSize [0.4, 0.4];
						_mk setMarkerColor "ColorRed";*/
						_count = _count + 1;
						if (_relpos select 0 < _minx) then {_minx = _relpos select 0;};
						if (_relpos select 1 < _miny) then {_miny = _relpos select 1;};
						if (_relpos select 0 > _maxx) then {_maxx = _relpos select 0;};
						if (_relpos select 1 > _maxy) then {_maxy = _relpos select 1;};
					//};
				};
			//};
		};
	};
	_count = _count / (_steps * _steps);
	if (_count>0) then
	{
		_relpos = [(_maxx + _minx) / 2, (_maxy + _miny) / 2];
		_pos = if (_boundarydir == 0) then {[(getPosATL _refobj select 0) + (_relpos select 0), (getPosATL _refobj select 1) + (_relpos select 1)];} else {_refobj modelToWorld _relpos;};
		_generator = createTrigger ["EmptyDetector", _pos];
		_area = [_step / 2 + (_maxx - _minx) * 0.5, _step / 2 + (_maxy - _miny) * 0.5, _boundarydir, true];
		_generator setTriggerArea _area;
		[_generator, - _count] execVM "zombie_scripts\cly_z_generator.sqf";
		/*_mk = createMarker ["generator" + str _generatorpos, _pos];
		_mk setMarkerShape "RECTANGLE";
		_mk setMarkerBrush "Border";
		_mk setMarkerSize [_area select 0, _area select 1];
		_mk setMarkerDir _boundarydir;*/
	};
	_i = _i + 1;
	sleep 0.0001;
} forEach _generators;

deleteVehicle _refobj;