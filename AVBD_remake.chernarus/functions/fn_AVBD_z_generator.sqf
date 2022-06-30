//Zombie generator script by Celery
if (!isServer) exitWith {};
waitUntil {{isNil _x} count ["AVBD_minspawndist", "AVBD_maxspawndist", "AVBD_despawndist", "AVBD_defaultdensity", "AVBD_hordereservedgroups", "AVBD_debug", "BIS_fnc_inTrigger", "BIS_fnc_distance2D"] == 0};
_trigger = _this select 0;
_amount = _this select 1;
_area = triggerArea _trigger;
_areax = _area select 0;
_areay = _area select 1;
_dir = _area select 2;
_radius = (_area select 0) max (_area select 1);
_triggerpos = [getPosATL _trigger select 0, getPosATL _trigger select 1, 0];
_activatedist = _radius/cos 45 + AVBD_maxspawndist;
_deactivatedist = _activatedist + 100;

//Replace the original trigger with a local trigger that doesn't take cycles from clients
deleteVehicle _trigger;
_trigger = createTrigger ["EmptyDetector", _triggerpos];
_trigger setTriggerArea _area;

sleep 0.3;

//Zombie amount if set to default
if (_amount < 0) then
{
	_amount = round (AVBD_defaultdensity * abs _amount);
};

//Create reference object
_refobj = "HeliHEmpty" createVehicleLocal _triggerpos;
_refobj setPos _triggerpos;
_refobj setDir _dir;

//Run script until there are no zombies left
while {_amount > 0} do
{
	//Wait until players are in range
	_activate = false;
	while {!_activate} do
	{
		if ({_triggerpos distance [getPos vehicle _x select 0, getPos vehicle _x select 1, 0] < _activatedist} count playableUnits > 0) then {_activate = true};
		if (!_activate) then {sleep 5;};
	};
	//Prepare positions
	_positions = [];
	_idarray = [];
	_markers = [];
	for "_x" from 1 to _amount do
	{
		_pos = [0, 0, 0];
		_relocate = true;
		//Relocate if position is on water or on a structure or close to player
		while {_relocate} do
		{
			//_pos = _refobj modelToWorld [- _areax + random (_areax * 2), - _areay + random (_areay * 2), 0];
			_pos=[(_triggerpos select 0)-_radius+random _radius*2,(_triggerpos select 1)-_radius+random _radius*2,0];
			//_pos set [2, 0];
			_refobj setPos [_pos select 0, _pos select 1, 1000];
			if ([_trigger, _pos] call BIS_fnc_inTrigger) then
			{
				if (!surfaceIsWater _pos) then
				{
					if ((getPos _refobj select 2) == (getPosATL _refobj select 2)) then
					{
						if ({_pos distance [getPos vehicle _x select 0, getPos vehicle _x select 1, 0] < AVBD_minspawndist} count (playableUnits) == 0) then
						{
							//Everything checks out
							_relocate = false;
						};
					};
				};
			};
		};
		//Debug marker
		if (AVBD_debug) then
		{
			createMarkerLocal ["debugmarker%1" + str random 100000, _pos];
			_marker setMarkerTypeLocal "hd_dot";
			_marker setMarkerColorLocal "ColorGreen";
			_marker setMarkerSizeLocal [0.5, 0.5];
			_markers set [count _markers, _marker];
		};
		//Add to array
		_positions set [count _positions, _pos];
		_idarray set [count _idarray, _x - 1];
	};
	//Initialize arrays
	_removeidarray = [];
	_zombies = [];
	for "_x" from 1 to count _positions do {_zombies set [count _zombies, objNull];};
	sleep random 2;
	//Loop until players are out of range
	while {_amount > 0 && {[_triggerpos, vehicle _x] call BIS_fnc_distance2D > _deactivatedist} count playableUnits < count playableUnits} do
	{
		{
			_i = _x;
			//Despawn zombie if not in range or detach from generator if horde
			if (!isNull (_zombies select _i)) then
			{
				_zombie = _zombies select _i;
				if (_zombie getVariable "despawn" || !alive _zombie || (_zombie getVariable "horde")) then
				{
					_despawn = _zombie getVariable "despawn";
					if (_despawn) then
					{
						_zombie setDamage 1;
						_zombie setVariable ["victim", _zombie];
					}
					else
					{
						_removeidarray set [count _removeidarray, _i];
						if (AVBD_debug) then {deleteMarkerLocal (_markers select _i);};
					};
					_zombies set [_i, objNull];
				};
			}
			else
			{
				//Create zombie
				if ({side _x in [east, west]} count allGroups < 432 - AVBD_hordereservedgroups) then
				{
					//Determine whether position is in spawning range
					_spawn = false;
					_pos = _positions select _i;
					if ({[_pos, vehicle _x] call BIS_fnc_distance2D < AVBD_maxspawndist} count playableUnits > 0) then
					{
						if ({[_pos, vehicle _x] call BIS_fnc_distance2D < AVBD_minspawndist} count playableUnits == 0) then
						{
							_spawn = true;
						};
					};
					//Spawn new zombie
					if (_spawn) then
					{
						_side = resistance;
						if ({side _x == east} count allGroups >= 144) then {_side = west};
						if (_side == west && {side _x == west} count allGroups >= 144) then {_side = resistance;};
						_group = createGroup _side;
						_zombie = _group createUnit [(selectRandom AVBD_FastZombies), _pos, [], 50, "NONE"];
						_zombie enableSimulation true;
						_stalk = [_group,group (allPlayers select 0)] spawn BIS_fnc_stalk;
						_zombies set [_i, _zombie];
					};
				};
			};
			sleep 0.1;
		} forEach _idarray;
		//Remove expired IDs
		{_idarray = _idarray - [_x];} forEach _removeidarray;
		_amount = count _idarray;
		sleep 2;
	};
	{deleteMarkerLocal _x} forEach _markers;
	_amount = count _idarray;
};

deleteVehicle _trigger;
deleteVehicle _refobj;