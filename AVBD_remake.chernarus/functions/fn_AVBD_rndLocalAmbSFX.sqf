if (!isServer) exitWith {};
_trigger = _this select 0;
_list = _this select 1; // get thisList attrivute from trigger to get list of object inside trigger
_area = triggerArea _trigger;
_radius = (_area select 0) max (_area select 1);
_triggerpos = [getPosATL _trigger select 0, getPosATL _trigger select 1, 0];

while {count _list > 0} do
{
	_delay = random 15 + 15;
	sleep _delay;
	_targetPos_x = (getPosATL _trigger  select 0)  - _radius + (random (_radius * 2));
	_targetPos_y = (getPosATL _trigger select 1)  - _radius + (random (_radius * 2)); 
	_sfx = createSoundSource [selectRandom ["Squeak", "Hit"], [_targetPos_x, _targetPos_y], [], 0]; // starts alarm 	
	sleep 2;
	deleteVehicle _sfx;
}