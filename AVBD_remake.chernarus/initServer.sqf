// Delete empty groups
_deleteEmptyGrups = [] execVM "Scripts\DeleteEmptyGroups.sqf";




// Handle respawn of players - add respawn position for the team and delete older corpse (so only one for each player can be present)
addMissionEventHandler ["EntityRespawned",
{
	private _new = _this select 0;
	private _old = _this select 1;

	if (isPlayer _new)  then
	{
		private _oldBody = _old getVariable ["BIS_oldBody", objNull];
		if (!isNull _oldBody) then
		{
			deleteVehicle _oldBody;
		};

                _new setVariable ["BIS_oldBody", _old];

		[east,_new] call BIS_fnc_addRespawnPosition;

		// Remove (now unnecessary) backpack if player is AT rifleman
		// if (typeOf _new == "B_T_Soldier_LAT_F") then {_null = _new spawn {waitUntil {count (backpackMagazines _this) == 0}; removeBackpackGlobal _this}};
	};
}];

// Add initial respawn position and remove it after a timeout
[] spawn {
	_initSpawn = [east,"respawn",localize "STR_HLG_EscapeFromChernarus_respawnvillage"] call BIS_fnc_addRespawnPosition;
	sleep 300;
	waitUntil {sleep 5; {alive _x} count allPlayers > 0};
	_initSpawn call BIS_fnc_removeRespawnPosition;
};

//Start special events if enabled
[] spawn {
	sleep 5;
	if (missionNamespace getVariable "HLG_specialEvents" == 1) then
	{
        _events = [0,1] spawn HLG_fnc_EfC_specialEvents;

	};
};
// Start horde events if enabled
[] spawn {
	sleep 5;
	if (missionNamespace getVariable "HLG_randomHordes" == 1) then
	{
		
        _hordes = [0,1] spawn HLG_fnc_AVBD_Horde;

	};
};

// [] spawn {
// 	sleep 5;		
//     _ambient = [0,1] spawn HLG_fnc_AVBD_RndAmbientOST;
// };

// Limit equipment of already existing enemy units
[] spawn {
	if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then
	{
		{if ((side group _x == West) or (side group _x == Resistance)) then {_null = _x execVM "Scripts\LimitEquipment.sqf"}} forEach allUnits;
	};
};

// Escape task for players
[BIS_grpMain, "objEscape", [format [localize "STR_HLG_EscapeFromChernarus_tskEscapeDesc", "<br/>"], localize "STR_HLG_EscapeFromChernarus_tskEscapeTitle", "<br/>"], objNull, TRUE] call BIS_fnc_taskCreate;

// Initial music
// [] spawn {
// 	sleep 10;
// 	"LeadTrack03_F_Mark" remoteExec ["playMusic",east,false]; // LeadTrack02_F_EXP, LeadTrack01a_F, LeadTrack01c_F_EXP
// };


// Definitions of vehicles and groups to be spawned
BIS_civilCars =
[
	"CUP_C_Lada_CIV",
	"CUP_С_UAZ_Unarmed_TK_CIV",
	"CUP_C_Volha_CR_CIV",
	"CUP_C_Datsun_Plain",
	"C_Offroad_01_F",
	"C_Truck_02_transport_F",
	"CUP_C_Ural_Open_CIV_03"
];

AVBD_FastZombies =
[
	"RyanZombieC_man_1",
	"RyanZombieC_man_polo_1_F",
	"RyanZombieC_man_polo_2_F",
	"RyanZombieC_man_polo_3_F",
	"RyanZombieC_man_polo_4_F",
	"RyanZombieC_man_polo_5_F",
	"RyanZombieC_man_polo_6_F",
	"RyanZombieC_man_p_fugitive_F",
	"RyanZombieC_man_w_worker_F",
	"RyanZombieC_man_scientist_F",
	"RyanZombieC_man_hunter_1_F",
	"RyanZombieC_man_pilot_F",
	"RyanZombieC_journalist_F",
	"RyanZombieC_Orestes",
	"RyanZombieC_Nikos",
	"RyanZombie15",
	"RyanZombie16",
	"RyanZombie17",
	"RyanZombie18",
	"RyanZombie19",
	"RyanZombie20",
	"RyanZombie21",
	"RyanZombie22",
	"RyanZombie23",
	"RyanZombie24",
	"RyanZombie25",
	"RyanZombie26",
	"RyanZombie27",
	"RyanZombie28",
	"RyanZombie29",
	"RyanZombie30",
	"RyanZombie31",
	"RyanZombie32"
];

AVBD_Uniform=
[
	"rds_uniform_Worker1",
	"rds_uniform_Rocker2",
	"rds_uniform_Villager3",
	"rds_uniform_Woodlander4"

];

AVBD_BigHordeSFX  =
[
	"HordeBig1",
	"HordeBig2"
];

AVBD_SmallHordeSFX  =
[
	"Ebaka1",
	"Ebaka2",
	"Ebaka3",
	"Ebaka4",
	"Ebaka5",
	"Ebaka6",
	"Ebaka7"
];

AVBD_AmbSFX=
[
	"Dogs1",
	"Dogs2",
	"Dogs3",
	"Dogs4",
	"Dogs5",
	"HordeSmall1",
	"HordeSmall2",
	"HordeSmall3",
	"HordeSmall4",
	"HordeSmall5",
	"Wolves1",
	"Distanthum1",
	"Distanthum2",
	"Distantscream1",
	"Gunfirescream1",
	"Gunfirescream2",
	"Gunfirescream3",
	"Gunfirescream4"
];


BIS_supportVehicles =
[
	"C_Van_01_fuel_F",
	"C_Truck_02_fuel_F",
	"C_Offroad_01_repair_F"
];

BIS_CDFPatrols =
[
	/*"BanditCombatGroup",
	"BanditFireTeam",
	"ParaCombatGroup",
	"ParaFireTeam"*/
	"EfC_B_CDF_Team01",
	"EfC_B_CDF_Team02",
	"EfC_B_CDF_Team03",
	"EfC_B_CDF_Team04",
	"EfC_B_CDF_Team05",
	"EfC_B_CDF_Squad01",
	"EfC_B_CDF_Squad02"
];

BIS_NATOPatrols =
[
	/*"O_T_InfTeam",
	"O_T_InfSquad"*/
	"EfC_B_USMC_Team01",
	"EfC_B_USMC_Team02"
];

// Spawning enemy units & vehicles, empty transport and support vehicles
{
	// CDF patrols
	if (triggerText _x == "GEN_infantry") then
	{
		_x spawn
		{
			_basePos = position _this;
			_rad = (triggerArea _this) select 0;
			deleteVehicle _this;

			waitUntil {sleep 5; ({(_x distance2d _basePos) < (1000)} count allPlayers > 0)};

			if ({side _x == resistance} count allGroups > 120) exitWith {"Too many Resistance groups at the same time!" call BIS_fnc_log};

			_newGrp = grpNull;
			_newGrp = [_basePos, Resistance, missionConfigFile >> "CfgGroups" >> "West" >> "CUP_B_CDF" >> "Infantry" >> (selectRandom BIS_CDFPatrols), [], [], [0.2, 0.3]] call BIS_fnc_spawnGroup;

			// Remove backpack with spare NLAWs - balance ftw
			 //{if (typeOf _x == "CUP_B_CDF_Soldier_LAT_MNT") then {removeBackpackGlobal _x}} forEach (units _newGrp);

			// Enable Dynamic simulation
			_newGrp enableDynamicSimulation true;

			// Limit unit equipment if set by server
			if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach units _newGrp};

			// Limit aiming accuracy
			{_x setSkill ["AimingAccuracy",0.15]} forEach (units _newGrp);

			if ((random 1) > 0.65)
			then
			{
				/*_wp = _newGrp addWaypoint [position leader _newGrp, 0];
				_wp setWaypointType "GUARD";*/
				_stalk = [_newGrp,group (allPlayers select 0)] spawn BIS_fnc_stalk;
			} else
			{
				{
					_wp = _newGrp addWaypoint [_basePos, _rad];
					_wp setWaypointType "MOVE";
					_wp setWaypointSpeed "LIMITED";
					_wp setWaypointBehaviour "SAFE";
				} forEach [1, 2, 3, 4, 5];
				_wp = _newGrp addWaypoint [waypointPosition [_newGrp, 1], 0];
				_wp setWaypointType "CYCLE";
			};
		};
	};

	// NATO patrols
	if (triggerText _x == "NATO_infantry") then
	{
		_x spawn
		{
			_basePos = position _this;
			_rad = (triggerArea _this) select 0;
			deleteVehicle _this;

			waitUntil {sleep 5; ({(_x distance2d _basePos) < (1000)} count allPlayers > 0)};

			if ({side _x == west} count allGroups > 120) exitWith {"Too many WEST groups at the same time!" call BIS_fnc_log};

			_newGrp = grpNull;
			_newGrp = [_basePos, WEST, missionConfigFile >> "CfgGroups" >> "West" >> "CUP_B_USCM" >> "Infantry" >> (selectRandom BIS_NATOPatrols), [], [], [0.3, 0.4]] call BIS_fnc_spawnGroup;

			// Enable Dynamic simulation
			_newGrp enableDynamicSimulation true;

			// Limit unit equipment if set by server
			if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach units _newGrp};

			// Limit aiming accuracy
			{_x setSkill ["AimingAccuracy",0.20]} forEach (units _newGrp);

			if ((random 1) > 0.65)
			then
			{
				/*_wp = _newGrp addWaypoint [position leader _newGrp, 0];
				_wp setWaypointType "GUARD";*/
				_stalk = [_newGrp,group (allPlayers select 0)] spawn BIS_fnc_stalk;
			} else
			{
				{
					_wp = _newGrp addWaypoint [_basePos, _rad];
					_wp setWaypointType "MOVE";
					_wp setWaypointSpeed "LIMITED";
					_wp setWaypointBehaviour "SAFE";
				} forEach [1, 2, 3, 4, 5];
				_wp = _newGrp addWaypoint [waypointPosition [_newGrp, 1], 0];
				_wp setWaypointType "CYCLE";
			};
		};
	};

	// CSAT patrolling vehicles
	if (triggerText _x == "GEN_patrolVeh") then {
		_x spawn {
			_basePos = position _this;
			_dir = (triggerArea _this) select 2;
			if (_dir < 0) then {_dir = 360 + _dir};
			_vehType = (triggerStatements _this) select 1;
			_wpPath = group ((synchronizedObjects _this) select 0);	// synchronized civilian unit is used as waypoint storage
			deleteVehicle ((synchronizedObjects _this) select 0);
			deleteVehicle _this;

			waitUntil {sleep 2.5; ({(_x distance _basePos) < 1250} count allPlayers > 0)};

			_vehClass = switch (_vehType) do
			{
				case "MRAP": {"CUP_B_HMMWV_M2_USMC"};
				case "APC": {selectRandom ["CUP_B_BTR80A_CDF","CUP_B_LAV25_USMC"]};
				case "IFV": {"CUP_B_BMP_HQ_CDF"};       // Not used, only one in each escape location
				case "AAA": {"CUP_B_Ural_ZU23_CDF"};           // Not used, only one at the International Airfield
				case "SPG": {"CUP_B_BM21_CDF"};                 // Not used at all
				case "MBT": {"CUP_B_T72_CDF"};               // Not used at all
				case "LSV": {"CUP_B_UAZ_MG_CDF"};
				case "LSVU": {"CUP_B_UAZ_Unarmed_CDF"};

				default {"CUP_B_UAZ_Unarmed_CDF"};
			};
			_veh = createVehicle [_vehClass, _basePos, [], 0, "NONE"];
			_veh setDir _dir;
			createVehicleCrew _veh;
			_vehCrew = crew _veh;
			_vehGroup = group (_vehCrew select 0);
			//_vehGroup setSide resistance;

			_vehGroup copyWaypoints _wpPath;
			deleteGroup _wpPath;
			{clearMagazineCargoGlobal _x; clearWeaponCargoGlobal _x; clearBackpackCargoGlobal _x; clearItemCargoGlobal _x} forEach [_veh];
			_veh addItemCargoGlobal ["FirstAidKit",2];
			_veh setFuel (0.35 + random 0.25);
			_veh setVehicleAmmo (0.4 + random 0.4);

			// If the vehicle is unarmed LSV, create crew for FFV positions and disable getting out in combat
			if (_vehType == "LSVU") then {
				_veh setUnloadInCombat [false,false];

				_unit01 = _vehGroup createUnit ["CUP_B_CDF_Soldier_AR_MNT", [0,0,0], [], 0, "CAN_COLLIDE"];
				_unit01 moveInCargo _veh;
				[_unit01] orderGetIn true;

				_unit02 = _vehGroup createUnit [selectRandom ["CUP_B_CDF_Soldier_GL_MNT","CUP_B_CDF_Soldier_MNT"], [0,0,0], [], 0, "CAN_COLLIDE"];
				_unit02 moveInCargo _veh;
				[_unit02] orderGetIn true;

				_unit03 = _vehGroup createUnit ["CUP_B_CDF_Soldier_MNT", [0,0,0], [], 0, "CAN_COLLIDE"];
				_unit03 moveInCargo _veh;
				[_unit03] orderGetIn true;

                                _vehCrew = crew _veh;
			};

			// Handle immobilization
			if (missionNamespace getVariable "BIS_crewInImmobile" == 1) then
			{
				_veh allowCrewInImmobile true;
			};

			// Chance to create a second vehicle of the same type - only for armed LSV and UGV
			if ((_vehType in ["LSV"]) and {random 100 < 35}) then {

				_veh02 = createVehicle [_vehClass, [(_basePos select 0) - 7, (_basePos select 1) - 7, 0], [], 0, "NONE"];
				_veh02 setDir _dir;
				createVehicleCrew _veh02;
				_veh02Crew = crew _veh02;
				//_veh02Crew setSide resistance;
				_veh02Crew joinSilent _vehGroup;

				{clearMagazineCargoGlobal _x; clearWeaponCargoGlobal _x; clearBackpackCargoGlobal _x; clearItemCargoGlobal _x} forEach [_veh02];
				_veh02 addItemCargoGlobal ["FirstAidKit",2];
				_veh02 setFuel (0.35 + random 0.25);
				_veh02 setVehicleAmmo (0.4 + random 0.4);

				// Handle immobilization
				if (missionNamespace getVariable "BIS_crewInImmobile" == 1) then
				{
					_veh02 allowCrewInImmobile true;
				};

			};

			// Limit unit equipment if set by server
			if ((missionNamespace getVariable "BIS_enemyEquipment" == 1) and {_vehType != "UGV"}) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach (units _vehGroup)};

			// Limit aiming accuracy
			{_x setSkill ["AimingAccuracy",0.1]} forEach (units _vehGroup);

			// Enable Dynamic simulation
			_vehGroup enableDynamicSimulation true;

		};
	};

	// Civilian vehicles
	if (triggerText _x == "GEN_civilCar") then
	{
		_x spawn
		{
			_basePos = position _this;
			_dir = (triggerArea _this) select 2;
			if (_dir < 0) then {_dir = 360 + _dir};

			deleteVehicle _this;

			waitUntil {sleep 5; ({(_x distance _basePos) < 1000} count allPlayers > 0)};

			_veh = (selectRandom BIS_civilCars) createVehicle _basePos;
			_veh setFuel (0.35 + (random 0.25));
			_veh setDir _dir;
			{clearMagazineCargoGlobal _x; clearWeaponCargoGlobal _x; clearBackpackCargoGlobal _x; clearItemCargoGlobal _x} forEach [_veh];
			_veh addItemCargo ["FirstAidKit",3];
			_veh enableDynamicSimulation true;

			//_veh addAction["Play Radio",[execVM "Scripts\PlayRadio.sqf"]];

		};
	};
} forEach (allMissionObjects "EmptyDetector");

// [] spawn
// {
// 	_markers=[];
// 	while {!(BIS_Escaped)} do
// 	{
// 		_averagex=0;
// 		_averagey=0;
// 		sleep 5;
// 		_livePlayers = [];
// 		{if (alive _x) then {_livePlayers pushBackUnique _x}} forEach allPlayers;
// 		{if ((!((vehicle _x) in (list BIS_trgChernarus_01))) and (count _livePlayers > 0))} forEach (_livePlayers) then
// 		//if (({!((vehicle _x) in (list BIS_trgChernarus_01)) and ((vehicle _x isKindOf "Ship") or (vehicle _x isKindOf "Air"))} count units BIS_grpMain == _livePlayers) and (_livePlayers > 0)) then
// 		{
			
// 			{_averagex=_averagex+(getPos vehicle _x select 0);_averagey=_averagey+(getPos vehicle _x select 1)} forEach _livePlayers;
// 			_divide = count _livePlayers;
// 			_averagepos=[_averagex/_divide,_averagey/_divide,0];
// 			//_targetPos = getPosATL _averagepos; 
// 			_targetPos = _averagepos;
// 			zombie_wp setPosATL [_targetPos select 0,_targetPos select 1, 0];

// 			// _marker=createMarker [format ["marker%1",random 100000],_targetPos];
// 			// _marker setMarkerType "hd_dot";
// 			// _marker setMarkerColor "ColorGreen";
// 			// _marker setMarkerSize [1,1];
// 			// _markers=_markers+[_marker];
// 		};
// 	};
// };


// Check if the players are escaping
BIS_Escaped = false;
publicVariable "BIS_Escaped";

[] spawn
{
	while {!(BIS_Escaped)} do
	{
		sleep 5;
		_livePlayers = [];
		{if (alive _x) then {_livePlayers pushBackUnique _x}} forEach allPlayers;
		{if (((!((vehicle _x) in (list BIS_trgChernarus_01))) and ((vehicle _x isKindOf "Ship") or (vehicle _x isKindOf "Air"))) and (count _livePlayers > 0))} forEach (_livePlayers) then

		 //if (({!((vehicle _x) in (list BIS_trgChernarus_01)) and ((vehicle _x isKindOf "Ship") or (vehicle _x isKindOf "Air"))} count units BIS_grpMain == _livePlayers) and (_livePlayers > 0)) then
		{
			["objEscape", "Succeeded"] remoteExec ["BIS_fnc_taskSetState",east,true];
			["end1"] remoteExec ["BIS_fnc_endMission",east,true];
			BIS_Escaped = true;
			publicVariable "BIS_Escaped";
		};
	};
};

// Mission fail if everyone is dead
[] spawn
{
	sleep 300;
	waitUntil {sleep 5; {alive _x} count (units BIS_grpMain) > 0};
	waitUntil {sleep 5; {alive _x} count (units BIS_grpMain) == 0};
	["objEscape", "Failed"] remoteExec ["BIS_fnc_taskSetState",east,true];
	["endLoser", false] remoteExec ["BIS_fnc_endMission",east,true];
};

// Music when somebody gets into one of the escape vehicles
[] spawn
{
	sleep 5;
	waitUntil {sleep 5; {(vehicle _x isKindOf "Ship") or (vehicle _x isKindOf "Air")} count units BIS_grpMain > 0};
	5 fadeMusic 0.75;
	"LeadTrack02_F_Mark" remoteExec ["playMusic",east,false];
};

// radio_action = false;
// //Check then anyone get in CIV vehicle, to add Radio action
// [] spawn
// {
// 	id_action = 0;
// 	sleep 5;
// 	while {!(BIS_Escaped)} do
// 	{
// 	if ((typeOf (vehicle player) in BIS_civilCars) and ((driver (vehicle player)) isEqualTo player ) and !radio_action) 
// 		then {id_action = player addAction["Play Radio",{}]; radio_action = true;}
// 		else {player removeAction id_action;radio_action = false;};
// 	};
// };
