private ["_object","_classes","_isGlobal","_add","_type","_initAction","_cargo","_cargoArray","_save"];
_object = [_this,0,missionnamespace,[missionnamespace,objnull]] call bis_fnc_param;
_classes = [_this,1,[],["",true,[]]] call bis_fnc_param;
_isGlobal = [_this,2,false,[false]] call bis_fnc_param;
_initAction = [_this,3,true,[true]] call bis_fnc_param;
_add = [_this,4,1,[1]] call bis_fnc_param;
_type = [_this,5,0,[0]] call bis_fnc_param;

//--- Get cargo list
_cargo = _object getvariable ["bis_addVirtualWeaponCargo_cargo",[[],[],[],[]]];
_cargoArray = _cargo select _type;
if (_add == 0) exitwith {_cargoArray};

//--- Modify cargo list
_save = false;
if (typename _classes != typename []) then {_classes = [_classes]};
if (count _classes == 0 && _add < 0) then {
	_cargoArray = [];
	_save = true;
} else {
	{
		//--- Use config classnames (conditions are case sensitive)
		private ["_class"];
		_x = [_x,0,"",["",true]] call bis_fnc_paramin;
		if (typename _x == typename true) then {_x = "%ALL";};
		_class = switch _type do {
			case 0;
			case 1: {configname (configfile >> "cfgweapons" >> _x);};
			case 2: {configname (configfile >> "cfgmagazines" >> _x);};
			case 3: {configname (configfile >> "cfgvehicles" >> _x);};
			default {""};
		};
		if (_class == "") then {_class = _x;};
		if (_add > 0) then {
			if (!(_class in _cargoArray) && (_class != "" || _class == "%ALL")) then {_cargoArray set [count _cargoArray,_class];};
		} else {
			_cargoArray = _cargoArray - [_class];
		};
		_save = true;
	} foreach _classes;
};
_cargo set [_type,_cargoArray];

_object setvariable ["bis_addVirtualWeaponCargo_cargo",_cargo];

if (_initAction && typename _object == typename objnull) then {
	if ({count _x > 0} count _cargo > 0) then {
		//--- Init arsenal
		["AmmoboxInit",_object] call bis_fnc_arsenal;
	} else {
		//--- Terminate arsenal
		["AmmoboxExit",_object] call bis_fnc_arsenal;
	};
};

_cargoArray