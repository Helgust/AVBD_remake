// Custom content for CSAT ammo+supply box

// Params
params
[
	["_box",objNull,[objNull]]	// ammobox
];

{clearMagazineCargoGlobal _x, clearWeaponCargoGlobal _x, clearItemCargoGlobal _x, clearBackpackCargoGlobal _x} forEach [_box];

// WEAPON ITEMS

// Optics
_box addItemCargoGlobal ["CUP_optic_PSO_1",4 + (round random 1)];
_box addItemCargoGlobal ["CUP_optic_1p63",2 + (round random 2)];
_box addItemCargoGlobal ["CUP_optic_Kobra",4 + (round random 1.5)];
_box addItemCargoGlobal ["CUP_optic_NSPU",2 + (round random 1.5)];

// Laser pointers
_box addItemCargoGlobal ["acc_pointer_IR",2 + (round random 4)];

// Suppressors
_box addItemCargoGlobal ["CUP_muzzle_PBS4",1 + (round random 2)];
_box addItemCargoGlobal ["CUP_muzzle_TGPA",(round random 1.5)];

// WEAPONS
_box addWeaponCargoGlobal ["CUP_arifle_AK74M_top_rail",2 + (round random 2)];
_box addWeaponCargoGlobal ["CUP_arifle_AK74M_GL_top_rail",1 + (round random 1.5)];
_box addWeaponCargoGlobal ["CUP_arifle_RPK74M_top_rail",1 + (round random 1.5)];
_box addWeaponCargoGlobal ["CUP_srifle_SVD_top_rail",1];

// AMMO

// 5.8 mm, tracer/non-tracer
if (random 100 < 50) then {_box addMagazineCargoGlobal ["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK74M_M",12 + (round random 6)]} else {_box addMagazineCargoGlobal ["30Rnd_580x42_Mag_Tracer_F",12 + (round random 6)]};
if (random 100 < 50) then {_box addMagazineCargoGlobal ["CUP_75Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M",5 + (round random 5)]} else {_box addMagazineCargoGlobal ["100Rnd_580x42_Mag_Tracer_F",5 + (round random 5)]};

// 6.5 mm
_box addMagazineCargoGlobal ["CUP_30Rnd_TE1_Green_Tracer_545x39_AK74M_M",6 + (round random 4)];

// 40mm UGLs
_box addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",8 + (round random 4)];

// Smoke shells
_box addMagazineCargoGlobal ["SmokeShell",4 + (round random 4)];

// Grenades
_box addMagazineCargoGlobal ["CUP_HandGrenade_RGD5",4 + (round random 4)];
_box addMagazineCargoGlobal ["CUP_HandGrenade_RGO",4 + (round random 4)];

// Explosive satchel
_box addMagazineCargoGlobal ["SatchelCharge_Remote_Mag",2 + (round random 2)];

// GM6 Lynx
if (random 100 < 35) then {_box addMagazineCargoGlobal ["CUP_10Rnd_762x54_SVD_M",4 + (round random 2)]; _box addWeaponCargoGlobal ["srifle_GM6_LRPS_F",1]};

// RPG-42
_box addMagazineCargoGlobal ["CUP_PG7V_M",4];
_box addWeaponCargoGlobal ["CUP_launch_RPG7V",2];

// Titan AA
if (random 100 < 50) then {_box addMagazineCargoGlobal ["CUP_Strela_2_M",2]; _box addWeaponCargoGlobal ["launch_O_Titan_ghex_F",1]; _box addBackpackCargoGlobal ["B_Fieldpack_ghex_F",1]};

// FAKs
_box addItemCargoGlobal ["FirstAidKit",4 + (round random 2)];

// Rangefinder
_box addItemCargoGlobal ["Rangefinder",(round random 1)];

// Backpacks
_box addBackpackCargoGlobal ["B_FieldPack_oli",1];
_box addBackpackCargoGlobal ["B_Carryall_oli",(round random 1)];

// GPS
_box addItemCargoGlobal ["ItemGPS",1 + (round random 1)];

// Medikit
// _box addItemCargoGlobal ["Medikit",(round random 1)];

// Toolkit
// _box addItemCargoGlobal ["Toolkit",(round random 1)];

// Mine detector
// _box addItemCargoGlobal ["MineDetector",(round random 1)];

// NVGs
_box addItemCargoGlobal ["NVGoggles",2 + (round random 2)];
