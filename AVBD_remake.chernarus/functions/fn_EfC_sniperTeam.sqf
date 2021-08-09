/*
Create sniper group and let it go after players
Do not limit their equipment and set high skill
*/

// Params
params
[
	["_axisX",0,[999]], // X axis
	["_axisY",0,[999]] // Y axis
];

private _sniper =
[
	["CUP_srifle_M40A3","","CUP_Mxx_camo_half","CUP_optic_LeupoldMk4",["CUP_5Rnd_762x51_M24",8],[],""],
	[],
	["CUP_hgun_Colt1911","","","",["CUP_7Rnd_45ACP_1911",6],[],""],
	["CUP_U_B_USMC_Ghillie_WDL",[["FirstAidKit",1],["SmokeShellRed",2,1],["CUP_7Rnd_45ACP_1911",3,6]]],
	["V_BandollierB_oli",[["CUP_5Rnd_762x51_M24",8,8]]],
	[],
	"",
	"",
	[],
	["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch","CUP_NVG_PVS7"]
];

private _spotter =
[
	["CUP_arifle_M16A4_base","","acc_pointer_IR","CUP_optic_ACOG2",["CUP_30Rnd_556x45_Stanag",30],[],""],
	[],
	[],
	["CUP_U_B_USMC_Ghillie_WDL",[["FirstAidKit",1],["SmokeShellRed",2,1]]],
	["V_Chestrig_rgr",[["CUP_30Rnd_556x45_Stanag",7,30],["MiniGrenade",2,1]]],
	[],
	"",
	"",
	["Rangefinder","","","",[],[],""],
	["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch","CUP_NVG_PVS7F"]
];

_newGrp = createGroup west;

// Sniper
_unit01 = _newGrp createUnit ["CUP_B_USMC_Sniper_M40A3", [_axisX,_axisY,0], [], 0, "CAN_COLLIDE"];
_unit01 setPosASL [_axisX,_axisY,0];
_unit01 setSkill 0.6;
_unit01 setSkill ["AimingAccuracy",0.25];
_unit01 setUnitLoadout _sniper;

// Spotter
_unit02 = _newGrp createUnit ["CUP_B_USMC_Spotter", [_axisX + 1,_axisY,0], [], 0, "CAN_COLLIDE"];
_unit02 setPosASL [_axisX + 1,_axisY,0];
_unit02 setSkill 0.5;
_unit02 setSkill ["AimingAccuracy",0.2];
_unit02 setUnitLoadout _spotter;

// Enable Dynamic simulation
_newGrp enableDynamicSimulation true;

// If it's night, use NVS scopes instead
if !((dayTime > 6.5) and (dayTime < 18.125)) then {
	{_x setUnitLoadout [[nil,nil,nil,"optic_nvs",nil,nil,nil],nil,nil,nil,nil,nil,nil,nil,nil,nil]} forEach (units _newGrp);
};

sleep (30 + (random 30));

// Stalk players
waitUntil {sleep 5; simulationEnabled (leader _newGrp)};

_stalk = [_newGrp,group (allPlayers select 0)] spawn BIS_fnc_stalk;
{_x disableAI "Autocombat"} forEach (units _newGrp);
_newGrp setBehaviour "Stealth";
_newGrp setCombatMode "Red";
/*
waitUntil {sleep 5; {(_x distance leader _newGrp) < (1500)} count allPlayers == 0};
{deleteVehicle _x} forEach (units _newGrp);
deleteGroup _newGrp;
*/
