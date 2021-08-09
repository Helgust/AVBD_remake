// Params
private _heli = _this;
private _dir = getDir _heli;

// Create paratroopers and let them chase players
_grp = createGroup west;
_grp setFormDir _dir;

_unit01 = _grp createUnit ["CUP_B_USMC_Soldier_SL", [0,0,0], [], 0, "CAN_COLLIDE"];
_unit01 setPosASL [(getPosASL _heli select 0), (getPosASL _heli select 1), (getPosASL _heli select 2) - 5];
_unit01 addBackpack "B_Parachute";
_unit01 action ["OpenParachute",_unit01];

_stalk = [_grp,group (allPlayers select 0)] spawn BIS_fnc_stalk;

sleep 0.5;

_unit02 = _grp createUnit ["CUP_B_USMC_Soldier_Marksman", [0,0,0], [], 0, "CAN_COLLIDE"];
_unit02 setPosASL [(getPosASL _heli select 0), (getPosASL _heli select 1), (getPosASL _heli select 2) - 5];
_unit02 addBackpack "B_Parachute";
_unit02 action ["OpenParachute",_unit02];

sleep 0.5;

_unit03 = _grp createUnit ["CUP_B_USMC_Soldier_AR", [0,0,0], [], 0, "CAN_COLLIDE"];
_unit03 setPosASL [(getPosASL _heli select 0), (getPosASL _heli select 1), (getPosASL _heli select 2) - 5];
_unit03 addBackpack "B_Parachute";
_unit03 action ["OpenParachute",_unit03];

sleep 0.5;

_unit04 = _grp createUnit ["CUP_B_USMC_Soldier_AR", [0,0,0], [], 0, "CAN_COLLIDE"];
_unit04 setPosASL [(getPosASL _heli select 0), (getPosASL _heli select 1), (getPosASL _heli select 2) - 5];
_unit04 addBackpack "B_Parachute";
_unit04 action ["OpenParachute",_unit04];

sleep 0.5;

_unit05 = _grp createUnit ["CUP_B_USMC_Soldier_GL", [0,0,0], [], 0, "CAN_COLLIDE"];
_unit05 setPosASL [(getPosASL _heli select 0), (getPosASL _heli select 1), (getPosASL _heli select 2) - 5];
_unit05 addBackpack "B_Parachute";
_unit05 action ["OpenParachute",_unit05];

sleep 0.5;

_unit06 = _grp createUnit ["CUP_B_USMC_Soldier_LAT", [0,0,0], [], 0, "CAN_COLLIDE"];
removeBackpack _unit06;
_unit06 setPosASL [(getPosASL _heli select 0), (getPosASL _heli select 1), (getPosASL _heli select 2) - 5];
_unit06 addBackpack "B_Parachute";
_unit06 action ["OpenParachute",_unit06];

sleep 0.5;

_unit07 = _grp createUnit ["CUP_B_USMC_Soldier_LAT", [0,0,0], [], 0, "CAN_COLLIDE"];
_unit07 setPosASL [(getPosASL _heli select 0), (getPosASL _heli select 1), (getPosASL _heli select 2) - 5];
_unit07 addBackpack "B_Parachute";
_unit07 action ["OpenParachute",_unit07];

sleep 0.5;

_unit08 = _grp createUnit ["CUP_B_USMC_Soldier_MG", [0,0,0], [], 0, "CAN_COLLIDE"];
_unit08 setPosASL [(getPosASL _heli select 0), (getPosASL _heli select 1), (getPosASL _heli select 2) - 5];
_unit08 addBackpack "B_Parachute";
_unit08 action ["OpenParachute",_unit08];


sleep 0.5;

_unit09 = _grp createUnit ["CUP_B_USMC_Soldier", [0,0,0], [], 0, "CAN_COLLIDE"];
_unit09 setPosASL [(getPosASL _heli select 0), (getPosASL _heli select 1), (getPosASL _heli select 2) - 5];
_unit09 addBackpack "B_Parachute";
_unit09 action ["OpenParachute",_unit09];

sleep 0.5;

_unit10 = _grp createUnit ["CUP_B_USMC_Soldier", [0,0,0], [], 0, "CAN_COLLIDE"];
_unit10 setPosASL [(getPosASL _heli select 0), (getPosASL _heli select 1), (getPosASL _heli select 2) - 5];
_unit10 addBackpack "B_Parachute";
_unit10 action ["OpenParachute",_unit10];


sleep 2;
_heli animateDoor ["Ramp_Top",0,false];

// Don't limit their equipment - they're fresh units
// if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach (units _grp)};
_grp enableDynamicSimulation true;

/*
waitUntil {sleep 5; ({(_x distance (leader _grp)) < (1500)} count (allPlayers) == 0)};
{deleteVehicle _x} forEach (units _grp);
deleteGroup _grp;
*/