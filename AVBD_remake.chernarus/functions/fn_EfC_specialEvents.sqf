/*
*** Special events for Escape from Tanoa - types and frequency
- mortar fire on randomly selected team member
- Pawnees
- Wipeout
- Blackfish gunship
*/

// Params
params
[
	["_delayMin",2,[999]], // min delay in minutes
	["_delayMax",5,[999]] // max delay in minutes
];

private _delayFinal = (((random (_delayMax - _delayMin)) + _delayMin) * 60);
private _event = selectRandom HLG_EfC_events;

_markers = [];

// Remove the selected event from array so it's not repeated. If all events happened, restart it.
HLG_EfC_events = HLG_EfC_events - [_event];
if (count HLG_EfC_events == 0) then {HLG_EfC_events = ["CivCar"]};

// Trigger next event
//str _delayFinal remoteExec ["hint"];
sleep _delayFinal;
_null = [_delayMin,_delayMax] spawn HLG_fnc_EfC_specialEvents;

// MORTAR
if (_event == "Mortar") then
{
	//str "Special Event Mortar" remoteExec ["hint"];

	//["Event: %1",_event] call BIS_fnc_logFormat;

	"DistantMortar" remoteExec ["playSound"];
	sleep 2;
	"DistantMortar" remoteExec ["playSound"];
	sleep 2;
	"DistantMortar" remoteExec ["playSound"];
	sleep 2;
	"DistantMortar" remoteExec ["playSound"];
	sleep 2;
	"DistantMortar" remoteExec ["playSound"];
	sleep 2;
	"DistantMortar" remoteExec ["playSound"];

	sleep 15;
	_target = selectRandom allPlayers;
	_null = [_target,"Sh_82mm_AMOS",200,18,2,nil,nil,nil,nil,["mortar1","mortar2"]] spawn BIS_fnc_fireSupportVirtual;

};

if (_event == "RndBlastToNearCity") then
{
	str "Special Event rndBlastToNearCity" remoteExec ["systemChat"];
	_allLocationTypes = [];
	_nearLocations = [];
	"_allLocationTypes pushBack configName _x" configClasses (configFile >> "CfgLocationTypes");

	_target = selectRandom allPlayers;
	_targetPos = position _target;
	_rndNearLocations  =  nearestLocations[_target, ["NameCityCapital","NameCity","NameVillage"], 700];
	_targetCityPos = [0,0,0];
	_radius = 500;
	if (count _rndNearLocations > 0) then 
	{
		_targetCity = selectRandom _rndNearLocations;
		_tryCount = 10;
		while {position _target distance _targetCity <= 500 && _tryCount > 0} do
		{
			_targetCity = selectRandom _rndNearLocations;
			_tryCount = _tryCount - 1;
		};

		_targetCityPos = position _targetCity;
		if(_target distance2D _targetCityPos < 500) then
		{
			_targetPos_x = ((position _target)  select 0)  - _radius + (random (_radius * 2));
			_targetPos_y = ((position _target) select 1)  - _radius + (random (_radius * 2)); 
			_targetCityPos = [_targetPos_x, _targetPos_y,0];
		};
	}
	else
	{
		_targetPos_x = ((position _target)  select 0)  - _radius + (random (_radius * 2));
		_targetPos_y = ((position _target) select 1)  - _radius + (random (_radius * 2)); 
		_targetCityPos = [_targetPos_x, _targetPos_y,0];
	};
		
	_cas = createVehicle ["CUP_B_Su25_Dyn_CDF", [(_targetCityPos select 0),(_targetPos select 1) - 3250, 125], [], 0, "FLY"];
	createVehicleCrew _cas;
	_casCrew = crew _cas;
	_casGroup = group (_casCrew select 0);	

	// _cas setPosATL [(_targetPos select 0),(_targetPos select 1) - 1750, 125];
	_cas flyInHeight 125;
	_cas forceSpeed 200;
	_wpCAS01 = _casGroup addWaypoint [_targetCityPos, 0];
	_wpCAS01 setWaypointType "GUARD";
	_awayWPPos = [(_targetCityPos select 0),(_targetCityPos select 1) + 3250, 0];
	_wpCAS02 = _casGroup addWaypoint [_awayWPPos, 0];
	_wpCAS02 setWaypointType "GUARD";
	waitUntil {sleep 0.5; (_cas distance2D _targetCityPos) < 400;};
	_position_cas = position _cas;
	_null = [_targetCityPos,"Bo_Mk82",200,4,1,nil,nil,nil,nil,["shell1","shell2","shell3"]] spawn BIS_fnc_fireSupportVirtual;

	// Delete when far away
	waitUntil {sleep 5; ({(_x distance _cas) < (5000)} count (allPlayers) == 0)};
	{deleteVehicle _x} forEach (_casCrew) + [_cas];
	deleteGroup _casGroup;
	str "Special Event rndBlastToNearCity END" remoteExec ["systemChat"];
};

if (_event == "CivCar") then
{
	str "Special Event banditPickup" remoteExec ["systemChat"];

	_target = selectRandom allPlayers;
	_targetPos = getPosATL _target;
	_wpPos = [(_targetPos select 0) + 500, (_targetPos select 1) + 500, 0];
	_wpPos2 = [(_wpPos select 0) - 500, (_wpPos select 1) + 750, 0];
	_wpPos3 = selectRandom AVBD_EscCheckpoints;
	
	_pickUpPos = [(_targetPos select 0) + 500,(_targetPos select 1) - 1500, 0];

	_list = _pickUpPos nearRoads 500;
	_list = [_list, [selectRandom allPlayers], {_input0 distance _x }, "DESCEND"] call BIS_fnc_sortBy;
	_furtherstRoad = _list select 0;
	_marker = createMarkerLocal ["debugmarker%1" + str random 100000, position _furtherstRoad];
	_marker setMarkerTypeLocal "hd_dot";
	_marker setMarkerColorLocal "ColorOrange";
	_marker setMarkerSizeLocal [0.5, 0.5];
	_markers set [count _markers, _marker];

	_marker1 = createMarkerLocal ["debugmarker%1" + str random 100000, _wpPos];
	_marker1 setMarkerTypeLocal "hd_dot";
	_marker1 setMarkerColorLocal "ColorPink";
	_marker1 setMarkerSizeLocal [0.5, 0.5];
	_markers set [count _markers, _marker1];

	_marker1 = createMarkerLocal ["debugmarker%1" + str random 100000, _wpPos2];
	_marker1 setMarkerTypeLocal "hd_dot";
	_marker1 setMarkerColorLocal "ColorPink";
	_marker1 setMarkerSizeLocal [0.5, 0.5];
	_markers set [count _markers, _marker1];

	_marker1 = createMarkerLocal ["debugmarker%1" + str random 100000, _wpPos3];
	_marker1 setMarkerTypeLocal "hd_dot";
	_marker1 setMarkerColorLocal "ColorPink";
	_marker1 setMarkerSizeLocal [0.5, 0.5];
	_markers set [count _markers, _marker1];
	
	_posCar = position _furtherstRoad;
	_pickup = createVehicle [(selectRandom BIS_civilCars), [_posCar select 0, _posCar select 1, 0.2], [], 0, "NONE"];
	createVehicleCrew _pickup;
	_pickupCrew = crew _pickup;
	_pickupGroup = group (_pickupCrew select 0);

	_pickup forceSpeed 50;
	_pickupGroup setBehaviour "AWARE";
	_pickupGroup setCombatMode "BLUE";

	_wpPickup01 = _pickupGroup addWaypoint [_wpPos, 0];
	_wpPickup02 = _pickupGroup addWaypoint [_wpPos2, 0];
	_wpPickup03 = _pickupGroup addWaypoint [_wpPos3, 0];


	// Delete heli when far away
	waitUntil {sleep 5; (_pickup distance2D _targetPos) > 4000};

	{deleteVehicle _x} forEach (_pickupCrew + [_pickup]);
	deleteGroup _pickupGroup;

	
	
};

if (_event == "BattleCar") then
{
	str "Special Event banditPickup" remoteExec ["systemChat"];

	_target = selectRandom allPlayers;
	_targetPos = getPosATL _target;
	_wpPos = [(_targetPos select 0) + 500, (_targetPos select 1) + 500, 0];
	
	_pickUpPos = [(_targetPos select 0) + 500,(_targetPos select 1) - 1500, 0];

	_list = _pickUpPos nearRoads 500;
	_list = [_list, [selectRandom allPlayers], {_input0 distance _x }, "DESCEND"] call BIS_fnc_sortBy;
	_furtherstRoad = _list select 0;
	_marker = createMarkerLocal ["debugmarker%1" + str random 100000, position _furtherstRoad];
	_marker setMarkerTypeLocal "hd_dot";
	_marker setMarkerColorLocal "ColorOrange";
	_marker setMarkerSizeLocal [0.5, 0.5];
	_markers set [count _markers, _marker];

	_marker1 = createMarkerLocal ["debugmarker%1" + str random 100000, _wpPos];
	_marker1 setMarkerTypeLocal "hd_dot";
	_marker1 setMarkerColorLocal "ColorPink";
	_marker1 setMarkerSizeLocal [0.5, 0.5];
	_markers set [count _markers, _marker1];
	
	_posCar = position _furtherstRoad;
	_pickup = createVehicle [selectRandom BIS_civilCars, [_posCar select 0, _posCar select 1, 0.2], [], 0, "NONE"];
	createVehicleCrew _pickup;
	_pickupCrew = crew _pickup;
	_pickupGroup = group (_pickupCrew select 0);

	_pickup forceSpeed 50;
	_pickupGroup setBehaviour "AWARE";
	_pickupGroup setCombatMode "BLUE";

	// Delete heli when far away
	waitUntil {sleep 5; (_pickup distance2D _targetPos) > 4000};

	{deleteVehicle _x} forEach (_pickupCrew + [_pickup]);
	deleteGroup _pickupGroup;

	_wpPickup01 = _pickupGroup addWaypoint [_wpPos, 0];
	_wpPickup02 = _pickupGroup addWaypoint [[100,100,150], 0];
	
};

// CLUSTER - not used (Orange has better clusters anyway)
if (_event == "Cluster") then
{
	["Event: %1",_event] call BIS_fnc_logFormat;

	"DistantHowitzer" remoteExec ["playSound"];
	sleep 5;
	"DistantHowitzer" remoteExec ["playSound"];

	sleep 15;
	_target = selectRandom allPlayers;
	_null = [_target,nil,nil,[2,10],5] spawn BIS_fnc_fireSupportCluster;

};

// PARADROP
if (_event == "Paradrop") then
{
	//str "Special Event Paradrop" remoteExec ["hint"];
	//["Event: %1",_event] call BIS_fnc_logFormat;
	_target = selectRandom allPlayers;
	_targetPos = getPosATL _target;
	_wpPos = [(_targetPos select 0) + 500, (_targetPos select 1) + 500, 100];

	// Create heli and WPs
	_heli = createVehicle ["CUP_B_MV22_USMC", [(_targetPos select 0) + 500,(_targetPos select 1) - 2000, 100], [], 0, "FLY"];
	createVehicleCrew _heli;
	_heliCrew = crew _heli;
	_heliGroup = group (_heliCrew select 0);
	_heli animateDoor ["Ramp_Top",1,true];

	_heli flyInHeight 150;
	_heli forceSpeed 50;
	_heliGroup setBehaviour "Careless";
	_heliGroup setCombatMode "Blue";
	{_x disableAI "FSM"; _x disableAI "Target"; _x disableAI "Autotarget"} forEach _heliCrew;

	_wpHeli01 = _heliGroup addWaypoint [_wpPos, 0];
	_wpHeli02 = _heliGroup addWaypoint [[100,100,150], 0];

	// Naval camo
	[_heli,["Blue",1],true] call BIS_fnc_initVehicle;

	// If the heli is disabled, kill the crew
	_null = [_heli,_heliCrew] spawn
	{
		waitUntil {sleep 2.5; !(isNull (_this select 0)) and {!(canMove (_this select 0))}};
		{_x setDamage 1} forEach (_this select 1);
	};

	// Paradrop
	waitUntil {sleep 1; (_heli distance2D _targetPos) < 500};

	_null = _heli execVM "Scripts\Paratroopers.sqf";

	// Delete heli when far away
	waitUntil {sleep 5; (_heli distance2D _targetPos) > 4000};

	{deleteVehicle _x} forEach (_heliCrew + [_heli]);
	deleteGroup _heliGroup;
};

// CAS - 2 Littlebirds
if (_event == "BattleHeliHelp") then
{
	str "Special Event BattleHeliHelp" remoteExec ["systemChat"];
	//["Event: %1",_event] call BIS_fnc_logFormat;

	_target = selectRandom allPlayers;
	_targetPos = getPosATL _target;

	// 1st Pawnee
	//CUP_B_UH1D_gunship_GER_KSK
	//CUP_B_Mi171Sh_ACR
	//CUP_B_UH1Y_Gunship_Dynamic_USMC
	_randHeli = ["CUP_B_UH1D_gunship_GER_KSK"];
	_cas = createVehicle [selectRandom _randHeli, [0,0,75], [], 0, "FLY"];
	createVehicleCrew _cas;
	_cas forceSpeed 120;
	_casCrew = crew _cas;
	driver _cas  disableAI "Lights";
	//_cas switchLight "ON";
	_cas setPilotLight true;
	_cas setCollisionLight true;
	_casGroup = group (_casCrew select 0);

	_cas setPosATL [(_targetPos select 0),(_targetPos select 1) - 2000, 75];
	_cas flyInHeight 50;

	// 2nd Pawnee
	/*_cas2 = createVehicle ["CUP_B_Mi17_CDF", [50,50,75], [], 0, "FLY"];
	createVehicleCrew _cas2;
	_casCrew2 = crew _cas2;
	_casGroup2 = group (_casCrew2 select 0);
	[_casGroup2] join _casGroup;

	_cas2 setPosATL [(_targetPos select 0) + 100,(_targetPos select 1) - 2100, 75];
	_cas2 flyInHeight 75;
	*/

	//Waypoints
	_wpCAS01 = _casGroup addWaypoint [_targetPos, 0];
	_wpCAS02 = _casGroup addWaypoint [_targetPos, 250];
	_wpCAS02 setWaypointType "SaD";
	_wpCAS03 = _casGroup addWaypoint [_targetPos, 250];
	_wpCAS03 setWaypointType "SaD";
	_wpCAS04 = _casGroup addWaypoint [_targetPos, 0];
	_wpCAS04 setWaypointType "Cycle";

	[_cas,["CDF",1],true] call BIS_fnc_initVehicle;
	// If the cas is disabled, kill the crew
	_null = [_cas,_casCrew] spawn
	{
		waitUntil {sleep 2; !(isNull (_this select 0)) and {!(canMove (_this select 0))}};
		{_x setDamage 1} forEach (crew (_this select 0));
	};

	// If the cas2 is disabled, kill the crew
	/*_null = [_cas2,_casCrew] spawn
	{
		waitUntil {sleep 2; !(isNull (_this select 0)) and {!(canMove (_this select 0))}};
		{_x setDamage 1} forEach (crew (_this select 0));
	};
	*/
	_closeUnits = [];
	_nearEnt = _target nearEntities ["Man", 1000];
	{if ( side _x == independent ) then {_closeUnits pushBack _x} } forEach _nearEnt;

	hint str count _closeUnits;

	waitUntil {sleep 5; (_target distance _cas) < (500)};
	[_cas, ["Heli_DE", 4000, 1]] remoteExec ["say3D", 0, true];

	// Reveal players to teamInsideHeli
	
	{
		private _unit = _x; // needed, otherwise _horizontalValues' _x made this one inaccessible
		{
			_x reveal  [_unit,4]
		} forEach crew _cas;
	} forEach _closeUnits;


	_null = [_casGroup,_cas] spawn
	{
		_t = time;

		waitUntil {sleep 5; (damage (_this select 1) > 0.35) or (time > _t + 300)};

		_escGroup = createGroup west;
		_unit01 = _escGroup createUnit ["CUP_B_USMC_Soldier", [10,10,0], [], 0, "CAN_COLLIDE"];

		_wp01 = _escGroup addWaypoint [getPosATL _unit01, 0];
		deleteVehicle _unit01;

		(_this select 0) copyWaypoints (_escGroup);
		(_this select 0) setCombatMode "Blue";
		deleteGroup _escGroup;
	};

	// Delete when far away
	waitUntil {sleep 5; ({(_x distance _cas) < (3000)} count (allPlayers) == 0)};
	{deleteVehicle _x} forEach (_casCrew) + [_cas];
	deleteGroup _casGroup;
};

// CAS - Comanche
if (_event == "CivHeli") then
{
	str "Special Event CivHeliHelp" remoteExec ["systemChat"];
	//["Event: %1",_event] call BIS_fnc_logFormat;

	_target = selectRandom allPlayers;
	_targetPos = getPosATL _target;

	// 1st Pawnee
	//CUP_C_IDAP_412
	_randHeli = ["CUP_C_IDAP_412"];
	_cas = createVehicle [selectRandom _randHeli, [0,0,75], [], 0, "FLY"];
	createVehicleCrew _cas;
	_cas forceSpeed 120;
	_casCrew = crew _cas;
	driver _cas  disableAI "Lights";
	//_cas switchLight "ON";
	_cas setPilotLight true;
	_cas setCollisionLight true;
	_casGroup = group (_casCrew select 0);

	_cas setPosATL [(_targetPos select 0),(_targetPos select 1) - 2000, 75];
	_cas flyInHeight 50;

	//Waypoints
	_wpCAS01 = _casGroup addWaypoint [_targetPos, 0];
	_wpCAS02 = _casGroup addWaypoint [_targetPos, 250];
	_wpCAS02 setWaypointType "MOVE";
	_wpCAS03 = _casGroup addWaypoint [_targetPos, 250];
	_wpCAS03 setWaypointType "MOVE";
	_wpCAS04 = _casGroup addWaypoint [_targetPos, 0];
	_wpCAS04 setWaypointType "Cycle";

	[_cas,["CDF",1],true] call BIS_fnc_initVehicle;
	// If the cas is disabled, kill the crew
	_null = [_cas,_casCrew] spawn
	{
		waitUntil {sleep 2; !(isNull (_this select 0)) and {!(canMove (_this select 0))}};
		{_x setDamage 1} forEach (crew (_this select 0));
	};

	waitUntil {sleep 5; (_target distance _cas) < (500)};
	[_cas, ["Oralo", 4000, 1]] remoteExec ["say3D", 0, true];


	_null = [_casGroup,_cas] spawn
	{
		_t = time;

		waitUntil {sleep 5; (damage (_this select 1) > 0.35) or (time > _t + 300)};

		_escGroup = createGroup west;
		_unit01 = _escGroup createUnit ["CUP_B_USMC_Soldier", [10,10,0], [], 0, "CAN_COLLIDE"];

		_wp01 = _escGroup addWaypoint [getPosATL _unit01, 0];
		deleteVehicle _unit01;

		(_this select 0) copyWaypoints (_escGroup);
		(_this select 0) setCombatMode "Blue";
		deleteGroup _escGroup;
	};

	// Delete when far away
	waitUntil {sleep 5; ({(_x distance _cas) < (3000)} count (allPlayers) == 0)};
	{deleteVehicle _x} forEach (_casCrew) + [_cas];
	deleteGroup _casGroup;
};

// CAS - Su25
if (_event == "SU25") then
{
	//str "Special Event Su25" remoteExec ["hint"];
	//["Event: %1",_event] call BIS_fnc_logFormat;

	_target = selectRandom allPlayers;
	_targetPos = getPosATL _target;

	_cas = createVehicle ["CUP_B_Su25_Dyn_CDF", [(_targetPos select 0),(_targetPos select 1) - 2250, 125], [], 0, "FLY"];
	createVehicleCrew _cas;
	_casCrew = crew _cas;
	_casGroup = group (_casCrew select 0);

	// _cas setPosATL [(_targetPos select 0),(_targetPos select 1) - 1750, 125];
	_cas flyInHeight 125;
	_wpCAS01 = _casGroup addWaypoint [_targetPos, 0];
	_wpCAS01 setWaypointType "Guard";

	{_cas reveal [_x,4]} forEach (allPlayers);

	// Remove missiles
       /* {_cas removeWeaponGlobal _x} forEach [/*"Missile_AA_04_Plane_CAS_01_F",*//*"Missile_AGM_02_Plane_CAS_01_F"];*/

	// Limit speed
	_cas forceSpeed 125;

	// If the cas is disabled, kill the crew
	_null = [_cas,_casCrew] spawn
	{
		waitUntil {sleep 2; !(isNull (_this select 0)) and {!(canMove (_this select 0))}};
		{_x setDamage 1} forEach (_this select 1);
	};

	// Retreat if damaged or after timeout
	_null = [_casGroup, _cas] spawn
	{
		_t = time;

		waitUntil {sleep 5; (damage (_this select 1) > 0.35) or (time > _t + 600)};

		_escGroup = createGroup resistance;
		_unit01 = _escGroup createUnit ["CUP_B_CDF_Soldier_MNT", [10,10,0], [], 0, "CAN_COLLIDE"];

		_wp01 = _escGroup addWaypoint [getPosATL _unit01, 0];
		deleteVehicle _unit01;

		(_this select 0) copyWaypoints (_escGroup);
		(_this select 0) setCombatMode "Blue";
		deleteGroup _escGroup;
	};

	// Delete when far away
	waitUntil {sleep 5; ({(_x distance _cas) < (5000)} count (allPlayers) == 0)};
	{deleteVehicle _x} forEach (_casCrew) + [_cas];
	deleteGroup _casGroup;
};

// // UGV DROP - cannot be dropped just anywhere = do not use
// if (_event == "UGVDrop") then
// {
// 	// ["Event: %1",_event] call BIS_fnc_logFormat;

// 	_target = selectRandom allPlayers;
// 	_targetPos = getPosATL _target;
// 	_wpPos = [(_targetPos select 0), (_targetPos select 1) + 200, 150];

// 	// Create heli and WPs
// 	// _heli = [[0,0,0], 0, "O_T_VTOL_02_vehicle_F", EAST] call BIS_fnc_spawnVehicle;

// 	_heli = createVehicle ["O_T_VTOL_02_vehicle_F", [0,0,100], [], 0, "FLY"];
// 	createVehicleCrew _heli;
// 	_heliCrew = crew _heli;
// 	_heliGroup = group (_heliCrew select 0);

// 	_heli setPosATL [(_targetPos select 0),(_targetPos select 1) - 1500, 100];
// 	_heli flyInHeight 100;
// 	_heli setVelocity [0,75,0];
// 	_heli forceSpeed 75;
// 	_heliGroup setBehaviour "Careless";
// 	_heliGroup setCombatMode "Blue";
// 	{_x disableAI "FSM"; _x disableAI "Target", _x disableAI "Autotarget"} forEach _heliCrew;

// 	_wpHeli01 = _heliGroup addWaypoint [_wpPos, 0];
// 	_wpHeli02 = _heliGroup addWaypoint [[100,100,150], 0];

// 	sleep 1;

// 	// If the heli is disabled, kill the crew
// 	_null = [_heli,_heliCrew] spawn
// 	{
// 		waitUntil {sleep 2; !(isNull (_this select 0)) and {!(canMove (_this select 0))}};
// 		{_x setDamage 1} forEach (_this select 1);
// 	};

// 	// Create UGV
// 	_ugv = [[10,10,10], 0, "O_T_UGV_01_rcws_ghex_F", EAST] call BIS_fnc_spawnVehicle;
// 	(_ugv select 2) setCombatMode "Blue";

// 	sleep 0.1;

// 	_heli setVehicleCargo (_ugv select 0);

// 	sleep 2.5;

// 	// Let him fire after he lands
// 	_null = [(_ugv select 0),(_ugv select 2)] spawn {
// 	waitUntil {sleep 1; isTouchingGround (_this select 0)};
// 	(_this select 1) setCombatMode "Red";
// 	};

// 	// Paradrop
// 	_null = [_heli,(_ugv select 2),_targetPos] spawn {
// 	waitUntil {sleep 1; ((_this select 0) distance2D (_this select 2)) < 300};

// 	(_this select 0) setVehicleCargo objNull;
// 	_stalk = [(_this select 1),group (allPlayers select 0)] spawn BIS_fnc_stalk;

// 	};

// 	// Delete heli when far away
// 	waitUntil {sleep 5; _heli distance2D _targetPos > 2500};
// 	{deleteVehicle _x} forEach (_heliCrew) + [_heli];
// 	deleteGroup _heliGroup;
// };
