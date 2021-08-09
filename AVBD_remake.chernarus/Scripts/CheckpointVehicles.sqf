// Creates vehicles and ammoboxes at NATO checkpoints

params
[
["_checkpoint","",[""]] // which checkpoint should be used for vehicle spawn
];

if !(_checkpoint in ["Valley","Electro","Kamenka","Bay","Cherno","GasStation","NoviySobor","Field","Gvozdno"]) exitWith {["Non-existing checkpoint %1 for vehicle spawn used",_checkpoint] call BIS_fnc_logFormat};

if (_checkpoint == "Cherno") then
{

	// Supply box
	_ammobox = "B_CargoNet_01_ammo_F" createVehicle [6180.052,3603.543,0];
	_ammobox setPos [6180.052,3603.543,0];
	_ammobox setDir 345;
	_ammobox allowDamage false;
	_ammobox call HLG_fnc_EfC_ammoboxNATO;
	_ammobox enableDynamicSimulation true;

	_veh01 = "CUP_B_UAZ_MG_CDF" createVehicle [6165.878,3586.74,0];
	_veh01 setDir 50;
	_veh01 setFuel 0.35;
	_veh01 setPosATL [6165.878,3586.74,0];

	_veh02 = "CUP_B_Kamaz_CDF" createVehicle [6171.04,3576.507,0];
	_veh02 setDir 60;
	_veh02 setFuel 0.45;
	_veh02 setPosATL [6171.04,3576.507,0];

	{_x enableDynamicSimulation true} forEach [_veh01,_veh02];
	{clearMagazineCargoGlobal _x; clearWeaponCargoGlobal _x; clearItemCargoGlobal _x} forEach [_veh01,_veh02];
	{_x addItemCargoGlobal ["FirstAidKit",2]} forEach [_veh01,_veh02];
};

if (_checkpoint == "Electro") then
{

	// Supply box
	_ammobox = "B_CargoNet_01_ammo_F" createVehicle [10210.537,4048.133,0];
	_ammobox setPos [10210.537,4048.133,0];
	_ammobox setDir 280;
	_ammobox allowDamage false;
	_ammobox call HLG_fnc_EfC_ammoboxNATO;
	_ammobox enableDynamicSimulation true;

	_veh01 = "CUP_B_UAZ_MG_CDF" createVehicle [10196.891,4035.636,0];
	_veh01 setDir 45;
	_veh01 setFuel 0.35;
	_veh01 setPosATL [10196.891,4035.636,0];

	_veh02 = "B_T_Quadbike_01_F" createVehicle [10201.659,4027.898,0]; //TODO
	_veh02 setDir 50;
	_veh02 setFuel 0.65;
	_veh02 setPosATL [10201.659,4027.898,0];

	{_x enableDynamicSimulation true} forEach [_veh01,_veh02];
	{clearMagazineCargoGlobal _x; clearWeaponCargoGlobal _x; clearItemCargoGlobal _x} forEach [_veh01,_veh02];
	{_x addItemCargoGlobal ["FirstAidKit",2]} forEach [_veh01,_veh02];
};

if (_checkpoint == "Valley") then
{

	// Supply box
	_ammobox = "B_CargoNet_01_ammo_F" createVehicle [13375.256,5309.438,0];
	_ammobox setPos [13375.256,5309.438,0];
	_ammobox setDir 0;
	_ammobox allowDamage false;
	_ammobox call HLG_fnc_EfC_ammoboxNATO;
	_ammobox enableDynamicSimulation true;

	_veh01 = "CUP_B_UAZ_MG_CDF" createVehicle [13394.38,5315.109,0];
	_veh01 setDir 260;
	_veh01 setFuel 0.35;
	_veh01 setPosATL [13394.38,5315.109,0];

	_veh02 = "CUP_B_Kamaz_CDF" createVehicle [13393.831,5325.231,0];
	_veh02 setDir 269;
	_veh02 setFuel 0.35;
	_veh02 setPosATL [13393.831,5325.231,0];

	_veh03 = "B_T_Quadbike_01_F" createVehicle [13393.053,5336.354,0];
	_veh03 setDir 260;
	_veh03 setFuel 0.65;
	_veh03 setPosATL [13393.053,5336.354,0];

	{_x enableDynamicSimulation true} forEach [_veh01,_veh02,_veh03];
	{clearMagazineCargo _x; clearWeaponCargo _x; clearItemCargoGlobal _x} forEach [_veh01,_veh02,_veh03];
	{_x addItemCargoGlobal ["FirstAidKit",2]} forEach [_veh01,_veh02,_veh03];
};

if (_checkpoint == "Kamenka") then
{

	// Supply box
	_ammobox = "B_CargoNet_01_ammo_F" createVehicle [2556.069,3220.087,0];
	_ammobox setPos [2556.069,3220.087,0];
	_ammobox setDir 70;
	_ammobox allowDamage false;
	_ammobox call HLG_fnc_EfC_ammoboxNATO;
	_ammobox enableDynamicSimulation true;

	_veh01 = "CUP_B_Kamaz_CDF" createVehicle [2575.507,3230.495,0];
	_veh01 setDir 260;
	_veh01 setFuel 0.45;
	_veh01 setPosATL [2575.507,3230.495,0];

	_veh02 = "CUP_B_HMMWV_M2_USMC" createVehicle [2575.882,3207.672,0];
	_veh02 setDir 170;
	_veh02 setFuel 0.35;
	_veh02 setPosATL [2575.882,3207.672,0];

	{_x enableDynamicSimulation true} forEach [_veh01,_veh02];
	{clearMagazineCargoGlobal _x; clearWeaponCargoGlobal _x; clearItemCargoGlobal _x} forEach [_veh01,_veh02];
	{_x addItemCargoGlobal ["FirstAidKit",2]} forEach [_veh01,_veh02];
};

if (_checkpoint == "Bay") then
{

	// Supply box
	_ammobox = "B_CargoNet_01_ammo_F" createVehicle [12879.256,8601.884,0];
	_ammobox setPos [12879.256,8601.884,0];
	_ammobox setDir 70;
	_ammobox allowDamage false;
	_ammobox call HLG_fnc_EfC_ammoboxNATO;
	_ammobox enableDynamicSimulation true;

	_veh01 = "CUP_B_UAZ_MG_CDF" createVehicle [12896.202,8593.926,0];
	_veh01 setDir 223;
	_veh01 setFuel 0.35;
	_veh01 setPosATL [12896.202,8593.926,0];

	_veh02 = "B_T_Quadbike_01_F" createVehicle [12892.212,8609.687,0];
	_veh02 setDir 0;
	_veh02 setFuel 0.35;
	_veh02 setPosATL [12892.212,8609.687,0];

	{_x enableDynamicSimulation true} forEach [_veh01,_veh02];
	{clearMagazineCargoGlobal _x; clearWeaponCargoGlobal _x; clearItemCargoGlobal _x} forEach [_veh01,_veh02];
	{_x addItemCargoGlobal ["FirstAidKit",2]} forEach [_veh01,_veh02];
};

if (_checkpoint == "GasStation") then
{
	// Supply box
	_ammobox = "B_CargoNet_01_ammo_F" createVehicle [10450.461,8857.562,0];
	_ammobox setPos [10450.461,8857.562,0];
	_ammobox setDir 335;
	_ammobox allowDamage false;
	_ammobox call HLG_fnc_EfC_ammoboxNATO;
	_ammobox enableDynamicSimulation true;

	_veh01 = "CUP_B_HMMWV_M2_USMC" createVehicle [10429.368,8843.433,0];
	_veh01 setDir 272;
	_veh01 setFuel 0.35;
	_veh01 setPosATL [10429.368,8843.433,0];

	_veh02 = "B_T_Quadbike_01_F" createVehicle [10438.305,8863.673,0];
	_veh02 setDir 355;
	_veh02 setFuel 0.75;
	_veh02 setPosATL [10438.305,8863.673,0];

	{_x enableDynamicSimulation true} forEach [_veh01,_veh02];
	{clearMagazineCargoGlobal _x; clearWeaponCargoGlobal _x; clearItemCargoGlobal _x} forEach [_veh01,_veh02];
	{_x addItemCargoGlobal ["FirstAidKit",2]} forEach [_veh01,_veh02];
};

if (_checkpoint == "NoviySobor") then
{

	// Supply box
	_ammobox = "B_CargoNet_01_ammo_F" createVehicle [7652.511,7413.612,0];
	_ammobox setPos [7652.511,7413.612,0];
	_ammobox setDir 335;
	_ammobox allowDamage false;
	_ammobox call HLG_fnc_EfC_ammoboxNATO;
	_ammobox enableDynamicSimulation true;

	_veh01 = "CUP_B_UAZ_MG_CDF" createVehicle [7643.711,7403.64,0];
	_veh01 setDir 50;
	_veh01 setFuel 0.35;
	_veh01 setPosATL [7643.711,7403.64,0];

	{_x enableDynamicSimulation true} forEach [_veh01];
	{clearMagazineCargoGlobal _x; clearWeaponCargoGlobal _x; clearItemCargoGlobal _x} forEach [_veh01];
	{_x addItemCargoGlobal ["FirstAidKit",2]} forEach [_veh01];
};


if (_checkpoint == "Field") then
{

	// Supply box
	_ammobox = "B_CargoNet_01_ammo_F" createVehicle [2919.724,7331.19,0];
	_ammobox setPos [2919.724,7331.19,0];
	_ammobox setDir 335;
	_ammobox allowDamage false;
	_ammobox call HLG_fnc_EfC_ammoboxNATO;
	_ammobox enableDynamicSimulation true;

	_veh01 = "CUP_B_UAZ_MG_CDF" createVehicle [2917.388,7318.792,0];
	_veh01 setDir 272;
	_veh01 setFuel 0.35;
	_veh01 setPosATL [2917.388,7318.792,0];

	_veh02 = "CUP_B_Kamaz_CDF" createVehicle [2899.414,7332.992,0];
	_veh02 setDir 200;
	_veh02 setFuel 0.75;
	_veh02 setPosATL [2899.414,7332.992,0];

	{_x enableDynamicSimulation true} forEach [_veh01,_veh02];
	{clearMagazineCargoGlobal _x; clearWeaponCargoGlobal _x; clearItemCargoGlobal _x} forEach [_veh01,_veh02];
	{_x addItemCargoGlobal ["FirstAidKit",2]} forEach [_veh01,_veh02];
};

if (_checkpoint == "Gvozdno") then
{

	// Supply box
	_ammobox = "B_CargoNet_01_ammo_F" createVehicle [9076.864,11835.187,0];
	_ammobox setPos [9076.864,11835.187,0];
	_ammobox setDir 200;
	_ammobox allowDamage false;
	_ammobox call HLG_fnc_EfC_ammoboxNATO;
	_ammobox enableDynamicSimulation true;

	_veh01 = "CUP_B_HMMWV_M2_USMC" createVehicle [9089.83,11824.836,0];
	_veh01 setDir 220;
	_veh01 setFuel 0.35;
	_veh01 setPosATL [9089.83,11824.836,0];

	_veh02 = "CUP_B_Kamaz_CDF" createVehicle [9079.613,11813.413,0];
	_veh02 setDir 135;
	_veh02 setFuel 0.75;
	_veh02 setPosATL [9079.613,11813.413,0];

	{_x enableDynamicSimulation true} forEach [_veh01,_veh02];
	{clearMagazineCargoGlobal _x; clearWeaponCargoGlobal _x; clearItemCargoGlobal _x} forEach [_veh01,_veh02];
	{_x addItemCargoGlobal ["FirstAidKit",2]} forEach [_veh01,_veh02];
};


