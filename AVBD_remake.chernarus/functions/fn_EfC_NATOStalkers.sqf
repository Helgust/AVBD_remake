/*
Create recon team and let it go after players
Do not limit their equipment and set high skill
*/

// Params
params
[
	["_axisX",0,[999]], // X axis
	["_axisY",0,[999]] // Y axis
];

private _leader =
[
	["CUP_arifle_M4A1_BUIS_GL","muzzle_snds_M","acc_pointer_IR","CUP_optic_HoloBlack",["CUP_30Rnd_556x45_Stanag",30],[],""],
	[],
	["CUP_hgun_M9","CUP_muzzle_snds_M9","","",["CUP_15Rnd_9x19_M9",15],[],""],
	["CUP_U_B_USMC_MCCUU_gloves",[["FirstAidKit",1],["SmokeShellBlue",2,1],["CUP_15Rnd_9x19_M9",3,15]]],
	["CUP_V_B_RRV_TL_CB",[["CUP_30Rnd_556x45_Stanag",7,30],["MiniGrenade",2,1]]],
	[],
	"CUP_H_FR_BoonieMARPAT",
	"",
	["Rangefinder","","","",[],[],""],
	["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch","CUP_NVG_PVS7"]
];

private _marksman =
[
	["CUP_srifle_M110_black","CUP_muzzle_snds_M110_black","","CUP_optic_SB_11_4x20_PM",["CUP_20Rnd_762x51_B_M110",20],[],"CUP_bipod_VLTOR_Modpod_black"],
	[],
	["CUP_hgun_M9","CUP_muzzle_snds_M9","","",["CUP_15Rnd_9x19_M9",15],[],""],
	["CUP_U_B_USMC_MCCUU_gloves",[["FirstAidKit",1],["SmokeShellBlue",2,1],["CUP_15Rnd_9x19_M9",3,15]]],
	["CUP_V_B_RRV_Officer_CB",[["CUP_20Rnd_762x51_B_M110",7,20],["MiniGrenade",2,1]]],
	[],
	"CUP_H_FR_BoonieMARPAT",
	"",
	[],
	["ItemMap","","ItemRadio","ItemCompass","ItemWatch","CUP_NVG_PVS7"]
];

private _paramedic =
[
	["CUP_arifle_M4A1_standard_black","CUP_muzzle_snds_M16","acc_pointer_IR","CUP_optic_ACOG",["CUP_30Rnd_556x45_Stanag",30],[],""],
	[],
	["CUP_hgun_M9","CUP_muzzle_snds_M9","","",["CUP_15Rnd_9x19_M9",15],[],""],
	["CUP_U_B_USMC_MCCUU",[["FirstAidKit",1],["SmokeShellBlue",2,1],["11Rnd_45ACP_Mag",3,11]]],
	["CUP_V_B_RRV_Medic_CB",[["CUP_30Rnd_556x45_Stanag",7,30]]],
	["CUP_B_USMC_AssaultPack_Medic",[["Medikit",1],["FirstAidKit",5]]],
	"CUP_H_FR_BoonieMARPAT",
	"",
	[],
	["ItemMap","","ItemRadio","ItemCompass","ItemWatch","CUP_NVG_PVS7"]
];

private _scout =
[
	["CUP_arifle_M4A1_standard_black","CUP_muzzle_snds_M16","acc_pointer_IR","CUP_optic_ACOG",["CUP_30Rnd_556x45_Stanag",30],[],""],
	[],
	["CUP_hgun_M9","CUP_muzzle_snds_M9","","",["CUP_15Rnd_9x19_M9",15],[],""],
	["CUP_U_B_USMC_MCCUU_gloves",[["FirstAidKit",1],["SmokeShellBlue",2,1],["11Rnd_45ACP_Mag",3,11]]],
	["CUP_V_B_RRV_Scout_CB",[["CUP_30Rnd_556x45_Stanag",7,30],["MiniGrenade",2,1]]],
	[],
	"CUP_H_FR_BoonieMARPAT",
	"",
	[],
	["ItemMap","","ItemRadio","ItemCompass","ItemWatch","CUP_NVG_PVS7"]
];

_newGrp = createGroup west;

// Team leader
_unit01 = _newGrp createUnit ["CUP_B_FR_Soldier_TL", [_axisX,_axisY,0], [], 0, "CAN_COLLIDE"];
_unit01 setPosASL [_axisX,_axisY,0];
_unit01 setSkill 0.75;
_unit01 setSkill ["AimingAccuracy",0.5];
_unit01 setUnitLoadout _leader;

// Marksman
_unit02 = _newGrp createUnit ["CUP_B_FR_Soldier_Marksman", [_axisX + 1,_axisY,0], [], 0, "CAN_COLLIDE"];
_unit02 setPosASL [_axisX + 1,_axisY,0];
_unit02 setSkill 0.5;
_unit02 setSkill ["AimingAccuracy",0.5];
_unit02 setUnitLoadout _marksman;

// Paramedic
_unit03 = _newGrp createUnit ["CUP_B_FR_Medic", [_axisX + 2,_axisY,0], [], 0, "CAN_COLLIDE"];
_unit03 setPosASL [_axisX + 1,_axisY,0];
_unit03 setSkill 0.5;
_unit03 setSkill ["AimingAccuracy",0.5];
_unit03 setUnitLoadout _paramedic;

// Scout
_unit04 = _newGrp createUnit ["CUP_B_FR_Saboteur", [_axisX + 3,_axisY,0], [], 0, "CAN_COLLIDE"];
_unit04 setPosASL [_axisX + 2,_axisY,0];
_unit04 setSkill 0.5;
_unit04 setSkill ["AimingAccuracy",0.5];
_unit04 setUnitLoadout _scout;

// Enable Dynamic simulation
_newGrp enableDynamicSimulation true;

// If it's night, use NVS scopes instead
if !((dayTime > 4.5) and (dayTime < 20)) then {
	{_x setUnitLoadout [[nil,nil,nil,"optic_nvs",nil,nil,nil],nil,nil,nil,nil,nil,nil,nil,nil,nil]} forEach (units _newGrp);
};

sleep (30 + (random 30));

// Stalk players
waitUntil {sleep 5; simulationEnabled (leader _newGrp)};

_stalk = [_newGrp,group (allPlayers select 0)] spawn BIS_fnc_stalk;
{_x disableAI "Autocombat"} forEach (units _newGrp);
_newGrp setBehaviour "Stealth";
_newGrp setCombatMode "Red";
