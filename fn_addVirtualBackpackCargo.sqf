private ["_object","_classes","_isGlobal","_initAction"];
_object = [_this,0,missionnamespace,[missionnamespace,objnull]] call bis_fnc_param;
_classes = [_this,1,[],["",true,[]]] call bis_fnc_param;
_isGlobal = [_this,2,false,[false]] call bis_fnc_param;
_initAction = [_this,3,true,[true]] call bis_fnc_param;
[_object,_classes,_isGlobal,_initAction,1,3] call custom_fnc_addVirtualItemCargo;
