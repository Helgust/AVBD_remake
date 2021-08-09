// Custom content for NATO supply box

// Params
params
[
	["_box",objNull,[objNull]] // ammobox
];

{clearMagazineCargoGlobal _x, clearWeaponCargoGlobal _x, clearItemCargoGlobal _x, clearBackpackCargoGlobal _x} forEach [_box];

// Optics
_box addItemCargoGlobal ["optic_aco",2 + (round random 2)];
_box addItemCargoGlobal ["optic_hamr",1 + (round random 1)];
_box addItemCargoGlobal ["optic_nvs",(round random 1)];

// FAKs
_box addItemCargoGlobal ["FirstAidKit",4 + (round random 2)];

// Rangefinder
_box addItemCargoGlobal ["Rangefinder",1 + (round random 1.5)];

// Backpacks
_box addBackpackCargoGlobal ["B_AssaultPack_rgr",1];
_box addBackpackCargoGlobal ["B_Kitbag_rgr",(round random 1)];

// Vests
_box addItemCargoGlobal ["CUP_V_B_Eagle_SPC_GL",1];
_box addItemCargoGlobal ["CUP_V_B_Eagle_SPC_MG",1 + (round random 1.5)];
_box addItemCargoGlobal ["CUP_V_B_Eagle_SPC_Officer",1];

// GPS
_box addItemCargoGlobal ["ItemGPS",2 + (round random 1)];

// Medikit
// _box addItemCargoGlobal ["Medikit",(round random 1.5)];

// Toolkit
// _box addItemCargoGlobal ["Toolkit",(round random 1.5)];

// Mine detector
// _box addItemCargoGlobal ["MineDetector",(round random 1.5)];

// NVGs
_box addItemCargoGlobal ["CUP_NVG_PVS7",2 + (round random 2)];

// NLAW
_box addMagazineCargoGlobal ["CUP_MAAWS_HEAT_M",2];
_box addWeaponCargoGlobal ["CUP_launch_MAAWS_Scope",1];

// AA Titan (where's the new Stinger you promised for Apex?)
//_box addMagazineCargoGlobal ["CUP_Stinger_M",];
_box addWeaponCargoGlobal ["CUP_launch_FIM92Stinger",4];
_box addBackpackCargoGlobal ["B_AssaultPack_rgr",1];
