#define VAR_LIGHT	"bin_fnc_attachChemlight_light"
#define VAR_KILLED	"bin_fnc_attachChemlight_killed"

params [
	["_object",objnull,[objnull]],
	["_attach",true,[true]]
];
if (isnull _object) exitwith {false};

//--- Detach
if !(_attach) exitwith {
	private _light = _object getvariable [VAR_LIGHT,objnull];
	if (isnull _light) exitwith {false};

	if (behaviour _object != "safe") then {
		private _lightDetached = createvehicle ["Chemlight_blue",position _light,[],0,"can_collide"];
	};
	deletevehicle _light;
	_object removeeventhandler ["killed",_object getvariable [VAR_KILLED,-1]];
	_object setvariable [VAR_LIGHT,nil];
	_object setvariable [VAR_KILLED,nil];
	true
};

//--- Already attached
if !(isnull (_object getvariable [VAR_LIGHT,objnull])) exitwith {false};

//--- Attach
private _light = createvehicle ["Chemlight_blue",position _object,[],0,"none"];
_light attachto [_object,[0,-0.03,0.07],"LeftShoulder"];
 _object setvariable [VAR_LIGHT,_light];
 _object setvariable [
 	VAR_KILLED,
 	_object addeventhandler ["killed",{[_this # 0,false] spawn HLG_fnc_AVBD_attachChemlight;}]
 ];
true