class CfgRoles
{
	class Assault
	{
		displayName = $STR_A3_Role_Assault;
		icon = "a3\missions_f_exp\data\img\classes\assault_ca.paa";
	};
	class Support
	{
		displayName = $STR_A3_Role_Support;
		icon = "a3\missions_f_exp\data\img\classes\support_ca.paa";
	};
	class Recon
	{
		displayName = $STR_A3_Role_Recon;
		icon = "a3\missions_f_exp\data\img\classes\recon_ca.paa";
	};
};

class CfgRespawnInventory
{
	//*******************
	// Standard equipment
	//*******************
	class CUP_O_INS_Officer
	{
		displayName = $STR_b_soldier_sl_f0;
		role = "Assault";
		icon = "\A3\ui_f\data\map\VehicleIcons\iconManLeader_ca.paa";
		show = "side group _this == east";
		weapons[] = {
			"CUP_arifle_AKS74U_railed",
			"Rangefinder",
			"CUP_hgun_Makarov"
		};
		magazines[] = {
			"SmokeShell",
			"SmokeShell",
			"CUP_8Rnd_9x18_Makarov_M",
			"CUP_8Rnd_9x18_Makarov_M",
			"CUP_8Rnd_9x18_Makarov_M",
			"CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M",
			"CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M",
			"CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M",
			"CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M",
			"CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M",
			"CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M",
			"CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M",
			"CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M",
			"CUP_HandGrenade_RGD5",
			"CUP_HandGrenade_RGD5"
		};
		items[] = {
			"FirstAidKit"
		};
		linkedItems[] = {
			"CUP_V_C_Police_Holster",
			"CUP_H_C_Policecap_01",
			"acc_flashlight",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio"
		};
		uniformClass = "CUP_U_C_Policeman_01";
		backpack = "CUP_B_CivPack_WDL";
	};
	class CUP_O_INS_Sniper
	{
		displayName = $STR_b_soldier_m_f0;
		role = "Assault";
		icon = "\A3\ui_f\data\map\VehicleIcons\iconMan_ca.paa";
		show = "side group _this == east";
		weapons[] = {
			"CUP_srifle_CZ550",
			"Rangefinder",
			"CUP_hgun_M9A1"
		};
		magazines[] = {
			"SmokeShell",
			"SmokeShell",
			"CUP_15Rnd_9x19_M9",
			"CUP_15Rnd_9x19_M9",
			"CUP_15Rnd_9x19_M9",
			"CUP_5x_22_LR_17_HMR_M",
			"CUP_5x_22_LR_17_HMR_M",
			"CUP_5x_22_LR_17_HMR_M",
			"CUP_5x_22_LR_17_HMR_M",
			"CUP_5x_22_LR_17_HMR_M",
			"CUP_5x_22_LR_17_HMR_M",
			"CUP_5x_22_LR_17_HMR_M",
			"CUP_5x_22_LR_17_HMR_M",
			"CUP_5x_22_LR_17_HMR_M",
			"CUP_5x_22_LR_17_HMR_M",
			"CUP_5x_22_LR_17_HMR_M",
			"CUP_5x_22_LR_17_HMR_M",
			"CUP_HandGrenade_RGD5",
			"CUP_HandGrenade_RGD5"
		};
		items[] = {
			"FirstAidKit"
		};
		linkedItems[] = {
			"CUP_H_C_Ushanka_04",
			"optic_dms",
			"bipod_02_F_blk",
			"acc_flashlight_pistol",
			"acc_flashlight",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio"
		};
		uniformClass = "CUP_U_C_Woodlander_02";
		backpack = "B_TacticalPack_blk"
	};
	class CUP_O_INS_Soldier_AR
	{
		displayName = $STR_b_soldier_ar_f0;
		role = "Assault";
		icon = "\A3\ui_f\data\map\VehicleIcons\iconManMG_ca.paa";
		show = "side group _this == east";
		weapons[] = {
			"CUP_arifle_RPK74",
			"CUP_hgun_Makarov"
		};
		magazines[] = {
			"SmokeShell",
			"SmokeShell",
			"CUP_8Rnd_9x18_Makarov_M",
			"CUP_8Rnd_9x18_Makarov_M",
			"CUP_8Rnd_9x18_Makarov_M",
			"CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M",
			"CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M",
			"CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M",
			"CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M",
			"CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M",
			"CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M",
			"CUP_HandGrenade_RGD5",
			"CUP_HandGrenade_RGD5"
		};
		items[] = {
			"FirstAidKit"
		};
		linkedItems[] = {
			"CUP_V_O_Ins_Carrier_Rig_MG",
			"CUP_H_CDF_OfficerCap_SNW",
			"acc_flashlight",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio"
		};
		uniformClass = "CUP_U_B_CDF_SNW_2";
		backpack = "CUP_B_HikingPack_Civ";
	};
	class CUP_O_INS_Soldier_GL
	{
		displayName = $STR_b_soldier_gl_f0;
		role = "Assault";
		icon = "\A3\ui_f\data\map\VehicleIcons\iconMan_ca.paa";
		show = "side group _this == east";
		weapons[] = {
			"CUP_glaunch_M79",
			"CUP_hgun_MP7"
		};
		magazines[] = {
			"SmokeShell",
			"SmokeShell",
			"CUP_40Rnd_46x30_MP7_Green_Tracer",
			"CUP_40Rnd_46x30_MP7_Green_Tracer",
			"CUP_40Rnd_46x30_MP7_Green_Tracer",
			"CUP_40Rnd_46x30_MP7_Green_Tracer",
			"CUP_40Rnd_46x30_MP7_Green_Tracer",
			"CUP_40Rnd_46x30_MP7_Green_Tracer",
			"CUP_40Rnd_46x30_MP7_Green_Tracer",
			"CUP_HandGrenade_RGD5",
			"CUP_HandGrenade_RGD5",
			"1Rnd_HE_Grenade_shell",
			"1Rnd_HE_Grenade_shell",
			"1Rnd_HE_Grenade_shell",
			"1Rnd_HE_Grenade_shell",
			"1Rnd_HE_Grenade_shell",
			"1Rnd_HE_Grenade_shell",
			"1Rnd_HE_Grenade_shell",
			"1Rnd_HE_Grenade_shell",
			"1Rnd_HE_Grenade_shell",
			"1Rnd_HE_Grenade_shell",
			"1Rnd_HE_Grenade_shell",
			"1Rnd_HE_Grenade_shell"
		};
		items[] = {
			"FirstAidKit"
		};
		linkedItems[] = {
			"CUP_V_O_Ins_Carrier_Rig",
			"G_Balaclava_blk",
			"acc_flashlight",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio"
		};
		uniformClass = "CUP_U_O_CHDKZ_Lopotev";
	};
	class CUP_O_INS_Soldier
	{
		displayName = $STR_A3_cfgvehicles_b_soldier_f0;
		role = "Assault";
		icon = "\A3\ui_f\data\map\VehicleIcons\iconMan_ca.paa";
		show = "side group _this == east";
		weapons[] = {
			"CUP_smg_vityaz_vfg",
			"CUP_hgun_TT"
		};
		magazines[] = {
			"SmokeShell",
			"SmokeShell",
			"CUP_8Rnd_762x25_TT",
			"CUP_8Rnd_762x25_TT",
			"CUP_8Rnd_762x25_TT",
			"CUP_30Rnd_9x19AP_Vityaz",
			"CUP_30Rnd_9x19AP_Vityaz",
			"CUP_30Rnd_9x19AP_Vityaz",
			"CUP_30Rnd_9x19AP_Vityaz",
			"CUP_30Rnd_9x19AP_Vityaz",
			"CUP_30Rnd_9x19AP_Vityaz",
			"CUP_30Rnd_9x19AP_Vityaz",
			"CUP_30Rnd_9x19AP_Vityaz",
			"CUP_HandGrenade_RGD5",
			"CUP_HandGrenade_RGD5"
		};
		items[] = {
			"FirstAidKit"
		};
		linkedItems[] = {
			"V_Chestrig_khk",
			"H_StrawHat_dark",
			"acc_flashlight",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio"
		};
		uniformClass = "CUP_U_C_Worker_04";
	};
        class CUP_U_INS_Soldier_LAT
	{
		displayName = $STR_b_soldier_lat_f0;
		role = "Assault";
		icon = "\A3\ui_f\data\map\VehicleIcons\iconManAT_ca.paa";
		show = "side group _this == east";
		weapons[] = {
			"CUP_20Rnd_TE1_Green_Tracer_762x51_DMR",
			"CUP_hgun_TT",
			"CUP_launch_RPG7V"
		};
		magazines[] = {
			"SmokeShell",
			"SmokeShell",
			"CUP_8Rnd_762x25_TT",
			"CUP_8Rnd_762x25_TT",
			"CUP_8Rnd_762x25_TT",
			"CUP_20Rnd_TE1_Green_Tracer_762x51_DMR",
			"CUP_20Rnd_TE1_Green_Tracer_762x51_DMR",
			"CUP_20Rnd_TE1_Green_Tracer_762x51_DMR",
			"CUP_20Rnd_TE1_Green_Tracer_762x51_DMR",
			"CUP_20Rnd_TE1_Green_Tracer_762x51_DMR",
			"CUP_20Rnd_TE1_Green_Tracer_762x51_DMR",
			"CUP_20Rnd_TE1_Green_Tracer_762x51_DMR",
			"CUP_20Rnd_TE1_Green_Tracer_762x51_DMR",
			"CUP_20Rnd_TE1_Green_Tracer_762x51_DMR",
			"CUP_20Rnd_TE1_Green_Tracer_762x51_DMR",
			"CUP_HandGrenade_RGD5",
			"CUP_HandGrenade_RGD5",
			"CUP_PG7VM_M",
			"CUP_PG7VM_M"
		};
		items[] = {
			"FirstAidKit"
		};
		linkedItems[] = {
			"CUP_V_O_Ins_Carrier_Rig",
			"H_Bandanna_khk",
			"acc_flashlight",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio"
		};
		uniformClass = "CUP_U_B_CDF_FST_2";
		backpack = "B_FieldPack_ocamo";
	};
        class CUP_O_INS_Soldier_Engineer
	{
		displayName = $STR_b_engineer_f;
		role = "Support";
		icon = "\A3\ui_f\data\map\VehicleIcons\iconManEngineer_ca.paa";
		show = "side group _this == east";
		weapons[] = {
			"CUP_arifle_SR3M_Vikhr_VFG",
			"CUP_hgun_TT"
		};
		magazines[] = {
			"SmokeShell",
			"SmokeShell",
			"CUP_8Rnd_762x25_TT",
			"CUP_8Rnd_762x25_TT",
			"CUP_8Rnd_762x25_TT",
			"CUP_30Rnd_9x39_SP5_VIKHR_M",
			"CUP_30Rnd_9x39_SP5_VIKHR_M",
			"CUP_30Rnd_9x39_SP5_VIKHR_M",
			"CUP_30Rnd_9x39_SP5_VIKHR_M",
			"CUP_30Rnd_9x39_SP5_VIKHR_M",
			"CUP_30Rnd_9x39_SP5_VIKHR_M",
			"CUP_30Rnd_9x39_SP5_VIKHR_M",
			"CUP_30Rnd_9x39_SP5_VIKHR_M",
			"DemoCharge_Remote_Mag",
			"DemoCharge_Remote_Mag"
		};
		items[] = {
			"FirstAidKit",
			"Toolkit",
			"MineDetector"
		};
		linkedItems[] = {
			"CUP_V_O_Ins_Carrier_Rig",
			"H_Cap_blk",
			"acc_flashlight",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio"
		};
		uniformClass = "CUP_U_C_Woodlander_04";
		backpack = "B_Kitbag_rgr";
	};
	class CUP_O_INS_Medic
	{
		displayName = $STR_b_medic_f0;
		role = "Support";
		icon = "\A3\ui_f\data\map\VehicleIcons\iconManMedic_ca.paa";
		show = "side group _this == east";
		weapons[] = {
			"CUP_arifle_SAIGA_MK03",
			"CUP_hgun_TT"
		};
		magazines[] = {
			"SmokeShellRed",
			"SmokeShellRed",
			"SmokeShellRed",
			"SmokeShellRed",
			"CUP_8Rnd_762x25_TT",
			"CUP_8Rnd_762x25_TT",
			"CUP_8Rnd_762x25_TT",
			"CUP_10Rnd_762x39_SaigaMk03_M",
			"CUP_10Rnd_762x39_SaigaMk03_M",
			"CUP_10Rnd_762x39_SaigaMk03_M",
			"CUP_10Rnd_762x39_SaigaMk03_M",
			"CUP_10Rnd_762x39_SaigaMk03_M",
			"CUP_10Rnd_762x39_SaigaMk03_M",
			"CUP_10Rnd_762x39_SaigaMk03_M",
			"CUP_10Rnd_762x39_SaigaMk03_M",
			"CUP_10Rnd_762x39_SaigaMk03_M",
			"CUP_10Rnd_762x39_SaigaMk03_M",
			"CUP_10Rnd_762x39_SaigaMk03_M",
			"CUP_10Rnd_762x39_SaigaMk03_M"
		};
		items[] = {
			"FirstAidKit",
			"Medikit"
		};
		linkedItems[] = {
			"V_BandollierB_rgr",
			"H_Cap_red",
			"acc_flashlight",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio"
		};
		uniformClass = "U_Marshal";
		backpack = "B_FieldPack_oli";
	};
	//******************
	// Limited equipment
	//******************
	class CUP_O_INS_Officer_L
	{
		displayName = $STR_b_soldier_sl_f0;
		role = "Assault";
		icon = "\A3\ui_f\data\map\VehicleIcons\iconManLeader_ca.paa";
		show = "side group _this == east";
		weapons[] = {
			"CUP_arifle_AKS74U_railed",
			"Binocular",
			"CUP_hgun_Makarov"
		};
		magazines[] = {
			"SmokeShell",
			"SmokeShell",
			"CUP_8Rnd_9x18_Makarov_M",
			"CUP_8Rnd_9x18_Makarov_M",
			"CUP_8Rnd_9x18_Makarov_M",
			"CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M",
			"CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M",
			"CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M",
			"CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M",
			"CUP_HandGrenade_RGD5",
			"CUP_HandGrenade_RGD5"
		};
		items[] = {
			"FirstAidKit"
		};
		linkedItems[] = {
			"CUP_V_C_Police_Holster",
			"CUP_H_C_Policecap_01",
			"acc_flashlight",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio"
		};
		uniformClass = "CUP_U_C_Policeman_01";
		backpack = "CUP_B_CivPack_WDL";
	};
	class CUP_O_INS_Sniper_L
	{
		displayName = $STR_b_soldier_m_f0;
		role = "Assault";
		icon = "\A3\ui_f\data\map\VehicleIcons\iconMan_ca.paa";
		show = "side group _this == east";
		weapons[] = {
			"CUP_srifle_CZ550",
			"Binocular",
			"CUP_hgun_M9A1"
		};
		magazines[] = {
			"SmokeShell",
			"SmokeShell",
			"CUP_15Rnd_9x19_M9",
			"CUP_15Rnd_9x19_M9",
			"CUP_15Rnd_9x19_M9",
			"CUP_5x_22_LR_17_HMR_M",
			"CUP_5x_22_LR_17_HMR_M",
			"CUP_5x_22_LR_17_HMR_M",
			"CUP_5x_22_LR_17_HMR_M",
			"CUP_5x_22_LR_17_HMR_M",
			"CUP_5x_22_LR_17_HMR_M",
			"CUP_HandGrenade_RGD5",
			"CUP_HandGrenade_RGD5"
		};
		items[] = {
			"FirstAidKit"
		};
		linkedItems[] = {
			"CUP_H_C_Ushanka_04",
			"optic_dms",
			"bipod_02_F_blk",
			"acc_flashlight",
			"acc_flashlight_pistol",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio"
		};
		uniformClass = "CUP_U_C_Woodlander_02";
		backpack = "B_TacticalPack_blk"
	};
	class CUP_O_INS_Soldier_AR_L
	{
		displayName = $STR_b_soldier_ar_f0;
		role = "Assault";
		icon = "\A3\ui_f\data\map\VehicleIcons\iconManMG_ca.paa";
		show = "side group _this == east";
		weapons[] = {
			"CUP_arifle_RPK74",
			"CUP_hgun_Makarov"
		};
		magazines[] = {
			"SmokeShell",
			"SmokeShell",
			"CUP_8Rnd_9x18_Makarov_M",
			"CUP_8Rnd_9x18_Makarov_M",
			"CUP_8Rnd_9x18_Makarov_M",
			"CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M",
			"CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M",
			"CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M",
			"CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M",
			"CUP_HandGrenade_RGD5",
			"CUP_HandGrenade_RGD5"
		};
		items[] = {
			"FirstAidKit"
		};
		linkedItems[] = {
			"CUP_V_O_Ins_Carrier_Rig_MG",
			"CUP_H_CDF_OfficerCap_SNW",
			"acc_flashlight",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio"
		};
		uniformClass = "CUP_U_B_CDF_SNW_2";
		backpack = "CUP_B_HikingPack_Civ";
	};
	class CUP_O_INS_Soldier_GL_L
	{
		displayName = $STR_b_soldier_gl_f0;
		role = "Assault";
		icon = "\A3\ui_f\data\map\VehicleIcons\iconMan_ca.paa";
		show = "side group _this == east";
		weapons[] = {
			"CUP_glaunch_M79",
			"CUP_hgun_MP7"
		};
		magazines[] = {
			"SmokeShell",
			"SmokeShell",
			"CUP_40Rnd_46x30_MP7_Green_Tracer",
			"CUP_40Rnd_46x30_MP7_Green_Tracer",
			"CUP_40Rnd_46x30_MP7_Green_Tracer",
			"CUP_40Rnd_46x30_MP7_Green_Tracer",
			"CUP_HandGrenade_RGD5",
			"CUP_HandGrenade_RGD5",
			"1Rnd_HE_Grenade_shell",
			"1Rnd_HE_Grenade_shell",
			"1Rnd_HE_Grenade_shell",
			"1Rnd_HE_Grenade_shell",
			"1Rnd_HE_Grenade_shell",
			"1Rnd_HE_Grenade_shell"

		};
		items[] = {
			"FirstAidKit"
		};
		linkedItems[] = {
			"CUP_V_O_Ins_Carrier_Rig",
			"G_Balaclava_blk",
			"acc_flashlight",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio"
		};
		uniformClass = "CUP_U_O_CHDKZ_Lopotev";
	};
	class CUP_O_INS_Soldier_L
	{
		displayName = $STR_A3_cfgvehicles_b_soldier_f0;
		role = "Assault";
		icon = "\A3\ui_f\data\map\VehicleIcons\iconMan_ca.paa";
		show = "side group _this == east";
		weapons[] = {
			"CUP_smg_vityaz_vfg",
			"CUP_hgun_TT"
		};
		magazines[] = {
			"SmokeShell",
			"SmokeShell",
			"CUP_8Rnd_762x25_TT",
			"CUP_8Rnd_762x25_TT",
			"CUP_8Rnd_762x25_TT",
			"CUP_30Rnd_9x19AP_Vityaz",
			"CUP_30Rnd_9x19AP_Vityaz",
			"CUP_30Rnd_9x19AP_Vityaz",
			"CUP_30Rnd_9x19AP_Vityaz",
			"CUP_HandGrenade_RGD5",
			"CUP_HandGrenade_RGD5"
		};
		items[] = {
			"FirstAidKit"
		};
		linkedItems[] = {
			"V_Chestrig_khk",
			"H_StrawHat_dark",
			"acc_flashlight",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio"
		};
		uniformClass = "CUP_U_C_Worker_04";
	};
        class CUP_U_INS_Soldier_LAT_L
	{
		displayName = $STR_b_soldier_lat_f0;
		role = "Assault";
		icon = "\A3\ui_f\data\map\VehicleIcons\iconManAT_ca.paa";
		show = "side group _this == east";
		weapons[] = {
			"CUP_20Rnd_TE1_Green_Tracer_762x51_DMR",
			"CUP_hgun_TT",
			"CUP_launch_RPG7V"
		};
		magazines[] = {
			"SmokeShell",
			"SmokeShell",
			"CUP_8Rnd_762x25_TT",
			"CUP_8Rnd_762x25_TT",
			"CUP_8Rnd_762x25_TT",
			"CUP_20Rnd_TE1_Green_Tracer_762x51_DMR",
			"CUP_20Rnd_TE1_Green_Tracer_762x51_DMR",
			"CUP_20Rnd_TE1_Green_Tracer_762x51_DMR",
			"CUP_20Rnd_TE1_Green_Tracer_762x51_DMR",
			"CUP_20Rnd_TE1_Green_Tracer_762x51_DMR",
			"CUP_20Rnd_TE1_Green_Tracer_762x51_DMR",
			"CUP_20Rnd_TE1_Green_Tracer_762x51_DMR",
			"CUP_20Rnd_TE1_Green_Tracer_762x51_DMR",
			"CUP_HandGrenade_RGD5",
			"CUP_HandGrenade_RGD5",
			"CUP_PG7VM_M",
			"CUP_PG7VM_M"
		};
		items[] = {
			"FirstAidKit"
		};
		linkedItems[] = {
			"CUP_V_O_Ins_Carrier_Rig",
			"H_Bandanna_khk",
			"acc_flashlight",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio"
		};
		uniformClass = "CUP_U_B_CDF_FST_2";
		backpack = "B_FieldPack_ocamo";
	};
        class CUP_O_INS_Soldier_Engineer_L
	{
		displayName = $STR_b_engineer_f;
		role = "Support";
		icon = "\A3\ui_f\data\map\VehicleIcons\iconManEngineer_ca.paa";
		show = "side group _this == east";
		weapons[] = {
			"CUP_arifle_SR3M_Vikhr_VFG",
			"CUP_hgun_TT"
		};
		magazines[] = {
			"SmokeShell",
			"SmokeShell",
			"CUP_8Rnd_762x25_TT",
			"CUP_8Rnd_762x25_TT",
			"CUP_8Rnd_762x25_TT",
			"CUP_30Rnd_9x39_SP5_VIKHR_M",
			"CUP_30Rnd_9x39_SP5_VIKHR_M",
			"CUP_30Rnd_9x39_SP5_VIKHR_M",
			"CUP_30Rnd_9x39_SP5_VIKHR_M",
			"DemoCharge_Remote_Mag",
			"DemoCharge_Remote_Mag"
		};
		items[] = {
			"FirstAidKit",
			"Toolkit",
			"MineDetector"
		};
		linkedItems[] = {
			"CUP_V_O_Ins_Carrier_Rig",
			"H_Cap_blk",
			"acc_flashlight",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio"
		};
		uniformClass = "CUP_U_C_Woodlander_04";
		backpack = "B_Kitbag_rgr";
	};
	class CUP_O_INS_Medic_L
	{
		displayName = $STR_b_medic_f0;
		role = "Support";
		icon = "\A3\ui_f\data\map\VehicleIcons\iconManMedic_ca.paa";
		show = "side group _this == east";
		weapons[] = {
			"CUP_arifle_SAIGA_MK03",
			"CUP_hgun_TT"
		};
		magazines[] = {
			"SmokeShellRed",
			"SmokeShellRed",
			"SmokeShellRed",
			"SmokeShellRed",
			"CUP_8Rnd_762x25_TT",
			"CUP_8Rnd_762x25_TT",
			"CUP_8Rnd_762x25_TT",
			"CUP_10Rnd_762x39_SaigaMk03_M",
			"CUP_10Rnd_762x39_SaigaMk03_M",
			"CUP_10Rnd_762x39_SaigaMk03_M",
			"CUP_10Rnd_762x39_SaigaMk03_M",
			"CUP_10Rnd_762x39_SaigaMk03_M",
			"CUP_10Rnd_762x39_SaigaMk03_M"
		};
		items[] = {
			"FirstAidKit",
			"Medikit"
		};
		linkedItems[] = {
			"V_BandollierB_rgr",
			"H_Cap_red",
			"acc_flashlight",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio"
		};
		uniformClass = "U_Marshal";
		backpack = "B_FieldPack_oli";
	};
	//*********
	// Survivor
	//*********
	class CUP_O_INS_Officer_S
	{
		displayName = $STR_b_soldier_sl_f0;
		role = "Assault";
		icon = "\A3\ui_f\data\map\VehicleIcons\iconManLeader_ca.paa";
		show = "side group _this == east";
		weapons[] = {
			"CUP_arifle_AKS74U_railed",
			"Binocular",
			"CUP_hgun_Makarov"
		};
		magazines[] = {
			"SmokeShell",
			"SmokeShell",
			"CUP_8Rnd_9x18_Makarov_M",
			"CUP_8Rnd_9x18_Makarov_M",
			"CUP_8Rnd_9x18_Makarov_M",
			"CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M",
			"CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M",
			"CUP_HandGrenade_RGD5",
			"CUP_HandGrenade_RGD5"
		};
		items[] = {
			"FirstAidKit"
		};
		linkedItems[] = {
			"CUP_V_C_Police_Holster",
			"CUP_H_C_Policecap_01",
			"acc_flashlight",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio"
		};
		uniformClass = "CUP_U_C_Policeman_01";
		backpack = "CUP_B_CivPack_WDL";
	};
	class CUP_O_INS_Sniper_S
	{
		displayName = $STR_b_soldier_m_f0;
		role = "Assault";
		icon = "\A3\ui_f\data\map\VehicleIcons\iconMan_ca.paa";
		show = "side group _this == east";
		weapons[] = {
			"CUP_srifle_CZ550",
			"Binocular",
			"CUP_hgun_M9A1"
		};
		magazines[] = {
			"SmokeShell",
			"SmokeShell",
			"CUP_15Rnd_9x19_M9",
			"CUP_15Rnd_9x19_M9",
			"CUP_15Rnd_9x19_M9",
			"CUP_5x_22_LR_17_HMR_M",
			"CUP_5x_22_LR_17_HMR_M",
			"CUP_5x_22_LR_17_HMR_M",
			"CUP_HandGrenade_RGD5",
			"CUP_HandGrenade_RGD5"
		};
		items[] = {
			"FirstAidKit"
		};
		linkedItems[] = {
			"CUP_H_C_Ushanka_04",
			"optic_dms",
			"bipod_02_F_blk",
			"acc_flashlight",
			"acc_flashlight_pistol",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio"
		};
		uniformClass = "CUP_U_C_Woodlander_02";
		backpack = "B_TacticalPack_blk"
	};
	class CUP_O_INS_Soldier_AR_S
	{
		displayName = $STR_b_soldier_ar_f0;
		role = "Assault";
		icon = "\A3\ui_f\data\map\VehicleIcons\iconManMG_ca.paa";
		show = "side group _this == east";
		weapons[] = {
			"CUP_arifle_RPK74",
			"CUP_hgun_Makarov"
		};
		magazines[] = {
			"SmokeShell",
			"SmokeShell",
			"CUP_8Rnd_9x18_Makarov_M",
			"CUP_8Rnd_9x18_Makarov_M",
			"CUP_8Rnd_9x18_Makarov_M",
			"CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M",
			"CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M",
			"CUP_HandGrenade_RGD5",
			"CUP_HandGrenade_RGD5"
		};
		items[] = {
			"FirstAidKit"
		};
		linkedItems[] = {
			"CUP_V_O_Ins_Carrier_Rig_MG",
			"CUP_H_CDF_OfficerCap_SNW",
			"acc_flashlight",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio"
		};
		uniformClass = "CUP_U_B_CDF_SNW_2";
		backpack = "CUP_B_HikingPack_Civ";
	};
	class CUP_O_INS_Soldier_GL_S
	{
		displayName = $STR_b_soldier_gl_f0;
		role = "Assault";
		icon = "\A3\ui_f\data\map\VehicleIcons\iconMan_ca.paa";
		show = "side group _this == east";
		weapons[] = {
			"CUP_glaunch_M79",
			"CUP_hgun_MP7"
		};
		magazines[] = {
			"SmokeShell",
			"SmokeShell",
			"CUP_40Rnd_46x30_MP7_Green_Tracer",
			"CUP_40Rnd_46x30_MP7_Green_Tracer",
			"CUP_HandGrenade_RGD5",
			"CUP_HandGrenade_RGD5",
			"1Rnd_HE_Grenade_shell",
			"1Rnd_HE_Grenade_shell",
			"1Rnd_HE_Grenade_shell"
		};
		items[] = {
			"FirstAidKit"
		};
		linkedItems[] = {
			"CUP_V_O_Ins_Carrier_Rig",
			"G_Balaclava_blk",
			"acc_flashlight",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio"
		};
		uniformClass = "CUP_U_O_CHDKZ_Lopotev";
	};
	class CUP_O_INS_Soldier_S
	{
		displayName = $STR_A3_cfgvehicles_b_soldier_f0;
		role = "Assault";
		icon = "\A3\ui_f\data\map\VehicleIcons\iconMan_ca.paa";
		show = "side group _this == east";
		weapons[] = {
			"CUP_smg_vityaz_vfg",
			"CUP_hgun_TT"
		};
		magazines[] = {
			"SmokeShell",
			"SmokeShell",
			"CUP_8Rnd_762x25_TT",
			"CUP_8Rnd_762x25_TT",
			"CUP_8Rnd_762x25_TT",
			"CUP_30Rnd_9x19AP_Vityaz",
			"CUP_30Rnd_9x19AP_Vityaz",
			"CUP_HandGrenade_RGD5",
			"CUP_HandGrenade_RGD5"
		};
		items[] = {
			"FirstAidKit"
		};
		linkedItems[] = {
			"V_Chestrig_khk",
			"H_StrawHat_dark",
			"acc_flashlight",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio"
		};
		uniformClass = "CUP_U_C_Worker_04";
	};
        class CUP_U_INS_Soldier_LAT_S
	{
		displayName = $STR_b_soldier_lat_f0;
		role = "Assault";
		icon = "\A3\ui_f\data\map\VehicleIcons\iconManAT_ca.paa";
		show = "side group _this == east";
		weapons[] = {
			"CUP_20Rnd_TE1_Green_Tracer_762x51_DMR",
			"CUP_hgun_TT",
			"CUP_launch_RPG7V"
		};
		magazines[] = {
			"SmokeShell",
			"SmokeShell",
			"CUP_8Rnd_762x25_TT",
			"CUP_8Rnd_762x25_TT",
			"CUP_8Rnd_762x25_TT",
			"CUP_20Rnd_TE1_Green_Tracer_762x51_DMR",
			"CUP_20Rnd_TE1_Green_Tracer_762x51_DMR",
			"CUP_HandGrenade_RGD5",
			"CUP_HandGrenade_RGD5",
			"CUP_PG7VM_M",
			"CUP_PG7VM_M"
		};
		items[] = {
			"FirstAidKit"
		};
		linkedItems[] = {
			"CUP_V_O_Ins_Carrier_Rig",
			"H_Bandanna_khk",
			"acc_flashlight",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio"
		};
		uniformClass = "CUP_U_B_CDF_FST_2";
		backpack = "B_FieldPack_ocamo";
	};
        class CUP_O_INS_Soldier_Engineer_S
	{
		displayName = $STR_b_engineer_f;
		role = "Support";
		icon = "\A3\ui_f\data\map\VehicleIcons\iconManEngineer_ca.paa";
		show = "side group _this == east";
		weapons[] = {
			"CUP_arifle_SR3M_Vikhr_VFG",
			"CUP_hgun_TT"
		};
		magazines[] = {
			"SmokeShell",
			"SmokeShell",
			"CUP_8Rnd_762x25_TT",
			"CUP_8Rnd_762x25_TT",
			"CUP_8Rnd_762x25_TT",
			"CUP_30Rnd_9x39_SP5_VIKHR_M",
			"CUP_30Rnd_9x39_SP5_VIKHR_M",
			"DemoCharge_Remote_Mag",
			"DemoCharge_Remote_Mag"
		};
		items[] = {
			"FirstAidKit",
			"Toolkit",
			"MineDetector"
		};
		linkedItems[] = {
			"CUP_V_O_Ins_Carrier_Rig",
			"H_Cap_blk",
			"acc_flashlight",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio"
		};
		uniformClass = "CUP_U_C_Woodlander_04";
		backpack = "B_Kitbag_rgr";
	};
	class CUP_O_INS_Medic_S
	{
		displayName = $STR_b_medic_f0;
		role = "Support";
		icon = "\A3\ui_f\data\map\VehicleIcons\iconManMedic_ca.paa";
		show = "side group _this == east";
		weapons[] = {
			"CUP_arifle_SAIGA_MK03",
			"CUP_hgun_TT"
		};
		magazines[] = {
			"SmokeShellRed",
			"SmokeShellRed",
			"SmokeShellRed",
			"SmokeShellRed",
			"CUP_8Rnd_762x25_TT",
			"CUP_8Rnd_762x25_TT",
			"CUP_8Rnd_762x25_TT",
			"CUP_10Rnd_762x39_SaigaMk03_M",
			"CUP_10Rnd_762x39_SaigaMk03_M",
			"CUP_10Rnd_762x39_SaigaMk03_M"
		};
		items[] = {
			"FirstAidKit",
			"Medikit"
		};
		linkedItems[] = {
			"V_BandollierB_rgr",
			"H_Cap_red",
			"acc_flashlight",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio"
		};
		uniformClass = "U_Marshal";
		backpack = "B_FieldPack_oli";
	};
};
