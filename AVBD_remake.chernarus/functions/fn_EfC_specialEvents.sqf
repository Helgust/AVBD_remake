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
	["_delayMin",0,[999]], // min delay in minutes
	["_delayMax",0.2,[999]] // max delay in minutes
];

private _delayFinal = (((random (_delayMax - _delayMin)) + _delayMin) * 60);
private _event = selectRandom HLG_EfC_events;

_markers = [];

// Remove the selected event from array so it's not repeated. If all events happened, restart it.
HLG_EfC_events = HLG_EfC_events - [_event];
if (count HLG_EfC_events == 0) then {HLG_EfC_events = ["rndBlastToNearCity"]};

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

if (_event == "rndBlastToNearCity") then
{
	str "Special Event rndBlastToNearCity" remoteExec ["systemChat"];
	_allLocationTypes = [];
	_nearLocations = [];
	"_allLocationTypes pushBack configName _x" configClasses (configFile >> "CfgLocationTypes");

	_target = selectRandom allPlayers;
	_targetPos = position _target;
	_rndNearLocations  =  nearestLocations[_target, ["NameCityCapital","NameCity","NameVillage"], 700];
	_targetCity = selectRandom _rndNearLocations;

	while {position _target distance _x <= 500} do
	{
		_targetCity = _x;
	};
	
	str position _targetCity + text _targetCity remoteExec ["systemChat"];
	
	//_null = [position _rndNearLocation,"R_80mm_HE",300,2,3,nil,nil,nil,nil,["mortar1","mortar2"]] spawn BIS_fnc_fireSupportVirtual;
	//_null = [position _targetCity,"Rocket_03_HE_F",50,18,0.1,nil,nil,100,nil,["shell1","shell2","shell3"]] spawn BIS_fnc_fireSupportVirtual;
	_cas = createVehicle ["CUP_B_Su25_Dyn_CDF", [(_targetPos select 0),(_targetPos select 1) - 3250, 125], [], 0, "FLY"];
	createVehicleCrew _cas;
	_casCrew = crew _cas;
	_casGroup = group (_casCrew select 0);

	_targetCityPos = position _targetCity;

	// _cas setPosATL [(_targetPos select 0),(_targetPos select 1) - 1750, 125];
	_cas flyInHeight 125;
	_cas forceSpeed 240;
	_wpCAS01 = _casGroup addWaypoint [position _targetCity, 0];
	_wpCAS01 setWaypointType "GUARD";
	_awayWPPos = [(_targetCityPos select 0),(_targetCityPos select 1) + 3250, 0];
	_wpCAS02 = _casGroup addWaypoint [_awayWPPos, 0];
	_wpCAS02 setWaypointType "GUARD";
	
	waitUntil {sleep 0.2; (_cas distance2D _targetCityPos) < 600};
	_null = [_targetCityPos,"Rocket_03_HE_F",50,15,0.1,nil,20,position_cas select 2,nil,["shell1","shell2","shell3"]] spawn BIS_fnc_fireSupportVirtual;

	str "Special Event rndBlastToNearCity END" remoteExec ["systemChat"];
};

if (_event == "civCar") then
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
	_pickup = createVehicle ["CUP_I_UAZ_Unarmed_UN", [_posCar select 0, _posCar select 1, 0.2], [], 0, "NONE"];
	createVehicleCrew _pickup;
	_pickupCrew = crew _pickup;
	_pickupGroup = group (_pickupCrew select 0);

	_pickup forceSpeed 50;
	_pickupGroup setBehaviour "AWARE";
	_pickupGroup setCombatMode "YELLOW";

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
if (_event == "Mi17") then
{
	hint "CHECK";
	//str "Special Event Mi17" remoteExec ["hint"];
	//["Event: %1",_event] call BIS_fnc_logFormat;

	_target = selectRandom allPlayers;
	_targetPos = getPosATL _target;

	// 1st Pawnee
	_cas = createVehicle ["CUP_B_Mi171Sh_Unarmed_ACR", [0,0,75], [], 0, "FLY"];
	_cas setPilotLight true;
	createVehicleCrew _cas;
	_casCrew = crew _cas;
	_casGroup = group (_casCrew select 0);

	_cas setPosATL [(_targetPos select 0),(_targetPos select 1) - 2000, 75];
	_cas flyInHeight 75;

	// 2nd Pawnee
	/*_cas2 = createVehicle ["CUP_B_Mi17_CDF", [50,50,75], [], 0, "FLY"];
	createVehicleCrew _cas2;
	_casCrew2 = crew _cas2;
	_casGroup2 = group (_casCrew2 select 0);
	[_casGroup2] join _casGroup;

	_cas2 setPosATL [(_targetPos select 0) + 100,(_targetPos select 1) - 2100, 75];
	_cas2 flyInHeight 75;
	*/

	// Waypoints
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

	// Reveal players to pilots
	{(driver _cas) reveal [_x,4]} forEach allPlayers;

	// Delete when far away
	waitUntil {sleep 5; ({(_x distance _cas) < (3000)} count (allPlayers) == 0)};
	{deleteVehicle _x} forEach (_casCrew) + [_cas];
	deleteGroup _casGroup;
};

// CAS - Comanche
if (_event == "Blackfoot") then
{
	//str "Special Event Black" remoteExec ["hint"];
	//["Event: %1",_event] call BIS_fnc_logFormat;

	_target = selectRandom allPlayers;
	_targetPos = getPosATL _target;

	_cas = createVehicle ["CUP_B_UH60S_USN", [0,0,100], [], 0, "FLY"];
	createVehicleCrew _cas;
	_casCrew = crew _cas;
	_casGroup = group (_casCrew select 0);

	_cas setPosATL [(_targetPos select 0),(_targetPos select 1) - 2000, 100];
	_cas flyInHeight 100;

	_wpCAS01 = _casGroup addWaypoint [_targetPos, 0];
	_wpCAS02 = _casGroup addWaypoint [_targetPos, 250];
	_wpCAS02 setWaypointType "SaD";
	_wpCAS03 = _casGroup addWaypoint [_targetPos, 250];
	_wpCAS03 setWaypointType "SaD";
        _wpCAS04 = _casGroup addWaypoint [_targetPos, 0];
	_wpCAS04 setWaypointType "Cycle";

	// If the cas is disabled, kill the crew
	_null = [_cas,_casCrew] spawn
	{
		waitUntil {sleep 2; !(isNull (_this select 0)) and {!(canMove (_this select 0))}};
		{_x setDamage 1} forEach (_this select 1);
	};

	// Reveal players to pilot
	{(driver _cas) reveal [_x,4]} forEach allPlayers;

	// Retreat if damaged or after timeout
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
