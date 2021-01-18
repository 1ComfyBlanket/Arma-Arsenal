copyItemString = "";
["Open",true] spawn bis_fnc_arsenal;

[] spawn {
	while {true} do {
		_item = primaryWeapon player;
		waitUntil {_item != primaryWeapon player};
		copyItemString = copyItemString + format["""%1"",",primaryWeapon player];
		copyToClipboard copyItemString;
		hintSilent copyItemString;
	};
};
[] spawn {
	while {true} do {
		_item = secondaryWeapon player;
		waitUntil {_item != secondaryWeapon player};
		copyItemString = copyItemString + format["""%1"",",secondaryWeapon player];
		copyToClipboard copyItemString;
		hintSilent copyItemString;
	};
};
[] spawn {
	while {true} do {
		_item = handgunWeapon player;
		waitUntil {_item != handgunWeapon player};
		copyItemString = copyItemString + format["""%1"",",handgunWeapon player];
		copyToClipboard copyItemString;
		hintSilent copyItemString;
	};
};
[] spawn {
	while {true} do {
		_item = vest player;
		waitUntil {_item != vest player};
		copyItemString = copyItemString + format["""%1"",",vest player];
		copyToClipboard copyItemString;
		hintSilent copyItemString;
	};
};
[] spawn {
	while {true} do {
		_item = uniform player;
		waitUntil {_item != uniform player};
		copyItemString = copyItemString + format["""%1"",",uniform player];
		copyToClipboard copyItemString;
		hintSilent copyItemString;
	};
};
[] spawn {
	while {true} do {
		_item = headgear player;
		waitUntil {_item != headgear player};
		copyItemString = copyItemString + format["""%1"",",headgear player];
		copyToClipboard copyItemString;
		hintSilent copyItemString;
	};
};
[] spawn {
	while {true} do {
		_item = backpack player;
		waitUntil {_item != backpack player};
		copyItemString = copyItemString + format["""%1"",",backpack player];
		copyToClipboard copyItemString;
		hintSilent copyItemString;
	};
};
[] spawn {
	while {true} do {
		_weapon = primaryWeapon player;
		_item = primaryWeaponItems player select 0;
		waitUntil {_item != primaryWeaponItems player select 0};
		if (primaryWeapon player == _weapon) then {
			copyItemString = copyItemString + format["""%1"",",primaryWeaponItems player select 0];
			copyToClipboard copyItemString;
			hintSilent copyItemString;
		};
	};
};
[] spawn {
	while {true} do {
		_weapon = primaryWeapon player;
		_item = primaryWeaponItems player select 1;
		waitUntil {_item != primaryWeaponItems player select 1};
		if (primaryWeapon player == _weapon) then {
			copyItemString = copyItemString + format["""%1"",",primaryWeaponItems player select 1];
			copyToClipboard copyItemString;
			hintSilent copyItemString;
		};
	};
};
[] spawn {
	while {true} do {
		_weapon = primaryWeapon player;
		_item = primaryWeaponItems player select 2;
		waitUntil {_item != primaryWeaponItems player select 2};
		if (primaryWeapon player == _weapon) then {
			copyItemString = copyItemString + format["""%1"",",primaryWeaponItems player select 2];
			copyToClipboard copyItemString;
			hintSilent copyItemString;
		};
	};
};
[] spawn {
	while {true} do {
		_weapon = primaryWeapon player;
		_item = primaryWeaponItems player select 3;
		waitUntil {_item != primaryWeaponItems player select 3};
		if (primaryWeapon player == _weapon) then {
			copyItemString = copyItemString + format["""%1"",",primaryWeaponItems player select 3];
			copyToClipboard copyItemString;
			hintSilent copyItemString;
		};
	};
};
[] spawn {
	while {true} do {
		_weapon = secondaryWeapon player;
		_item = secondaryWeaponItems player select 0;
		waitUntil {_item != secondaryWeaponItems player select 0};
		if (secondaryWeapon player == _weapon) then {
			copyToClipboard format["""%1"",",secondaryWeaponItems player select 0];
			hintSilent format["""%1"",",secondaryWeaponItems player select 0];
		};
	};
};
[] spawn {
	while {true} do {
		_weapon = secondaryWeapon player;
		_item = secondaryWeaponItems player select 1;
		waitUntil {_item != secondaryWeaponItems player select 1};
		if (secondaryWeapon player == _weapon) then {
			copyItemString = copyItemString + format["""%1"",",secondaryWeaponItems player select 1];
			copyToClipboard copyItemString;
			hintSilent copyItemString;
		};
	};
};
[] spawn {
	while {true} do {
		_weapon = secondaryWeapon player;
		_item = secondaryWeaponItems player select 2;
		waitUntil {_item != secondaryWeaponItems player select 2};
		if (secondaryWeapon player == _weapon) then {
			copyItemString = copyItemString + format["""%1"",",secondaryWeaponItems player select 2];
			copyToClipboard copyItemString;
			hintSilent copyItemString;
		};
	};
};
[] spawn {
	while {true} do {
		_weapon = handgunWeapon player;
		_item = handgunItems player select 0;
		waitUntil {_item != handgunItems player select 0};
		if (handgunWeapon player == _weapon) then {
			copyItemString = copyItemString + format["""%1"",",handgunItems player select 0];
			copyToClipboard copyItemString;
			hintSilent copyItemString;
		};
	};
};
[] spawn {
	while {true} do {
		_weapon = handgunWeapon player;
		_item = handgunItems player select 1;
		waitUntil {_item != handgunItems player select 1};
		if (handgunWeapon player == _weapon) then {
			copyItemString = copyItemString + format["""%1"",",handgunItems player select 1];
			copyToClipboard copyItemString;
			hintSilent copyItemString;
		};
	};
};
[] spawn {
	while {true} do {
		_weapon = handgunWeapon player;
		_item = handgunItems player select 2;
		waitUntil {_item != handgunItems player select 2};
		if (handgunWeapon player == _weapon) then {
			copyItemString = copyItemString + format["""%1"",",handgunItems player select 2];
			copyToClipboard copyItemString;
			hintSilent copyItemString;
		};
	};
};

