// Custom content for CSAT supply box

// Params
params
[
	["_box",objNull,[objNull]] // ammobox
];

{clearMagazineCargoGlobal _x, clearWeaponCargoGlobal _x, clearItemCargoGlobal _x, clearBackpackCargoGlobal _x} forEach [_box];
// WEAPON ITEMS

// Bipods
_box addItemCargoGlobal ["bipod_01_F_blk",(round random 1.5)];

// Optics
_box addItemCargoGlobal ["CUP_optic_PSO_1",2 + (round random 2)];
_box addItemCargoGlobal ["CUP_optic_1p63",2 + (round random 2)];
_box addItemCargoGlobal ["CUP_optic_Kobra",2 + (round random 2)];
_box addItemCargoGlobal ["CUP_optic_NSPU",2 + (round random 2)];

// Laser pointers
_box addItemCargoGlobal ["acc_pointer_IR",(round random 2)];

// FAKs
_box addItemCargoGlobal ["FirstAidKit",4 + (round random 2)];

// Rangefinder
_box addItemCargoGlobal ["Rangefinder",1 + (round random 1.5)];

// Backpacks
_box addBackpackCargoGlobal ["B_AssaultPack_rgr",1];
_box addBackpackCargoGlobal ["B_Kitbag_rgr",(round random 1)];

// Vests
_box addItemCargoGlobal ["CUP_V_CDF_6B3_1_MNT",1];
_box addItemCargoGlobal ["CUP_V_CDF_6B3_4_MNT",1 + (round random 1.5)];
_box addItemCargoGlobal ["CUP_V_CDF_6B3_3_MNT",1];

// GPS
_box addItemCargoGlobal ["ItemGPS",2 + (round random 1)];

// Medikit
// _box addItemCargoGlobal ["Medikit",(round random 1.5)];

// Toolkit
// _box addItemCargoGlobal ["Toolkit",(round random 1.5)];

// Mine detector
// _box addItemCargoGlobal ["MineDetector",(round random 1.5)];

// NVGs
_box addItemCargoGlobal ["NVGoggles",2 + (round random 2)];

// NLAW
_box addMagazineCargoGlobal ["CUP_PG7V_M",2];
_box addWeaponCargoGlobal ["CUP_launch_RPG7V",2];

// AA Titan (where's the new Stinger you promised for Apex?)
//_box addMagazineCargoGlobal ["CUP_Strela_2_M",2];
_box addWeaponCargoGlobal ["CUP_launch_Igla",4];
_box addBackpackCargoGlobal ["B_AssaultPack_rgr",1];
