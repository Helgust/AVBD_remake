// Create diary for each player
_null = player createDiaryRecord ["Diary", [localize "str_a3_diary_execution_title", format ["%1%4%2%4%3%4%5",localize "STR_A3_EscapeFromTanoa_execution01",format [localize "str_hlg_escapefromchernarus_execution02","</marker>", "<marker name = 'HLG_mrkNW'>","<marker name = 'HLG_mrkKrasnostav'>","<marker name = 'HLG_mrkOstrov'>","<marker name = 'HLG_mrkCherno'>","<marker name = 'HLG_mrkElectro'>"],localize "STR_A3_EscapeFromTanoa_execution03","<br /><br />"]]];

player enableStamina false;
// Add respawn tickets if set to individual unit
if (missionNamespace getVariable "BIS_respawnTickets" == 0) then {[player,1] call BIS_fnc_respawnTickets};
if (missionNamespace getVariable "BIS_respawnTickets" == 1) then {[player,2] call BIS_fnc_respawnTickets};
if (missionNamespace getVariable "BIS_respawnTickets" == 2) then {[player,3] call BIS_fnc_respawnTickets};
if (missionNamespace getVariable "BIS_respawnTickets" == 3) then {[player,4] call BIS_fnc_respawnTickets};
if (missionNamespace getVariable "BIS_respawnTickets" == 4) then {[player,5] call BIS_fnc_respawnTickets};
if (missionNamespace getVariable "BIS_respawnTickets" == 5) then {[player,6] call BIS_fnc_respawnTickets};
if (missionNamespace getVariable "BIS_respawnTickets" == 10) then {[player,11] call BIS_fnc_respawnTickets};

// Handle JIP respawn
missionNamespace setVariable ["_initialRespawn", addMissionEventHandler ["PreloadFinished",
{
	removeMissionEventHandler ["PreloadFinished", missionNamespace getVariable ["_initialRespawn", -1]];
	missionNamespace setVariable ["_initialRespawn", nil];

	if (didJIP and (time > 30)) then
	{
		player enableSimulationGlobal false;
		player enableSimulation false;
		player hideObjectGlobal true;
		player hideObject true;
		forceRespawn player;
		deleteVehicle player;
	};
}]];


//player fog
[player,200,10,10,3,6,-0.3,0.1,0.3,1,1,1,30,10,15,true,0.4,0.5,0.025,0,0,0,0,24] execFSM "Fog.fsm";
//play ost
//[1,["auldale",0,323,0.35],["cradle",0,367,0.35],["kurshok",0,210,0.35],["pavelock",0,121,0.35],["oldquarter",0,257,0.35]] execVM "cly_jukebox.sqf";
//handel color correction 
hndl = ppEffectCreate ["colorCorrections", 1501]; 
hndl ppEffectAdjust [1, 1.15, 0, [0.0, 0.0, 0.0, 0.0], [0.5, 0.8, 0.9, 0.5],  [0.199, 0.8, 0.114, 0.0]];  
hndl ppEffectCommit 0;  
hndl ppEffectEnable true;

// Set available loadout
if (typeOf player == "CUP_O_INS_Officer") then {
	if (BIS_loadoutLevel == 0) then {[player,"CUP_O_INS_Officer"] call BIS_fnc_addRespawninventory; player setUnitLoadout [["CUP_arifle_AKS74U_railed","","acc_flashlight","",["CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M",30],[],""],[],["CUP_hgun_Makarov","","","",["CUP_8Rnd_9x18_Makarov_M",8],[],""],["CUP_U_C_Policeman_01",[["FirstAidKit",1],["SmokeShell",2,1],["CUP_8Rnd_9x18_Makarov_M",2,8]]],["CUP_V_C_Police_Holster",[["CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M",3,30],["CUP_HandGrenade_RGD5",2,1]]],["CUP_B_CivPack_WDL",[["CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M",4,30]]],"CUP_H_C_Policecap_01",nil,["Rangefinder","","","",[],[],""],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]};
	if (BIS_loadoutLevel == 1) then {[player,"CUP_O_INS_Officer_L"] call BIS_fnc_addRespawninventory; player setUnitLoadout [["CUP_arifle_AKS74U_railed","","acc_flashlight","",["CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M",30],[],""],[],["CUP_hgun_Makarov","","","",["CUP_8Rnd_9x18_Makarov_M",8],[],""],["CUP_U_C_Policeman_01",[["FirstAidKit",1],["SmokeShell",2,1],["CUP_8Rnd_9x18_Makarov_M",2,8]]],["CUP_V_C_Police_Holster",[["CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M",3,30],["CUP_HandGrenade_RGD5",2,1]]],["CUP_B_CivPack_WDL",[]],"CUP_H_C_Policecap_01",nil,["Binocular","","","",[],[],""],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]};
	if (BIS_loadoutLevel == 2) then {[player,"CUP_O_INS_Officer_S"] call BIS_fnc_addRespawninventory; player setUnitLoadout [["CUP_arifle_AKS74U_railed","","acc_flashlight","",["CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M",30],[],""],[],["CUP_hgun_Makarov","","","",["CUP_8Rnd_9x18_Makarov_M",8],[],""],["CUP_U_C_Policeman_01",[["FirstAidKit",1],["SmokeShell",2,1],["CUP_8Rnd_9x18_Makarov_M",2,8]]],["CUP_V_C_Police_Holster",[["CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M",1,30],["CUP_HandGrenade_RGD5",2,1]]],["CUP_B_CivPack_WDL",[]],"CUP_H_C_Policecap_01",nil,["Binocular","","","",[],[],""],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]};
};

if (typeOf player == "CUP_O_INS_Sniper") then {
	if (BIS_loadoutLevel == 0) then {[player,"CUP_O_INS_Sniper"] call BIS_fnc_addRespawninventory; player setUnitLoadout [["CUP_srifle_CZ550","","acc_flashlight","optic_dms",["CUP_5x_22_LR_17_HMR_M",10],[],"bipod_01_F_blk"],[],["CUP_hgun_M9A1","","acc_flashlight_pistol","",["CUP_15Rnd_9x19_M9",15],[],""],["CUP_U_C_Woodlander_02",[["FirstAidKit",1],["SmokeShell",2,1],["CUP_15Rnd_9x19_M9",2,15]]],[],["B_TacticalPack_blk",[["CUP_8Rnd_762x25_TT",1,15],["CUP_5x_22_LR_17_HMR_M",11,10],["CUP_HandGrenade_RGD5",2,1]]],"CUP_H_C_Ushanka_04",nil,["Rangefinder","","","",[],[],""],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]};
	if (BIS_loadoutLevel == 1) then {[player,"CUP_O_INS_Sniper_L"] call BIS_fnc_addRespawninventory; player setUnitLoadout [["CUP_srifle_CZ550","","acc_flashlight","optic_dms",["CUP_5x_22_LR_17_HMR_M",10],[],"bipod_01_F_blk"],[],["CUP_hgun_M9A1","","acc_flashlight_pistol","",["CUP_15Rnd_9x19_M9",15],[],""],["CUP_U_C_Woodlander_02",[["FirstAidKit",1],["SmokeShell",2,1],["CUP_15Rnd_9x19_M9",2,15]]],[],["B_TacticalPack_blk",[["CUP_8Rnd_762x25_TT",1,15],["CUP_5x_22_LR_17_HMR_M",5,10],["CUP_HandGrenade_RGD5",2,1]]],"CUP_H_C_Ushanka_04",nil,["Binocular","","","",[],[],""],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]};
	if (BIS_loadoutLevel == 2) then {[player,"CUP_O_INS_Sniper_S"] call BIS_fnc_addRespawninventory; player setUnitLoadout [["CUP_srifle_CZ550","","acc_flashlight","",["CUP_5x_22_LR_17_HMR_M",10],[],"bipod_01_F_blk"],[],["CUP_hgun_M9A1","","acc_flashlight_pistol","",["CUP_15Rnd_9x19_M9",15],[],""],["CUP_U_C_Woodlander_02",[["FirstAidKit",1],["SmokeShell",2,1],["CUP_15Rnd_9x19_M9",2,15]]],[],["B_TacticalPack_blk",[["CUP_15Rnd_9x19_M9",1,15],["CUP_5x_22_LR_17_HMR_M",2,10],["CUP_HandGrenade_RGD5",2,1]]],"CUP_H_C_Ushanka_04",nil,[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]};
};

if (typeOf player == "CUP_O_INS_Soldier_AR") then {
	if (BIS_loadoutLevel == 0) then {[player,"CUP_O_INS_Soldier_AR"] call BIS_fnc_addRespawninventory; player setUnitLoadout [["CUP_arifle_RPK74","","acc_flashlight","",["CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M",75],[],""],[],["CUP_hgun_Makarov","","","",["CUP_8Rnd_9x18_Makarov_M",8],[],""],["CUP_U_B_CDF_SNW_2",[["FirstAidKit",1],["SmokeShell",2,1],["CUP_8Rnd_9x18_Makarov_M",2,8]]],["CUP_V_O_Ins_Carrier_Rig_MG",[["CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M",3,75],["HandGrenade",2,1]]],["CUP_B_HikingPack_Civ",[["CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M",3,75]]],"CUP_H_CDF_OfficerCap_SNW",nil,[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]};
	if (BIS_loadoutLevel == 1) then {[player,"CUP_O_INS_Soldier_AR_L"] call BIS_fnc_addRespawninventory; player setUnitLoadout [["CUP_arifle_RPK74","","acc_flashlight","",["CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M",75],[],""],[],["CUP_hgun_Makarov","","","",["CUP_8Rnd_9x18_Makarov_M",8],[],""],["CUP_U_B_CDF_SNW_2",[["FirstAidKit",1],["SmokeShell",2,1],["CUP_8Rnd_9x18_Makarov_M",2,8]]],["CUP_V_O_Ins_Carrier_Rig_MG",[["CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M",3,75],["HandGrenade",2,1]]],["CUP_B_HikingPack_Civ",[]],"CUP_H_CDF_OfficerCap_SNW",nil,[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]};
	if (BIS_loadoutLevel == 2) then {[player,"CUP_O_INS_Soldier_AR_S"] call BIS_fnc_addRespawninventory; player setUnitLoadout [["CUP_arifle_RPK74","","acc_flashlight","",["CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M",75],[],""],[],["CUP_hgun_Makarov","","","",["CUP_8Rnd_9x18_Makarov_M",8],[],""],["CUP_U_B_CDF_SNW_2",[["FirstAidKit",1],["SmokeShell",2,1],["CUP_8Rnd_9x18_Makarov_M",2,8]]],["CUP_V_O_Ins_Carrier_Rig_MG",[["CUP_HandGrenade_RGD5",2,1]]],[],"CUP_H_CDF_OfficerCap_SNW",nil,["CUP_B_HikingPack_Civ",[]],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]};
};

if (typeOf player == "CUP_O_INS_Soldier_GL") then {
	if (BIS_loadoutLevel == 0) then {[player,"CUP_O_INS_Soldier_GL"] call BIS_fnc_addRespawninventory; player setUnitLoadout [["CUP_glaunch_M79","","","",["1Rnd_HE_Grenade_shell",1],["1Rnd_HE_Grenade_shell",1],""],[],["CUP_hgun_MP7","","acc_flashlight","",["CUP_40Rnd_46x30_MP7_Green_Tracer",40],[],""],["CUP_U_O_CHDKZ_Lopotev",[["FirstAidKit",1],["SmokeShell",2,1],["CUP_40Rnd_46x30_MP7_Green_Tracer",2,40]]],["CUP_V_O_Ins_Carrier_Rig",[["CUP_40Rnd_46x30_MP7_Green_Tracer",7,40],["CUP_HandGrenade_RGD5",2,1],["1Rnd_HE_Grenade_shell",11,1]]],[],[],"G_Balaclava_blk",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]};
	if (BIS_loadoutLevel == 1) then {[player,"CUP_O_INS_Soldier_GL_L"] call BIS_fnc_addRespawninventory; player setUnitLoadout [["CUP_glaunch_M79","","","",["1Rnd_HE_Grenade_shell",1],["1Rnd_HE_Grenade_shell",1],""],[],["CUP_hgun_MP7","","acc_flashlight","",["CUP_40Rnd_46x30_MP7_Green_Tracer",40],[],""],["CUP_U_O_CHDKZ_Lopotev",[["FirstAidKit",1],["SmokeShell",2,1],["CUP_40Rnd_46x30_MP7_Green_Tracer",2,40]]],["CUP_V_O_Ins_Carrier_Rig",[["CUP_40Rnd_46x30_MP7_Green_Tracer",3,40],["CUP_HandGrenade_RGD5",2,1],["1Rnd_HE_Grenade_shell",5,1]]],[],[],"G_Balaclava_blk",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]};
	if (BIS_loadoutLevel == 2) then {[player,"CUP_O_INS_Soldier_GL_S"] call BIS_fnc_addRespawninventory; player setUnitLoadout [["CUP_glaunch_M79","","","",["1Rnd_HE_Grenade_shell",1],["1Rnd_HE_Grenade_shell",1],""],[],["CUP_hgun_MP7","","acc_flashlight","",["CUP_40Rnd_46x30_MP7_Green_Tracer",40],[],""],["CUP_U_O_CHDKZ_Lopotev",[["FirstAidKit",1],["SmokeShell",2,1],["CUP_40Rnd_46x30_MP7_Green_Tracer",2,40]]],["CUP_V_O_Ins_Carrier_Rig",[["CUP_40Rnd_46x30_MP7_Green_Tracer",1,40],["CUP_HandGrenade_RGD5",2,1],["1Rnd_HE_Grenade_shell",2,1]]],[],[],"G_Balaclava_blk",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]};
};

if (typeOf player == "CUP_O_INS_Soldier") then {
	if (BIS_loadoutLevel == 0) then {[player,"CUP_O_INS_Soldier"] call BIS_fnc_addRespawninventory; player setUnitLoadout [["CUP_smg_vityaz_vfg","","acc_flashlight","",["CUP_30Rnd_9x19AP_Vityaz",64],[],""],[],["CUP_hgun_TT","","","",["CUP_8Rnd_762x25_TT",8],[],""],["CUP_U_C_Worker_04",[["FirstAidKit",1],["SmokeShell",2,1],["CUP_8Rnd_762x25_TT",2,8]]],["V_Chestrig_khk",[["CUP_30Rnd_9x19AP_Vityaz",7,64],["CUP_HandGrenade_RGD5",2,1]]],[],"H_StrawHat_dark",nil,[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]};
	if (BIS_loadoutLevel == 1) then {[player,"CUP_O_INS_Soldier_L"] call BIS_fnc_addRespawninventory; player setUnitLoadout [["CUP_smg_vityaz_vfg","","acc_flashlight","",["CUP_30Rnd_9x19AP_Vityaz",64],[],""],[],["CUP_hgun_TT","","","",["CUP_8Rnd_762x25_TT",8],[],""],["CUP_U_C_Worker_04",[["FirstAidKit",1],["SmokeShell",2,1],["CUP_8Rnd_762x25_TT",2,8]]],["V_Chestrig_khk",[["CUP_30Rnd_9x19AP_Vityaz",3,64],["CUP_HandGrenade_RGD5",2,1]]],[],"H_StrawHat_dark",nil,[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]};
	if (BIS_loadoutLevel == 2) then {[player,"CUP_O_INS_Soldier_S"] call BIS_fnc_addRespawninventory; player setUnitLoadout [["CUP_smg_vityaz_vfg","","acc_flashlight","",["CUP_30Rnd_9x19AP_Vityaz",64],[],""],[],["CUP_hgun_TT","","","",["CUP_8Rnd_762x25_TT",8],[],""],["CUP_U_C_Worker_04",[["FirstAidKit",1],["SmokeShell",2,1],["CUP_8Rnd_762x25_TT",2,8]]],["V_Chestrig_khk",[["CUP_30Rnd_9x19AP_Vityaz",1,64],["CUP_HandGrenade_RGD5",2,1]]],[],"H_StrawHat_dark",nil,[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]};
};

if (typeOf player == "CUP_O_INS_Soldier_LAT") then {
	if (BIS_loadoutLevel == 0) then {[player,"CUP_U_INS_Soldier_LAT"] call BIS_fnc_addRespawninventory; player setUnitLoadout [["CUP_srifle_M14","","acc_flashlight","",["CUP_20Rnd_TE1_Green_Tracer_762x51_DMR",20],[],""],["CUP_launch_RPG7V","","","",["CUP_PG7VM_M",1],[],""],["CUP_hgun_TT","","","",["CUP_8Rnd_762x25_TT",8],[],""],["CUP_U_B_CDF_FST_2",[["FirstAidKit",1],["CUP_8Rnd_762x25_TT",2,8],["SmokeShell",2,1]]],["CUP_V_O_Ins_Carrier_Rig",[["CUP_20Rnd_TE1_Green_Tracer_762x51_DMR",9,20],["CUP_HandGrenade_RGD5",2,1]]],["B_FieldPack_ocamo",[["CUP_PG7VM_M",1,1]]],"H_Bandanna_khk",nil,[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]};
	if (BIS_loadoutLevel == 1) then {[player,"CUP_U_INS_Soldier_LAT_L"] call BIS_fnc_addRespawninventory; player setUnitLoadout [["CUP_srifle_M14","","acc_flashlight","",["CUP_20Rnd_TE1_Green_Tracer_762x51_DMR",20],[],""],["CUP_launch_RPG7V","","","",["CUP_PG7VM_M",1],[],""],["CUP_hgun_TT","","","",["CUP_8Rnd_762x25_TT",8],[],""],["CUP_U_B_CDF_FST_2",[["FirstAidKit",1],["CUP_8Rnd_762x25_TT",2,8],["SmokeShell",2,1]]],["CUP_V_O_Ins_Carrier_Rig",[["CUP_20Rnd_TE1_Green_Tracer_762x51_DMR",4,20],["CUP_HandGrenade_RGD5",2,1]]],["B_FieldPack_ocamo",[["CUP_PG7VM_M",1,1]]],"H_Bandanna_khk",nil,[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]};
	if (BIS_loadoutLevel == 2) then {[player,"CUP_U_INS_Soldier_LAT_S"] call BIS_fnc_addRespawninventory; player setUnitLoadout [["CUP_srifle_M14","","acc_flashlight","",["CUP_20Rnd_TE1_Green_Tracer_762x51_DMR",20],[],""],["CUP_launch_RPG7V","","","",["CUP_PG7VM_M",1],[],""],["CUP_hgun_TT","","","",["CUP_8Rnd_762x25_TT",8],[],""],["CUP_U_B_CDF_FST_2",[["FirstAidKit",1],["CUP_8Rnd_762x25_TT",2,8],["SmokeShell",2,1]]],["CUP_V_O_Ins_Carrier_Rig",[["CUP_20Rnd_TE1_Green_Tracer_762x51_DMR",2,20],["CUP_HandGrenade_RGD5",2,1]]],["B_FieldPack_ocamo",[["CUP_PG7VM_M",1,1]]],"H_Bandanna_khk",nil,[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]};
};

if (typeOf player == "CUP_O_INS_Soldier_Engineer") then {
	if (BIS_loadoutLevel == 0) then {[player,"CUP_O_INS_Soldier_Engineer"] call BIS_fnc_addRespawninventory; player setUnitLoadout [["CUP_arifle_SR3M_Vikhr_VFG","","acc_flashlight","",["CUP_30Rnd_9x39_SP5_VIKHR_M",30],[],""],[],["CUP_hgun_TT","","","",["CUP_8Rnd_762x25_TT",8],[],""],["CUP_U_C_Woodlander_04",[["FirstAidKit",1],["SmokeShell",2,1],["CUP_8Rnd_762x25_TT",2,8]]],["CUP_V_O_Ins_Carrier_Rig",[["CUP_30Rnd_9x39_SP5_VIKHR_M",7,30]]],["B_Kitbag_rgr",[["ToolKit",1],["MineDetector",1],["DemoCharge_Remote_Mag",2,1]]],"H_Cap_blk",nil,[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]};
	if (BIS_loadoutLevel == 1) then {[player,"CUP_O_INS_Soldier_Engineer_L"] call BIS_fnc_addRespawninventory; player setUnitLoadout [["CUP_arifle_SR3M_Vikhr_VFG","","acc_flashlight","",["CUP_30Rnd_9x39_SP5_VIKHR_M",30],[],""],[],["CUP_hgun_TT","","","",["CUP_8Rnd_762x25_TT",8],[],""],["CUP_U_C_Woodlander_04",[["FirstAidKit",1],["SmokeShell",2,1],["CUP_8Rnd_762x25_TT",2,8]]],["CUP_V_O_Ins_Carrier_Rig",[["CUP_30Rnd_9x39_SP5_VIKHR_M",3,30]]],["B_Kitbag_rgr",[["ToolKit",1],["MineDetector",1],["DemoCharge_Remote_Mag",2,1]]],"H_Cap_blk",nil,[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]};
	if (BIS_loadoutLevel == 2) then {[player,"CUP_O_INS_Soldier_Engineer_S"] call BIS_fnc_addRespawninventory; player setUnitLoadout [["CUP_arifle_SR3M_Vikhr_VFG","","acc_flashlight","",["CUP_30Rnd_9x39_SP5_VIKHR_M",30],[],""],[],["CUP_hgun_TT","","","",["CUP_8Rnd_762x25_TT",8],[],""],["CUP_U_C_Woodlander_04",[["FirstAidKit",1],["SmokeShell",2,1],["CUP_8Rnd_762x25_TT",2,8]]],["CUP_V_O_Ins_Carrier_Rig",[["CUP_30Rnd_9x39_SP5_VIKHR_M",1,30]]],["B_Kitbag_rgr",[["ToolKit",1],["MineDetector",1],["DemoCharge_Remote_Mag",2,1]]],"H_Cap_blk",nil,[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]};
};

if (typeOf player == "CUP_O_INS_Medic") then {
	if (BIS_loadoutLevel == 0) then {[player,"CUP_O_INS_Medic"] call BIS_fnc_addRespawninventory; player setUnitLoadout [["CUP_arifle_SAIGA_MK03","","acc_flashlight","",["CUP_10Rnd_762x39_SaigaMk03_M",10],[],""],[],["CUP_hgun_TT","","","",["CUP_8Rnd_762x25_TT",8],[],""],["U_Marshal",[["FirstAidKit",1],["SmokeShellBlue",4,1],["CUP_8Rnd_762x25_TT",2,8]]],["V_BandollierB_rgr",[["CUP_10Rnd_762x39_SaigaMk03_M",12,10]]],["B_FieldPack_oli",[["Medikit",1]]],"H_Cap_red",nil,[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]};
	if (BIS_loadoutLevel == 1) then {[player,"CUP_O_INS_Medic_L"] call BIS_fnc_addRespawninventory; player setUnitLoadout [["CUP_arifle_SAIGA_MK03","","acc_flashlight","",["CUP_10Rnd_762x39_SaigaMk03_M",10],[],""],[],["CUP_hgun_TT","","","",["CUP_8Rnd_762x25_TT",8],[],""],["U_Marshal",[["FirstAidKit",1],["SmokeShellBlue",4,1],["CUP_8Rnd_762x25_TT",2,8]]],["V_BandollierB_rgr",[["CUP_10Rnd_762x39_SaigaMk03_M",6,10]]],["B_FieldPack_oli",[["Medikit",1]]],"H_Cap_red",nil,[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]};
	if (BIS_loadoutLevel == 2) then {[player,"CUP_O_INS_Medic_S"] call BIS_fnc_addRespawninventory; player setUnitLoadout [["CUP_arifle_SAIGA_MK03","","acc_flashlight","",["CUP_10Rnd_762x39_SaigaMk03_M",10],[],""],[],["CUP_hgun_TT","","","",["CUP_8Rnd_762x25_TT",8],[],""],["U_Marshal",[["FirstAidKit",1],["SmokeShellBlue",4,1],["CUP_8Rnd_762x25_TT",2,8]]],["V_BandollierB_rgr",[["CUP_10Rnd_762x39_SaigaMk03_M",3,10]]],["B_FieldPack_oli",[["Medikit",1]]],"H_Cap_red",nil,[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]};
};
