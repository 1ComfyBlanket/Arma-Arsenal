disableserialization;

_mode = [_this,0,"Open",[displaynull,""]] call bis_fnc_param;
_this = [_this,1,[]] call bis_fnc_param;
_fullVersion = missionnamespace getvariable ["BIS_fnc_arsenal_fullArsenal",false];

private ["_anim"];

switch _mode do {
	case "Open": {
		if !(isnull (uinamespace getvariable ["BIS_fnc_arsenal_cam",objnull])) exitwith {"Arsenal Viewer is already running" call bis_fnc_logFormat;};
		missionnamespace setvariable ["BIS_fnc_arsenal_fullArsenal",[_this,0,false,[false]] call bis_fnc_param];

		with missionnamespace do {
			BIS_fnc_arsenal_cargo = [_this,1,objnull,[objnull]] call bis_fnc_param;
			BIS_fnc_arsenal_center = [_this,2,player,[player]] call bis_fnc_param;
		};
		with uinamespace do {
			_displayMission = [] call (uinamespace getvariable "bis_fnc_displayMission");
			if !(isnull finddisplay 312) then {_displayMission = finddisplay 312;};
			_displayMission createdisplay "RscDisplayArsenal";
		};
		
		//The custom part for cinematic effect
		UsingArsenal = true;
		
		[] spawn {
			ArsenalIdle_AnimDone_EH = {ArsenalIdle_Loop = true};
			_AnimDone_EH = player addEventHandler ["AnimDone", ArsenalIdle_AnimDone_EH];
			
			_animArray = ["Acts_AidlPercMstpSlowWrflDnon_warmup01",
						"Acts_AidlPercMstpSlowWrflDnon_warmup02",
						"Acts_AidlPercMstpSlowWrflDnon_warmup03",
						"Acts_AidlPercMstpSlowWrflDnon_warmup04",
						"Acts_AidlPercMstpSlowWrflDnon_warmup05"];
		
			while {alive player && UsingArsenal} do {
				ArsenalIdle_Loop = false;
				
				_anim = _animArray call BIS_fnc_selectRandom;
				if (isTouchingGround player && vehicle player == player) then {
					_anim = _animArray call BIS_fnc_selectRandom;
				} else {
					_anim = "halofreefall_non";
				};
				player playMove _anim;
				
				waitUntil {animationState player == _anim || !alive player || !UsingArsenal || ArsenalIdle_Loop};
				waitUntil {!alive player || !UsingArsenal || ArsenalIdle_Loop};
			};
			
			player removeEventHandler ["AnimDone",_AnimDone_EH];
			[[[player], {(_this select 0) switchMove ""}], "BIS_fnc_spawn", true, false] spawn BIS_fnc_MP;
		};
		
		player allowDamage false;
		0 fadeMusic 2;
		[] spawn {
			while {UsingArsenal} do {
				//BackgroundTrack01_F_EPB 127 length, 37 cut, 90 delay
				//BackgroundTrack04_F_EPC 80
				//BackgroundTrack02_F_EPC 98 length, 18 cut, 80 delay
				playMusic "BackgroundTrack04_F_EPC";
				_delay = time + 80;
				waitUntil {!UsingArsenal || time > _delay};
			};
		};
		
		sleep 1;
		waitUntil {sleep 0.1;isnull (uinamespace getvariable ["BIS_fnc_arsenal_cam",objnull])};
		
		UsingArsenal = false;
		player allowDamage true;
		3 fadeMusic 0;
	};
};
