//Zombie generator script by Celery

if (!isServer) exitWith {};

_logic=this select 0;
_radius=this select 1;
_amount=this select 2;
_ellipse=this select 3;
_logicpos=[getPos _logic select 0,getPos _logic select 1,0];
_activatedist=_radius/cos 45+AVBD_maxspawndist;
_deactivatedist=_activatedist+100;

//Continue if logic is inside area of operations (or there is no such area)
_posx=getPos _logic select 0;
_posy=getPos _logic select 1;
if (!isNil "generatorminxy" and !isNil "generatormaxxy") then {
	if (_posx<getPos generatorminxy select 0 or _posx>getPos generatormaxxy select 0 or _posy<getPos generatorminxy select 1 or _posy>getPos generatormaxxy select 1) exitWith {deleteVehicle _logic};
};

//Zombie amount if set to default
waitUntil {!isNil "AVBD_defaultdensity"};
if (_amount==-1) then {_amount=AVBD_defaultdensity};

//Run script until there are no zombies left
while {_amount>0} do {
	waitUntil {!isNil "AVBD_players"};
	
	//Wait until players are in range
	_activate=false;
	while {!_activate} do {
		if ({_logicpos distance [getPos vehicle _x select 0,getPos vehicle _x select 1,0]<_activatedist} count AVBD_players>0) then {_activate=true};
		if (!_activate) then {sleep 5};
	};
	
	//Prepare positions
	_positions=[];
	_idarray=[];
	_markers=[];
	for "_x" from 1 to _amount do {
		_randomradius=random _radius;
		_pos=[0,0,10000];
		_relocate=true;
		//Relocate if position is on water or on a structure or close to player
		while {_relocate} do {
			_pos=[(_logicpos select 0)-_radius+random _radius*2,(_logicpos select 1)-_radius+random _radius*2,0];
			_logic setPos [_pos select 0,_pos select 1,1000];
			if (!surfaceIsWater _pos and (getPos _logic select 2)==(getPosATL _logic select 2) and {_pos distance [getPos vehicle _x select 0,getPos vehicle _x select 1,0]<AVBD_minspawndist} count AVBD_players==0 and (!_ellipse or _pos distance _logicpos<_radius)) then {_relocate=false};
		};
		//Debug marker
		if (AVBD_debug) then {
			_marker=createMarkerLocal [format ["marker%1",random 100000],_pos];
			_marker setMarkerTypeLocal "Dot";
			_marker setMarkerColorLocal "ColorGreen";
			_marker setMarkerSizeLocal [0.15,0.15];
			_markers=_markers+[_marker];
		};
		//Add to array
		_positions=_positions+[_pos];
		_idarray=_idarray+[_x-1];
	};
	
	//Initialize arrays
	_removeidarray=[];
	_zombies=[];
	for "_x" from 1 to count _positions do {_zombies=_zombies+[objNull]};
	
	sleep random 2;
	
	//Loop until players are out of range
	while {_amount>0 and {_logicpos distance [getPos vehicle _x select 0,getPos vehicle _x select 1,0]>_deactivatedist} count AVBD_players<count AVBD_players} do {
		{
			//Despawn zombie if not in range or detach from generator if horde
			if (!isNull (_zombies select _x)) then {
				_zombie=_zombies select _x;
				_despawn=true;
				
				if ({_zombie distance [getPos vehicle _x select 0,getPos vehicle _x select 1,0]<AVBD_despawndist or !isNull (_zombie getVariable "victim")} count AVBD_players>0) then {_despawn=false};
				if (_despawn or !alive _zombie or (_zombie getVariable "horde")) then {
					if (_despawn) then {_zombie setDamage 1};
					_zombies set [_x,objNull];
					_removeidarray=_removeidarray+[_x];
					if (AVBD_debug) then {deleteMarkerLocal (_markers select _x)};
				};
				
			} else {
				if ({side _x==east or side _x==west or side _x==resistance} count allGroups<432-AVBD_hordereservedgroups) then {
					//Determine whether position is in spawning range
					_spawn=false;
					_pos=_positions select _x;
					if ({_pos distance vehicle _x<AVBD_maxspawndist} count AVBD_players>0 and {_pos distance vehicle _x<AVBD_minspawndist} count AVBD_players==0) then {_spawn=true};
					//Spawn new zombie
					if (_spawn) then {
						/*Zombie type
						"normal"
						"surprise":		silent until close
						"passive":		waits standing, silent until close
						"crawler":		crawls, silent until very close, aggro radius always maximum
						"passive crawler":waits prone, silent until very close
						"sneaker":		like crawler but starts running when close
						"ambusher":		waits prone, stands up to chase, silent until close
						*/
						_zombietype="normal";
						_r=random 1;
						if (_r>0.62) then {_zombietype="crawler"}; //6% are crawlers
						if (_r>0.68) then {_zombietype="sneaker"}; //2% are sneakers
						if (_r>0.7) then {_zombietype="surprise"}; //30% are surprise zombies
						
						//Create unit
						_side=east;
						if ({side _x==east} count allGroups>=144) then {_side=west};
						if (_side==west and {side _x==west} count allGroups>=144) then {_side=resistance};
						_group=createGroup _side;
						_class=selectRandom AVBD_FastZombies;
						_zombie=_group createUnit [_class,getPos zombiespawner,[],50,"NONE"];
						_zombie enableSimulation false;
						_horde=false;
						
						//Initialize zombification
						//[_zombie,_zombietype,objNull,_horde,0,_positions select _x] exec "zombie_scripts\cly_z_init.sqs";
						
						//Add to arrays
						_zombies set [_x,_zombie];
					};
				};
			};
			sleep 0.05;
		} forEach _idarray;
		
		//Remove expired IDs
		{_idarray=_idarray-[_x]} forEach _removeidarray;
		_amount=count _idarray;
		
		sleep 2;
	};
	{deleteMarkerLocal _x} forEach _markers;
	_amount=count _idarray;
};

deleteVehicle _logic;