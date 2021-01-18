if (isDedicated) exitWith {};
waitUntil {!isNull player};

custom_fnc_arsenal = compile preprocessFileLineNumbers "arsenal\fn_arsenal.sqf";
custom_fnc_addVirtualWeaponCargo = compile preprocessFileLineNumbers "arsenal\fn_addVirtualWeaponCargo.sqf";
custom_fnc_addVirtualMagazineCargo = compile preprocessFileLineNumbers "arsenal\fn_addVirtualMagazineCargo.sqf";
custom_fnc_addVirtualItemCargo = compile preprocessFileLineNumbers "arsenal\fn_addVirtualItemCargo.sqf";
custom_fnc_addVirtualBackpackCargo = compile preprocessFileLineNumbers "arsenal\fn_addVirtualBackpackCargo.sqf";

player addAction ["<t color='#00CD66'>Open Arsenal</t>", {["Open",false] spawn custom_fnc_arsenal}, nil, 10, false, true, "", "_this distance arsenal_zone < 150 && vehicle player == player"];

// Prevent players from sharing gear near the arsenal
player addEventHandler ["Put",{
	_dropped = _this select 1;
	_type = _this select 2;
	
	if (player distance arsenal_zone > 200) exitWith {};
	if (typeOf _dropped == "WeaponHolder") then {
		deleteVehicle _dropped;
	} else {
		_items = itemCargo _dropped;
		_magazines = magazineCargo _dropped;
		_weapons = weaponCargo _dropped;
		_backpacks = backpackCargo _dropped;
			
		_weapons = _weapons - [_type];
		_magazines = _magazines - [_type];
		_backpacks = _backpacks - [_type];
		_items = _items - [_type];
		
		clearItemCargoGlobal _dropped;
		clearMagazineCargoGlobal _dropped;
		clearBackpackCargoGlobal _dropped;
		clearWeaponCargoGlobal _dropped;
		
		{_dropped addItemCargoGlobal [_x,1]} forEach _items;
		{_dropped addMagazineCargoGlobal [_x,1]} forEach _magazines;
		{_dropped addWeaponCargoGlobal [_x,1]} forEach _weapons;
		{_dropped addBackpackCargoGlobal [_x,1]} forEach _backpacks;
	};
}];

removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;

player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemGPS";

// muh scripts suk
sleep 0.1;
player forceAddUniform "U_B_CombatUniform_mcam_tshirt";
player addVest "V_TacVest_blk_POLICE";
player addBackpack "B_TacticalPack_blk";
player addHeadgear "gign_helm3";
sleep 0.1;

player addItem "ACRE_PRC343";
player addWeapon "Rangefinder";

for "_i" from 1 to 5 do {
	player addItemToBackpack "ACE_fieldDressing";
	player addItemToBackpack "ACE_packingBandage";
	player addItemToBackpack "ACE_elasticBandage";
	player addItemToBackpack "ACE_Banana";
};
for "_i" from 1 to 3 do {
	player addItemToBackpack "ACE_morphine";
	player addItemToBackpack "ACE_CableTie";
	player addItemToBackpack "ACE_tourniquet";
};

// Adding items to the limited arsenal
private ["_weapons","_magazines","_items","_backpacks"];
_weapons = [];
_magazines = [];
_items = [];
_backpacks = [];

// Pistols, shotguns, and SMGs
_smallArms = ["hlc_rifle_saiga12k","rhs_weap_M590_8RD","rhs_weap_M590_5RD","hlc_smg_mp510","hlc_smg_mp5a4","PistolCore","HandGunBase","Pistol","Pistol_Base_F","hgun_ACPC2_F","hgun_ACPC2_snds_F","hgun_P07_F","hgun_P07_snds_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_01_snds_F","hgun_Pistol_heavy_01_MRD_F","hgun_Pistol_heavy_02_F","hgun_Pistol_heavy_02_Yorris_F","hgun_Rook40_F","hgun_Rook40_snds_F","SMG_01_Base","SMG_01_F","SMG_01_Holo_F","SMG_01_Holo_pointer_snds_F","SMG_01_ACO_F","SMG_02_base_F","SMG_02_F","SMG_02_ACO_F","hgun_Pistol_Signal_F","rhs_weap_pya","rhs_weap_rsp30_white","rhs_weap_rsp30_white_used","rhs_weap_rsp30_red","rhs_weap_rsp30_red_used","rhs_weap_rsp30_green","rhs_weap_rsp30_green_used","rhs_weap_makarov_pmm","rhsusf_weap_m1911a1","hlc_smg_mp5k","RH_sbr9","UK3CB_BAF_L91A1","UK3CB_BAF_L92A1","UK3CB_BAF_L131A1","BWA3_P8","BWA3_MP7","BWA3_MP7_equipped"];
{_weapons pushBack _x} forEach _smallArms;

// All magazines with a couple strong ones filtered out
{_magazines pushBack _x} forEach ["ACE_HuntIR_M203","Default","FakeMagazine","FakeWeapon","VehicleMagazine","FIR_M61A2_480rnd_M","FIR_M61A2_511rnd_M","FIR_M61A2_578rnd_M","FIR_M61A2_675rnd_M","FIR_M61A2_940rnd_M","FIR_M61A2_TWAS_511rnd_M","FIR_M61A2_TWAS_Red_511rnd_M","FIR_AIM54_1rnd_M","FIR_AIM7_1rnd_M","FIR_AIM7_2_1rnd_M","FIR_AIM120_1rnd_M","FIR_AIM120_TWAS_1rnd_M","FIR_AIM120_TWAS_Red_1rnd_M","FIR_AGM65D_1rnd_M","FIR_AGM65G_1rnd_M","FIR_AGM65L_1rnd_M","FIR_AGM88_1rnd_M","FIR_AIM9X_1rnd_M","FIR_AIM9L_1rnd_M","FIR_AIM9L_TWAS_1rnd_M","FIR_AIM9L_TWAS_Red_1rnd_M","FIR_mk82_snakeye_1rnd_M","FIR_240rnd_CMFlare_Chaff_Magazine","FIR_GBU10_1rnd_M","FIR_GBU12_1rnd_M","FIR_Hydra_7rnd_M","FIR_Zuni_4rnd_M","FIR_CBU103_1rnd_M","FIR_CBU89_1rnd_M","FIR_CBU104_1rnd_M","FIR_Triplepylon_1rnd_M","FIR_LAU88_1rnd_M","FIR_empty_1rnd_M","FIR_empty_2rnd_M","FIR_empty_3rnd_M","FIR_empty_4rnd_M","FIR_empty_5rnd_M","FIR_empty_6rnd_M","FIR_empty_7rnd_M","FIR_empty_8rnd_M","FIR_empty_9rnd_M","FIR_empty_10rnd_M","FIR_empty_12rnd_M","FIR_empty_14rnd_M","FIR_empty_16rnd_M","FIR_empty_18rnd_M","FIR_empty_20rnd_M","FIR_LantirnPod_1rnd_M","FIR_ECMPod_1rnd_M","FIR_TWASPod_1rnd_M","FIR_TWASPod_Red_1rnd_M","FIR_HTSPod_1rnd_M","FIR_Hydra_7_Pod_1rnd_M","FIR_Zuni_5_Pod_1rnd_M","FIR_F16C_Fueltank_1rnd_M","FIR_F16C_Fueltank_2rnd_M","FIR_GBU31_1rnd_M","FIR_gbu32_1rnd_M","FIR_gbu38_1rnd_M","CA_Magazine","CA_LauncherMagazine","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_Tracer_Green","30Rnd_556x45_Stanag_Tracer_Yellow","20Rnd_556x45_UW_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_mag_Tracer","30Rnd_65x39_caseless_green_mag_Tracer","20Rnd_762x51_Mag","7Rnd_408_Mag","5Rnd_127x108_Mag","100Rnd_65x39_caseless_mag","100Rnd_65x39_caseless_mag_Tracer","200Rnd_65x39_cased_Box","200Rnd_65x39_cased_Box_Tracer","30Rnd_9x21_Mag","16Rnd_9x21_Mag","RPG32_F","RPG32_HE_F","NLAW_F","1Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","3Rnd_Smoke_Grenade_shell","1Rnd_SmokeRed_Grenade_shell","3Rnd_SmokeRed_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","3Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeYellow_Grenade_shell","3Rnd_SmokeYellow_Grenade_shell","1Rnd_SmokePurple_Grenade_shell","3Rnd_SmokePurple_Grenade_shell","1Rnd_SmokeBlue_Grenade_shell","3Rnd_SmokeBlue_Grenade_shell","1Rnd_SmokeOrange_Grenade_shell","3Rnd_SmokeOrange_Grenade_shell","HandGrenade","MiniGrenade","HandGrenade_Stone","SmokeShell","SmokeShellRed","SmokeShellGreen","SmokeShellYellow","SmokeShellPurple","SmokeShellBlue","SmokeShellOrange","Chemlight_green","Chemlight_red","Chemlight_yellow","Chemlight_blue","60Rnd_CMFlareMagazine","120Rnd_CMFlareMagazine","240Rnd_CMFlareMagazine","60Rnd_CMFlare_Chaff_Magazine","120Rnd_CMFlare_Chaff_Magazine","240Rnd_CMFlare_Chaff_Magazine","192Rnd_CMFlare_Chaff_Magazine","168Rnd_CMFlare_Chaff_Magazine","300Rnd_CMFlare_Chaff_Magazine","SmokeLauncherMag","SmokeLauncherMag_boat","200Rnd_65x39_Belt","200Rnd_65x39_Belt_Tracer_Red","200Rnd_65x39_Belt_Tracer_Green","200Rnd_65x39_Belt_Tracer_Yellow","1000Rnd_65x39_Belt","1000Rnd_65x39_Belt_Tracer_Red","1000Rnd_65x39_Belt_Green","1000Rnd_65x39_Belt_Tracer_Green","1000Rnd_65x39_Belt_Yellow","1000Rnd_65x39_Belt_Tracer_Yellow","2000Rnd_65x39_Belt","2000Rnd_65x39_Belt_Tracer_Red","2000Rnd_65x39_Belt_Green","2000Rnd_65x39_Belt_Tracer_Green","2000Rnd_65x39_Belt_Tracer_Green_Splash","2000Rnd_65x39_Belt_Yellow","2000Rnd_65x39_Belt_Tracer_Yellow","2000Rnd_65x39_Belt_Tracer_Yellow_Splash","5000Rnd_762x51_Belt","5000Rnd_762x51_Yellow_Belt","500Rnd_127x99_mag","500Rnd_127x99_mag_Tracer_Red","500Rnd_127x99_mag_Tracer_Green","500Rnd_127x99_mag_Tracer_Yellow","200Rnd_127x99_mag","200Rnd_127x99_mag_Tracer_Red","200Rnd_127x99_mag_Tracer_Green","200Rnd_127x99_mag_Tracer_Yellow","100Rnd_127x99_mag","100Rnd_127x99_mag_Tracer_Red","100Rnd_127x99_mag_Tracer_Green","100Rnd_127x99_mag_Tracer_Yellow","450Rnd_127x108_Ball","150Rnd_127x108_Ball","50Rnd_127x108_Ball","200Rnd_40mm_G_belt","96Rnd_40mm_G_belt","64Rnd_40mm_G_belt","32Rnd_40mm_G_belt","200Rnd_20mm_G_belt","40Rnd_20mm_G_belt","24Rnd_PG_missiles","12Rnd_PG_missiles","24Rnd_missiles","12Rnd_missiles","32Rnd_155mm_Mo_shells","8Rnd_82mm_Mo_shells","8Rnd_82mm_Mo_Flare_white","8Rnd_82mm_Mo_Smoke_white","8Rnd_82mm_Mo_guided","8Rnd_82mm_Mo_LG","6Rnd_155mm_Mo_smoke","2Rnd_155mm_Mo_guided","2Rnd_155mm_Mo_LG","6Rnd_155mm_Mo_mine","6Rnd_155mm_Mo_AT_mine","2Rnd_155mm_Mo_Cluster","UGL_FlareWhite_F","3Rnd_UGL_FlareWhite_F","UGL_FlareGreen_F","3Rnd_UGL_FlareGreen_F","UGL_FlareRed_F","3Rnd_UGL_FlareRed_F","UGL_FlareYellow_F","3Rnd_UGL_FlareYellow_F","UGL_FlareCIR_F","3Rnd_UGL_FlareCIR_F","FlareWhite_F","FlareGreen_F","FlareRed_F","FlareYellow_F","Laserbatteries","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01_Tracer_Green","30Rnd_45ACP_Mag_SMG_01_Tracer_Red","30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow","9Rnd_45ACP_Mag","150Rnd_762x51_Box","150Rnd_762x51_Box_Tracer","150Rnd_762x54_Box","150Rnd_762x54_Box_Tracer","Titan_AA","Titan_AP","Titan_AT","300Rnd_20mm_shells","1000Rnd_20mm_shells","2000Rnd_20mm_shells","300Rnd_25mm_shells","1000Rnd_25mm_shells","250Rnd_30mm_HE_shells","250Rnd_30mm_HE_shells_Tracer_Red","250Rnd_30mm_HE_shells_Tracer_Green","250Rnd_30mm_APDS_shells","250Rnd_30mm_APDS_shells_Tracer_Red","250Rnd_30mm_APDS_shells_Tracer_Green","250Rnd_30mm_APDS_shells_Tracer_Yellow","140Rnd_30mm_MP_shells","140Rnd_30mm_MP_shells_Tracer_Red","140Rnd_30mm_MP_shells_Tracer_Green","140Rnd_30mm_MP_shells_Tracer_Yellow","60Rnd_30mm_APFSDS_shells","60Rnd_30mm_APFSDS_shells_Tracer_Red","60Rnd_30mm_APFSDS_shells_Tracer_Green","60Rnd_30mm_APFSDS_shells_Tracer_Yellow","60Rnd_40mm_GPR_shells","60Rnd_40mm_GPR_Tracer_Red_shells","60Rnd_40mm_GPR_Tracer_Green_shells","60Rnd_40mm_GPR_Tracer_Yellow_shells","40Rnd_40mm_APFSDS_shells","40Rnd_40mm_APFSDS_Tracer_Red_shells","40Rnd_40mm_APFSDS_Tracer_Green_shells","40Rnd_40mm_APFSDS_Tracer_Yellow_shells","8Rnd_LG_scalpel","6Rnd_LG_scalpel","2Rnd_LG_scalpel","2Rnd_LG_scalpel_hidden","14Rnd_80mm_rockets","38Rnd_80mm_rockets","12Rnd_230mm_rockets","2Rnd_AAA_missiles","2Rnd_AAA_missiles_MI02","4Rnd_AAA_missiles","4Rnd_AAA_missiles_MI02","4Rnd_GAA_missiles","4Rnd_Titan_long_missiles","5Rnd_GAT_missiles","2Rnd_GAT_missiles","30Rnd_120mm_HE_shells","30Rnd_120mm_HE_shells_Tracer_Red","30Rnd_120mm_HE_shells_Tracer_Green","30Rnd_120mm_HE_shells_Tracer_Yellow","16Rnd_120mm_HE_shells","16Rnd_120mm_HE_shells_Tracer_Red","16Rnd_120mm_HE_shells_Tracer_Green","16Rnd_120mm_HE_shells_Tracer_Yellow","30Rnd_120mm_APFSDS_shells","30Rnd_120mm_APFSDS_shells_Tracer_Red","30Rnd_120mm_APFSDS_shells_Tracer_Green","30Rnd_120mm_APFSDS_shells_Tracer_Yellow","32Rnd_120mm_APFSDS_shells","32Rnd_120mm_APFSDS_shells_Tracer_Red","32Rnd_120mm_APFSDS_shells_Tracer_Green","32Rnd_120mm_APFSDS_shells_Tracer_Yellow","680Rnd_35mm_AA_shells","680Rnd_35mm_AA_shells_Tracer_Red","680Rnd_35mm_AA_shells_Tracer_Green","680Rnd_35mm_AA_shells_Tracer_Yellow","6Rnd_AAT_missiles","4Rnd_AAT_missiles","1Rnd_GAA_missiles","1Rnd_GAT_missiles","2Rnd_GBU12_LGB","2Rnd_GBU12_LGB_MI10","2Rnd_Mk82","2Rnd_Mk82_MI08","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder","10Rnd_762x51_Mag","10Rnd_762x54_Mag","5Rnd_127x108_APDS_Mag","B_IR_Grenade","O_IR_Grenade","I_IR_Grenade","28Rnd_120mm_APFSDS_shells","24Rnd_125mm_APFSDS","28Rnd_120mm_APFSDS_shells_Tracer_Red","24Rnd_125mm_APFSDS_T_Red","28Rnd_120mm_APFSDS_shells_Tracer_Green","24Rnd_125mm_APFSDS_T_Green","28Rnd_120mm_APFSDS_shells_Tracer_Yellow","24Rnd_125mm_APFSDS_T_Yellow","14Rnd_120mm_HE_shells","12Rnd_125mm_HE","14Rnd_120mm_HE_shells_Tracer_Red","12Rnd_125mm_HE_T_Red","14Rnd_120mm_HE_shells_Tracer_Green","12Rnd_125mm_HE_T_Green","14Rnd_120mm_HE_shells_Tracer_Yellow","12Rnd_125mm_HE_T_Yellow","12Rnd_125mm_HEAT","12Rnd_125mm_HEAT_T_Red","12Rnd_125mm_HEAT_T_Green","12Rnd_125mm_HEAT_T_Yellow","200Rnd_762x51_Belt","200Rnd_762x51_Belt_Red","200Rnd_762x51_Belt_T_Red","200Rnd_762x51_Belt_Green","200Rnd_762x51_Belt_T_Green","200Rnd_762x51_Belt_Yellow","200Rnd_762x51_Belt_T_Yellow","1000Rnd_762x51_Belt","1000Rnd_762x51_Belt_Red","1000Rnd_762x51_Belt_T_Red","1000Rnd_762x51_Belt_Green","1000Rnd_762x51_Belt_T_Green","1000Rnd_762x51_Belt_Yellow","1000Rnd_762x51_Belt_T_Yellow","2000Rnd_762x51_Belt","2000Rnd_762x51_Belt_Red","2000Rnd_762x51_Belt_T_Red","2000Rnd_762x51_Belt_Green","2000Rnd_762x51_Belt_T_Green","2000Rnd_762x51_Belt_Yellow","2000Rnd_762x51_Belt_T_Yellow","1000Rnd_Gatling_30mm_Plane_CAS_01_F","2Rnd_Missile_AA_04_F","6Rnd_Missile_AGM_02_F","7Rnd_Rocket_04_HE_F","7Rnd_Rocket_04_AP_F","4Rnd_Bomb_04_F","500Rnd_Cannon_30mm_Plane_CAS_02_F","2Rnd_Missile_AA_03_F","4Rnd_Missile_AGM_01_F","20Rnd_Rocket_03_HE_F","20Rnd_Rocket_03_AP_F","2Rnd_Bomb_03_F","40Rnd_105mm_APFSDS","40Rnd_105mm_APFSDS_T_Red","40Rnd_105mm_APFSDS_T_Green","40Rnd_105mm_APFSDS_T_Yellow","20Rnd_105mm_HEAT_MP","20Rnd_105mm_HEAT_MP_T_Red","20Rnd_105mm_HEAT_MP_T_Green","20Rnd_105mm_HEAT_MP_T_Yellow","ATMine_Range_Mag","APERSMine_Range_Mag","APERSBoundingMine_Range_Mag","SLAMDirectionalMine_Wire_Mag","APERSTripMine_Wire_Mag","ClaymoreDirectionalMine_Remote_Mag","SatchelCharge_Remote_Mag","DemoCharge_Remote_Mag","IEDUrbanBig_Remote_Mag","IEDLandBig_Remote_Mag","IEDUrbanSmall_Remote_Mag","IEDLandSmall_Remote_Mag","1550Rnd_20mm_Tracer_Red","300Rnd_20mm_Tracer_Red","1550Rnd_20mm_Tracer_Yellow","300Rnd_20mm_Tracer_Yellow","1550Rnd_20mm_Tracer_Green","300Rnd_20mm_Tracer_Green","300Rnd_25mm_Tracer_Red","300Rnd_25mm_Tracer_Yellow","300Rnd_25mm_Tracer_Green","21Rnd_AAA_RIM_116","8Rnd_AAA_RIM_7","RPG7_PG7V","RPG7_PG7V_AA","RPG7_PG7V_APERS","RPG7_PG7V_APERS_AA","RPG7_PG7VM","RPG7_PG7VM_AA","RPG7_PG7VM_APERS","RPG7_PG7VM_APERS_AA","RPG7_PG7VL","RPG7_PG7VL_AA","RPG7_PG7VL_APERS","RPG7_PG7VL_APERS_AA","RPG7_PG7VR","RPG7_OG7V","RPG7_TBG7V","6Rnd_GreenSignal_F","6Rnd_RedSignal_F","rhs_mag_902a","rhs_mag_3d17","rhs_mag_3d17_6","rhs_mag_smokegen","rhs_LaserMag","rhs_mag_bm_base","rhs_mag_br412_14","rhs_mag_br412_17","rhs_mag_bm25_14","rhs_mag_bm8_14","rhs_mag_bm4_15","rhs_mag_bm23_15","rhs_mag_3bm_base","rhs_mag_3bm9_10","rhs_mag_3bm12_10","rhs_mag_3bm15_10","rhs_mag_3bm17_10","rhs_mag_3bm17_14","rhs_mag_3bm22_10","rhs_mag_3bm22_14","rhs_mag_3bm26_10","rhs_mag_3bm29_10","rhs_mag_3bm32_10","rhs_mag_3bm42_10","rhs_mag_3bm42_7","rhs_mag_3bm42m_10","rhs_mag_3bm46_10","rhs_mag_bk_base","rhs_mag_bk5_8","rhs_mag_bk17_8","rhs_mag_bk4_5","rhs_mag_bk15_5","rhs_mag_3bk_base","rhs_mag_3bk12_8","rhs_mag_3bk14_8","rhs_mag_3bk18_8","rhs_mag_3bk18m_8","rhs_mag_3bk18m_6","rhs_mag_3bk21_8","rhs_mag_3bk29_8","rhs_mag_3bk31_8","rhs_mag_of_base","rhs_mag_of412_17","rhs_mag_of412_21","rhs_mag_of412_18","rhs_mag_of11_20","rhs_mag_of28_20","rhs_mag_3of_base","rhs_mag_3of11_6","rhs_mag_3of26_6","rhs_mag_3of26_5","rhs_mag_pg15v_24","rhs_mag_pg15v_20","rhs_mag_pg15v_12","rhs_mag_og15v_16","rhs_mag_og15v_20","rhs_mag_og15v_8","rhs_mag_3UOF17_22","rhs_mag_3UOF19_22","rhs_mag_9m41_20","rhs_mag_HE_2a33","rhs_mag_WP_2a33","rhs_mag_Atomic_2a33","rhs_mag_LASER_2a33","rhs_mag_SMOKE_2a33","rhs_mag_ILLUM_2a33","rhs_mag_9m14m_3","rhs_mag_9m14m_4","rhs_mag_9m112_6","rhs_mag_9m112m_6","rhs_mag_9m112m_4","rhs_mag_9m113_3","rhs_mag_9m113_4","rhs_mag_9m117_3","rhs_mag_9m117_8","rhs_mag_9m118_3","rhs_mag_9m119_6","rhs_mag_9m119_4","rhs_mag_9m119rx_6","rhs_mag_9m119m_6","rhs_mag_9m119m_4","rhs_mag_9m128_6","rhs_mag_9m133_2","rhs_mag_3m7_12","rhs_mag_9K114","rhs_mag_9m120","rhs_mag_R73","rhs_mag_ch29","rhs_mag_vikhr_12","rhs_mag_s8_12","rhs_mag_s8_20","rhs_mag_s8_40","rhs_mag_s8_80","rhs_mag_s8_120","rhs_mag_s8_DF_20","rhs_mag_s8_DF_40","rhs_mag_s8_DF_80","rhs_mag_s8_T_20","rhs_mag_s8_T_40","rhs_mag_s8_T_80","rhs_mag_s5_32","rhs_mag_s5_16","rhs_mag_s5_128","rhs_mag_s5_192","rhs_mag_b8v20a_pod","rhs_mag_b8m1_pod","rhs_mag_ub16_pod","rhs_mag_ub32_pod","rhs_mag_upk23_pod","rhs_mag_falanga_pod","rhs_mag_ataka_tube","rhs_mag_ataka_tube_2","rhs_mag_40Rnd_122mm_rockets","rhs_mag_fab250","rhs_mag_fab250_2","rhs_mag_fab250_4","rhs_mag_3uor6_230","rhs_mag_3uor6_250","rhs_mag_3uor6_150","rhs_mag_3uor6_340","rhs_mag_3uor6_305","rhs_mag_3uof8_340","rhs_mag_3uof8_305","rhs_mag_3ubr6_230","rhs_mag_3ubr6_250","rhs_mag_3ubr6_150","rhs_mag_3ubr6_160","rhs_mag_3ubr6_195","rhs_mag_3ubr8_160","rhs_mag_3ubr8_195","rhs_mag_AZP23_250","rhs_mag_AM23_500","rhs_mag_gsh30_ofzt_750","rhs_mag_gsh30_bt_750","rhs_mag_gsh30_ofzt_250","rhs_mag_gsh30_bt_250","rhs_mag_762x54mm_100","rhs_mag_762x54mm_250","rhs_mag_762x54mm_500","rhs_mag_762x54mm_1000","rhs_mag_762x54mm_2000","rhs_mag_127x108mm_50","rhs_mag_127x108mm_150","rhs_mag_127x108mm_1470","rhs_mag_145x115mm_50","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK_no_tracers","rhs_30Rnd_545x39_AK_green","rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_7N22_AK","rhs_45Rnd_545X39_7N22_AK","rhs_45Rnd_545X39_7N10_AK","rhs_45Rnd_545X39_AK_Green","rhs_45Rnd_545X39_AK","rhs_VOG25","rhs_VOG25P","rhs_VG40TB","rhs_VG40SZ","rhs_VG40OP_white","rhs_VG40OP_green","rhs_VG40OP_red","rhs_GRD40_White","rhs_GRD40_Green","rhs_GRD40_Red","rhs_100Rnd_762x54mmR","rhs_100Rnd_762x54mmR_green","rhs_10Rnd_762x54mmR_7N1","rhs_30Rnd_762x39mm","rhs_30Rnd_762x39mm_tracer","rhs_30Rnd_762x39mm_89","rhs_mine_pmn2_mag","rhs_mine_tm62m_mag","rhs_rpg26_mag","rhs_rshg2_mag","rhs_rpg18_mag","rhs_launcher_dummy_mag","rhs_rpg7_PG7VL_mag","rhs_rpg7_PG7VR_mag","rhs_rpg7_TBG7V_mag","rhs_rpg7_OG7V_mag","rhs_mag_9k32_rocket","rhs_mag_9k38_rocket","rhs_mag_9x19_17","rhs_mag_9x18_12_57N181S","rhs_mag_rsp30_red","rhs_mag_rsp30_green","rhs_mag_rsp30_white","rhs_mag_rgd5","rhs_mag_rdg2_white","rhs_mag_rdg2_black","rhs_mag_nspn_yellow","rhs_mag_nspn_red","rhs_mag_nspn_green","rhs_mag_nspd","rhs_mag_fakel","rhs_mag_fakels","rhs_mag_zarya2","rhs_mag_plamyam","rhs_mag_30Rnd_556x45_M855A1_Stanag","rhs_mag_30Rnd_556x45_M855A1_Stanag_No_Tracer","rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red","rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Green","rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk262_Stanag","rhs_mag_30Rnd_556x45_M200_Stanag","rhs_mag_M441_HE","rhs_mag_M433_HEDP","rhs_mag_m4009","rhs_mag_m576","rhs_mag_M585_white","rhs_mag_m661_green","rhs_mag_m662_red","rhs_mag_m713_Red","rhs_mag_m714_White","rhs_mag_m715_Green","rhs_mag_m716_yellow","rhsusf_5Rnd_300winmag_xm2010","rhsusf_5Rnd_00Buck","rhsusf_8Rnd_00Buck","rhsusf_5Rnd_doomsday_Buck","rhsusf_8Rnd_doomsday_Buck","rhsusf_100Rnd_556x45_soft_pouch","rhsusf_100Rnd_556x45_M200_soft_pouch","rhsusf_200Rnd_556x45_soft_pouch","rhsusf_100Rnd_762x51","rhsusf_100Rnd_762x51_m80a1epr","rhsusf_100Rnd_762x51_m993","rhsusf_20Rnd_762x51_m118_special_Mag","rhsusf_20Rnd_762x51_m993_Mag","rhsusf_mag_7x45acp_MHP","rhs_m136_mag","rhs_dummy_mag","rhs_m136_hedp_mag","rhs_m136_hp_mag","rhs_fim92_mag","rhs_fgm148_magazine_AT","rhs_mine_M19_mag","rhs_mag_m67","rhs_mag_m69","rhs_mag_mk84","rhs_mag_an_m8hc","rhs_mag_an_m14_th3","rhs_mag_m7a3_cs","rhs_mag_mk3a2","rhs_mag_m18_smoke_base","rhs_mag_m18_green","rhs_mag_m18_purple","rhs_mag_m18_red","rhs_mag_m18_yellow","100Rnd_23mm_AZP85","100Rnd_23mm_AZP85_red","100Rnd_23mm_AZP85_yellow","100Rnd_23mm_AZP85_green","10Rnd_338_Mag","130Rnd_338_Mag","10Rnd_127x54_Mag","150Rnd_93x64_Mag","10Rnd_93x64_DMR_05_Mag","hlc_30rnd_556x45_EPR","hlc_30rnd_556x45_SOST","hlc_30rnd_556x45_SPR","hlc_50Rnd_45ACP_B_1921","hlc_50Rnd_45ACP_T_1921","FH_MP5_9x19_Ball","hlc_50rnd_9x19_B_9mmar","hlc_30Rnd_545x39_B_AK","hlc_30Rnd_545x39_t_ak","hlc_45Rnd_545x39_t_rpk","hlc_30Rnd_545x39_EP_ak","hlc_5Rnd_12G_Slug_Trench","hlc_5Rnd_12G_Buck_Trench","hlc_5Rnd_12G_DISTRACTION_Trench","hlc_30Rnd_303_B_bren","hlc_30Rnd_303_T_bren","hlc_30Rnd_303_AP_bren","hlc_10Rnd_303_B_enfield","hlc_10Rnd_303_T_enfield","hlc_10Rnd_303_AP_enfield","hlc_6Rnd_735_B_Carcano","hlc_6Rnd_735_T_Carcano","hlc_5Rnd_792_T_Kar98","hlc_5Rnd_792_AP_Kar98","hlc_50Rnd_57x28_JHP_P90","hlc_50Rnd_57x28_FMJ_P90","hlc_32rnd_9x19_B_sten","hlc_8Rnd_45ACP_B_hk45","hlc_10Rnd_45ACP_B_hk45","hlc_8Rnd_45ACP_T_hk45","hlc_12Rnd_45ACP_B_mk23","hlc_12Rnd_45ACP_S_mk23","hlc_12Rnd_45ACP_T_mk23","hlc_8Rnd_44mag_B_deagle","hlc_8Rnd_44mag_JHP_deagle","hlc_50Rnd_44mag_B_deagle","hlc_50Rnd_44mag_FUN","hlc_10rnd_12g_buck_S12","hlc_10rnd_12g_slug_S12","hlc_30Rnd_545x39_S_AK","hlc_30Rnd_762x39_b_ak","hlc_30Rnd_762x39_t_ak","hlc_30rnd_762x39_s_ak","hlc_45Rnd_762x39_t_rpk","hlc_45Rnd_762x39_m_rpk","hlc_75Rnd_762x39_m_rpk","hlc_VOG25_AK","hlc_GRD_White","hlc_GRD_Red","hlc_GRD_green","hlc_GRD_yellow","hlc_GRD_orange","hlc_GRD_purple","hlc_GRD_blue","hlc_30Rnd_556x45_B_AUG","hlc_30Rnd_556x45_SOST_AUG","hlc_30Rnd_556x45_SPR_AUG","hlc_30Rnd_556x45_T_AUG","hlc_40Rnd_556x45_B_AUG","hlc_40Rnd_556x45_SOST_AUG","hlc_40Rnd_556x45_SPR_AUG","hlc_25Rnd_9x19mm_M882_AUG","hlc_25Rnd_9x19mm_JHP_AUG","hlc_25Rnd_9x19mm_subsonic_AUG","hlc_20Rnd_762x51_B_fal","hlc_20Rnd_762x51_mk316_fal","hlc_20Rnd_762x51_barrier_fal","hlc_20Rnd_762x51_T_fal","hlc_20Rnd_762x51_S_fal","hlc_50rnd_762x51_M_FAL","hlc_20rnd_762x51_b_G3","hlc_20rnd_762x51_Mk316_G3","hlc_20rnd_762x51_barrier_G3","hlc_20rnd_762x51_T_G3","hlc_50rnd_762x51_M_G3","hlc_20rnd_762x51_S_G3","hlc_30rnd_556x45_EPR_HK33","hlc_30rnd_556x45_SOST_HK33","hlc_30rnd_556x45_b_HK33","hlc_30rnd_556x45_t_HK33","hlc_20Rnd_762x51_B_M14","hlc_20Rnd_762x51_mk316_M14","hlc_20Rnd_762x51_barrier_M14","hlc_20Rnd_762x51_T_M14","hlc_50Rnd_762x51_B_M14","hlc_20Rnd_762x51_S_M14","hlc_100Rnd_762x51_B_M60E4","hlc_100Rnd_762x51_M_M60E4","hlc_100Rnd_762x51_Barrier_M60E4","hlc_100Rnd_762x51_T_M60E4","hlc_30Rnd_9x19_B_MP5","hlc_30Rnd_9x19_GD_MP5","hlc_30Rnd_9x19_SD_MP5","hlc_30Rnd_10mm_B_MP5","hlc_30Rnd_10mm_JHP_MP5","hlc_200rnd_556x45_M_SAW","hlc_200rnd_556x45_T_SAW","hlc_200rnd_556x45_B_SAW","js_m_fa18_m61","js_m_fa18_aim9x_x1","js_m_fa18_aim120c_x1","js_m_fa18_Maverick_x1","js_m_fa18_Harpoon_x1","js_m_fa18_GBU12_x1","js_m_fa18_MK82_x1","js_m_fa18_GBU38_JDAM_x1","js_m_fa18_GBU32_JDAM_x1","js_m_fa18_GBU31_JDAM_x1","js_m_fa18_bombrack_x1","js_m_fa18_altflir_pod_x1","js_m_fa18_wing_tank_x1","js_m_fa18_buddypod_x1","js_m_fa18_empty","js_m_fa18_fake_empty","js_m_su35_gsh","js_m_su35_r73_x1","js_m_su35_r77_x1","js_m_su35_kh29_x1","js_m_su35_kab500l_x1","js_m_su35_S8_rocket_x1","js_m_su35_S8_rocketpod_x1","js_m_su35_S8_rocketpod_x2","js_m_su35_wing_tank_x1","js_m_su35_buddypod_x1","js_m_su35_empty","js_m_su35_fake_empty","RH_20Rnd_762x51_AR10","RH_20Rnd_762x51_M80A1","RH_20Rnd_762x51_Mk316LR","RH_20Rnd_762x51_Mk319","RH_20Rnd_762x51_LFMJSB","RH_30Rnd_68x43_FMJ","RH_30Rnd_68x43_Match","RH_60Rnd_556x45_M855A1","RH_60Rnd_556x45_Mk318","RH_60Rnd_556x45_Mk262","RH_30Rnd_556x45_M855A1","RH_30Rnd_556x45_Mk318","RH_30Rnd_556x45_Mk262","RH_20Rnd_556x45_M855A1","RH_20Rnd_556x45_Mk318","RH_20Rnd_556x45_Mk262","RH_30Rnd_762x35_FMJ","RH_30Rnd_762x35_Match","RH_30Rnd_762x35_MSB","RH_32Rnd_9mm_M822","RH_32Rnd_9mm_HP","RH_32Rnd_9mm_HPSB","UK3CB_BAF_17Rnd_9mm","UK3CB_BAF_10Rnd_127x99mm","UK3CB_BAF_10Rnd_127x99mm_SLAP","UK3CB_BAF_30Rnd_9mm","UK3CB_BAF_L128A1_Pellets","UK3CB_BAF_L128A1_Slugs","UK3CB_BAF_30Rnd_Blank","UK3CB_BAF_30Rnd","UK3CB_BAF_30Rnd_T","UK3CB_BAF_75Rnd","UK3CB_BAF_75Rnd_T","UK3CB_BAF_100Rnd","UK3CB_BAF_200Rnd","UK3CB_BAF_100Rnd_T","UK3CB_BAF_200Rnd_T","UK3CB_BAF_L115A3_Mag","UK3CB_BAF_20Rnd","UK3CB_BAF_20Rnd_T","BWA3_ItemKestrel_Base","BWA3_ItemKestrel","BWA3_15Rnd_9x19_P8","BWA3_40Rnd_46x30_MP7","BWA3_40Rnd_46x30_MP7_SD","BWA3_30Rnd_556x45_G36","BWA3_30Rnd_556x45_G36_Tracer","BWA3_30Rnd_556x45_G36_Tracer_Dim","BWA3_30Rnd_556x45_G36_SD","BWA3_30Rnd_556x45_G36_AP","BWA3_100Rnd_556x45_G36","BWA3_100Rnd_556x45_G36_Tracer","BWA3_10Rnd_762x51_G28","BWA3_10Rnd_762x51_G28_Tracer","BWA3_10Rnd_762x51_G28_Tracer_Dim","BWA3_10Rnd_762x51_G28_SD","BWA3_10Rnd_762x51_G28_AP","BWA3_10Rnd_762x51_G28_LR","BWA3_20Rnd_762x51_G28","BWA3_20Rnd_762x51_G28_Tracer","BWA3_20Rnd_762x51_G28_Tracer_Dim","BWA3_20Rnd_762x51_G28_AP","BWA3_20Rnd_762x51_G28_SD","BWA3_200Rnd_556x45","BWA3_120Rnd_762x51","BWA3_10Rnd_127x99_G82","BWA3_10Rnd_127x99_G82_Tracer","BWA3_10Rnd_127x99_G82_Tracer_Dim","BWA3_10Rnd_127x99_G82_AP","BWA3_10Rnd_127x99_G82_AP_Tracer","BWA3_10Rnd_127x99_G82_SD","BWA3_10Rnd_127x99_G82_Raufoss","BWA3_10Rnd_127x99_G82_Raufoss_Tracer","BWA3_10Rnd_127x99_G82_Raufoss_Tracer_Dim","BWA3_UsedTube","BWA3_Pzf3_IT","BWA3_RGW90_HH","BWA3_Fliegerfaust_Mag","BWA3_DM51A1","BWA3_DM25","BWA3_DM32_Orange","BWA3_DM32_Yellow","BWA3_2Rnd_Spike_LR","BWA3_1Rnd_KE_shells","BWA3_1Rnd_HE_shells","BWA3_1Rnd_MZ_shells","BWA3_1Rnd_Canister_shells","BWA3_1Rnd_LAHAT","BWA3_Loader_A","BWA3_Loader_B","BWA3_Loader_C","BWA3_Loader_D","BWA3_Loader_E","BWA3_160Rnd_HE_shells","BWA3_160Rnd_ABM_shells","BWA3_240Rnd_APFSDS_shells","BWA3_2000Rnd_556x45","BWA3_1200Rnd_762x51","ItemCore","RDS_2000Rnd_23mm_AZP85","RDS_40Rnd_23mm_AZP85","RDS_50Rnd_127x107_DSHKM","RDS_150Rnd_127x107_DSHKM","RDS_150Rnd_127x108_KORD","RDS_50Rnd_127x108_KORD","RDS_29Rnd_30mm_AGS30","RDS_6Rnd_AT13","RDS_PG9_AT","RDS_OG9_HE","RDS_Strela","RDS_Igla","RDS_2Rnd_Igla","RDS_30Rnd_122mmHE_D30","RDS_30Rnd_122mmWP_D30","RDS_30Rnd_122mmLASER_D30","RDS_30Rnd_122mmSMOKE_D30","RDS_30Rnd_122mmILLUM_D30","RDS_30Rnd_122mmAT_D30","RDS_30Rnd_105mmHE_M119","RDS_30Rnd_105mmWP_M119","RDS_30Rnd_105mmLASER_M119","RDS_30Rnd_105mmSMOKE_M119","RDS_30Rnd_105mmILLUM_M119","RDS_48Rnd_40mm_MK19","RDS_6Rnd_TOW_HMMWV","RDS_2Rnd_TOW","RDS_6Rnd_TOW2","RDS_2Rnd_TOW2","1_Rnd_RHS_9M79_1_F","1_Rnd_RHS_9M79_1_K","1_Rnd_RHS_9M79B","rhs_mag_M1069","rhs_mag_M416","rhs_mag_M829","rhs_mag_M829A1","rhs_mag_M829A2","rhs_mag_M829A3","rhs_mag_M830","rhs_mag_M830A1","rhs_mag_70Rnd_25mm_M242_APFSDS","rhs_mag_230Rnd_25mm_M242_HEI","rhs_mag_1100Rnd_762x51_M240","rhs_mag_762x51_M240_1200","rhs_mag_M197_750","rhs_mag_762x51_M240","rhs_mag_762x51_M240_200","rhs_mag_30x113mm_M789_HEDP_1200","RHS_48Rnd_40mm_MK19","RHS_48Rnd_40mm_MK19_M430I","RHS_48Rnd_40mm_MK19_M1001","rhs_mag_100rnd_127x99_mag","rhs_mag_100rnd_127x99_mag_Tracer_Red","rhs_mag_100rnd_127x99_mag_Tracer_Green","rhs_mag_100rnd_127x99_mag_Tracer_Yellow","rhs_mag_Sidewinder_2","rhs_mag_Sidewinder_heli_2","rhs_mag_Hellfire_8","rhs_mag_Hellfire_4","rhs_mag_Hellfire_16","rhs_mag_agm65","rhs_mag_FFAR_14","rhs_mag_FFAR_28","rhs_mag_FFAR_38","rhs_mag_FFAR_76","rhs_mag_2Rnd_TOW","Rhs_mag_4Rnd_stinger","rhs_mag_ANALQ131","rhs_pod_hellfire","rhs_pod_FFAR","rhs_pod_hellfire_green","rhs_pod_FFAR_green","rhs_mag_gbu12_4","BWA3_SmokeLauncherMag","tf47_at4_m_HEAT","tf47_at4_m_HEDP","tf47_at4_m_HP","tf47_m3maaws_HEAT","tf47_m3maaws_HEDP","tf47_m3maaws_HE","tf47_m3maaws_SMOKE","tf47_m3maaws_ILLUM","tf47_m3maaws_AreaDefense","ACE_FakeMagazine","ACE_PreloadedMissileDummy","ACE_FiredMissileDummy","ACE_UsedTube_F","ACE_HandFlare_Base","ACE_HandFlare_White","ACE_HandFlare_Red","ACE_HandFlare_Green","ACE_HandFlare_Yellow","ACE_M84","6Rnd_ACE_Hydra70_DAGR","12Rnd_ACE_Hydra70_DAGR","24Rnd_ACE_Hydra70_DAGR","6Rnd_ACE_Hellfire_AGM114K","12Rnd_ACE_Hellfire_AGM114K","24Rnd_ACE_Hellfire_AGM114K","30Rnd_65x39_caseless_green_Tracer","ACE_key_customKeyMagazine","ACE_500Rnd_20mm_shells_Comanche","ACE_100Rnd_65x39_caseless_mag_Tracer_Dim","ACE_200Rnd_65x39_cased_Box_Tracer_Dim","ACE_30Rnd_65x39_caseless_mag_Tracer_Dim","ACE_30Rnd_65x39_caseless_green_mag_Tracer_Dim","ACE_30Rnd_556x45_Stanag_M995_AP_mag","ACE_30Rnd_556x45_Stanag_Mk262_mag","ACE_30Rnd_556x45_Stanag_Mk318_mag","ACE_30Rnd_556x45_Stanag_Tracer_Dim","ACE_20Rnd_762x51_Mag_Tracer","ACE_20Rnd_762x51_Mag_Tracer_Dim","ACE_20Rnd_762x51_Mag_SD","ACE_10Rnd_762x51_M118LR_Mag","ACE_10Rnd_762x51_Mk316_Mod_0_Mag","ACE_10Rnd_762x51_Mk319_Mod_0_Mag","ACE_10Rnd_762x51_M993_AP_Mag","ACE_20Rnd_762x51_M118LR_Mag","ACE_20Rnd_762x51_Mk316_Mod_0_Mag","ACE_20Rnd_762x51_Mk319_Mod_0_Mag","ACE_20Rnd_762x51_M993_AP_Mag","ACE_20Rnd_762x67_Mk248_Mod_0_Mag","ACE_20Rnd_762x67_Mk248_Mod_1_Mag","ACE_20Rnd_762x67_Berger_Hybrid_OTM_Mag","ACE_30Rnd_65x47_Scenar_mag","ACE_30Rnd_65_Creedmor_mag","ACE_10Rnd_338_300gr_HPBT_Mag","ACE_10Rnd_338_API526_Mag","ACE_5Rnd_127x99_Mag","ACE_5Rnd_127x99_API_Mag","ACE_5Rnd_127x99_AMAX_Mag","ACE_30Rnd_9x19_mag","ACE_16Rnd_9x19_mag","ACE_10Rnd_762x54_Tracer_mag","ACE_120Rnd_35mm_ABM_shells","ACE_120Rnd_35mm_ABM_shells_Tracer_Red","ACE_120Rnd_35mm_ABM_shells_Tracer_Green","ACE_120Rnd_35mm_ABM_shells_Tracer_Yellow"];
{_magazines = _magazines - [_x]} forEach ["RH_60Rnd_556x45_M855A1","RH_60Rnd_556x45_Mk262","RH_60Rnd_556x45_Mk318","rhsusf_5Rnd_doomsday_Buck","rhsusf_8Rnd_doomsday_Buck","IEDUrbanBig_Remote_Mag","IEDLandBig_Remote_Mag","IEDUrbanSmall_Remote_Mag","IEDLandSmall_Remote_Mag"];

// All accessories
_accessories = ["muzzle_snds_H","muzzle_snds_L","muzzle_snds_M","muzzle_snds_B","muzzle_snds_H_MG","muzzle_snds_H_SW","acc_flashlight","acc_pointer_IR","muzzle_snds_acp","muzzle_snds_338_black","muzzle_snds_338_green","muzzle_snds_338_sand","muzzle_snds_93mmg","muzzle_snds_93mmg_tan","bipod_01_F_snd","bipod_01_F_blk","bipod_01_F_mtp","bipod_02_F_blk","bipod_02_F_tan","bipod_02_F_hex","bipod_03_F_blk","bipod_03_F_oli","rhs_bipod","rhs_silencer_base","rhs_acc_tgpa","rhs_acc_pbs1","rhs_acc_tgpv","rhs_acc_dtk4short","rhs_acc_dtk4long","rhs_acc_dtk4screws","rhs_acc_dtk3","rhs_acc_dtk1","rhs_acc_dtk","rhs_acc_ak5","rhsusf_acc_harris_bipod","rhs_acc_at4_handler","rhsusf_acc_anpeq15A","rhsusf_acc_anpeq15","rhsusf_acc_anpeq15_light","rhsusf_acc_anpeq15side","rhsusf_silencer_base","rhsusf_acc_M2010S","rhsusf_acc_SR25S","rhsusf_acc_rotex5_grey","rhsusf_acc_rotex5_tan","rhsusf_m4muzzlebreak_base","rhsusf_acc_SF3P556","rhsusf_acc_SFMB556","hlc_muzzle_545SUP_AK","hlc_muzzle_762SUP_AK","hlc_muzzle_snds_AUG","hlc_muzzle_snds_a6AUG","hlc_muzzle_snds_fal","hlc_muzzle_snds_g3","hlc_muzzle_snds_HK33","hlc_muzzle_snds_M14","hlc_muzzle_Agendasix","hlc_muzzle_Tundra","hlc_muzzle_Agendasix10mm","RH_HBLM","RH_HBLM_tg","RH_HBLM_des","RH_HBLM_wdl","RH_TD_ACB","RH_TD_ACB_g","RH_TD_ACB_b","RH_qdss_nt4","RH_qdss_nt4_tg","RH_qdss_nt4_des","RH_qdss_nt4_wdl","RH_saker","RH_Saker_tg","RH_Saker_des","RH_Saker_wdl","RH_Saker762","RH_Saker762_tg","RH_Saker762_des","RH_Saker762_wdl","RH_fa556","RH_fa556_tg","RH_fa556_des","RH_fa556_wdl","RH_fa762","RH_fa762_tg","RH_fa762_des","RH_fa762_wdl","RH_m110sd","RH_m110sd_t","RH_spr_mbs","RH_spr_mbs_tg","RH_spr_mbs_des","RH_spr_mbs_wdl","RH_tundra","RH_tundra_tg","RH_tundra_des","RH_tundra_wdl","RH_peq15","RH_peq15_top","RH_peq15b","RH_peq15b_top","RH_peq2","RH_peq2_top","RH_SFM952V","RH_SFM952V_tan","RH_hbsd","RH_m4covers_s","RH_m4covers_f","RH_m16covers_s","RH_m16covers_f","UK3CB_BAF_LLM_IR","UK3CB_BAF_LLM_Flashlight","UK3CB_BAF_sffh","UK3CB_BAF_bfa","UK3CB_BAF_L115A3_Silencer","UK3CB_BAF_L85_Silencer","UK3CB_BAF_L110A1_Silencer","UK3CB_BAF_L91A1_Silencer","BWA3_acc_LLM01_irlaser","BWA3_acc_LLM01_flash","BWA3_muzzle_snds_G28","BWA3_muzzle_snds_G36","BWA3_muzzle_snds_MG4","BWA3_muzzle_snds_MG5","BWA3_muzzle_snds_MP7","tf47_fakeitem_at4","ACE_muzzle_mzls_H","ACE_muzzle_mzls_B","ACE_muzzle_mzls_L","ACE_muzzle_mzls_smg_01","ACE_muzzle_mzls_smg_02","ACE_muzzle_mzls_338","ACE_muzzle_mzls_93mmg","ACE_acc_pointer_red","ACE_acc_pointer_green_IR","ACE_acc_pointer_green"];
_shortMidRange = ["optic_PGO7V","optic_PGO7V2","optic_PGO7V3","optic_NSPU_RPG","optic_Arco","optic_Hamr","optic_Aco","optic_ACO_grn","optic_Aco_smg","optic_ACO_grn_smg","optic_Holosight","optic_Holosight_smg","optic_MRCO","optic_Yorris","optic_MRD","iansky_specterdr","iansky_specterdr_2d","iansky_specterdr_d","iansky_specterdr_d_2D","iansky_specterdr_fde","iansky_specterdr_fde_2D","iansky_specterdr_t","iansky_specterdr_t_2D","iansky_specterdrkf","iansky_specterdrkf_2D","iansky_specterdrkf_d","iansky_specterdrkf_d_2D","iansky_specterdrkf_fde","iansky_specterdrkf_fde_2D","iansky_specterdrkf_t","iansky_specterdrkf_t_2D","iansky_cmore","iansky_cmore_g","iansky_cmore_gy","iansky_rds","iansky_rx01","iansky_rx01kf","iansky_t1","iansky_t1s","iansky_t1kf","iansky_deltapoint","rhs_acc_sniper_base","rhs_acc_1p29","rhs_acc_1p78","rhs_acc_pkas","rhs_acc_1p63","rhs_acc_ekp1","rhs_acc_ekp1b","rhs_acc_ekp1c","rhs_acc_ekp1d","rhs_acc_pso1m2","rhs_acc_npz","rhs_acc_pgo7v","rhs_acc_1pn93_base","rhs_acc_1pn93_1","rhs_acc_1pn93_2","rhsusf_acc_compm4","rhsusf_acc_eotech_552","rhsusf_acc_ELCAN","rhsusf_acc_ELCAN_pip","rhsusf_acc_ACOG","rhsusf_acc_ACOG_pip","rhsusf_acc_ACOG2","rhsusf_acc_ACOG3","rhsusf_acc_ACOG_USMC","rhsusf_acc_ACOG2_USMC","rhsusf_acc_ACOG3_USMC","rhsusf_acc_EOTECH","HLC_Optic_PSO1","HLC_Optic_1p29","hlc_optic_kobra","hlc_barrel_standard","hlc_barrel_carbine","hlc_barrel_hbar","hlc_barrel_9mm","hlc_optic_suit","hlc_optic_PVS4FAL","hlc_optic_PVS4G3","hlc_optic_PVS4M14","RH_eotech553","RH_eotech553_tan","RH_eotech553mag","RH_eotech553mag_tan","RH_eotexps3","RH_eotexps3_tan","RH_eothhs1","RH_eothhs1_tan","RH_compm4s","RH_compM2","RH_compM2_tan","RH_compM2l","RH_compM2l_tan","RH_t1","RH_t1_tan","RH_reflex","RH_barska_rds","RH_cmore","RH_LTdocter","RH_LTdocterl","RH_zpoint","RH_ta648","RH_c79","RH_c79_2d","RH_m145","RH_ta01nsn","RH_ta01nsn_2D","RH_ta01nsn_tan","RH_ta01nsn_tan_2D","RH_ta31rco","RH_ta31rco_2D","RH_ta31rco_tan","RH_ta31rco_tan_2D","RH_ta31rmr","RH_ta31rmr_2D","RH_ta31rmr_tan","RH_ta31rmr_tan_2D","RH_Delft","UK3CB_BAF_SUSAT","UK3CB_BAF_SUSAT_3D","UK3CB_BAF_TA648","UK3CB_BAF_TA648_308","UK3CB_BAF_TA31F","UK3CB_BAF_TA31F_Hornbill","UK3CB_BAF_TA31F_3D","UK3CB_BAF_TA31F_Hornbill_3D","UK3CB_BAF_Eotech","UK3CB_BAF_SpecterLDS","UK3CB_BAF_SpecterLDS_3D","UK3CB_BAF_SpecterLDS_Dot","UK3CB_BAF_SpecterLDS_Dot_3D","BWA3_optic_RSAS","BWA3_optic_Aimpoint","BWA3_optic_NSV600","BWA3_optic_NSV80","BWA3_optic_NSA80","tf47_optic_m3maaws","ACE_optic_Hamr_2D","ACE_optic_Hamr_PIP","ACE_optic_Arco_2D","ACE_optic_Arco_PIP","ACE_optic_MRCO_2D","ACE_optic_MRCO_PIP","optic_Aco"];
_glasses = ["None","G_Spectacles","G_Spectacles_Tinted","G_Combat","G_Lowprofile","G_Shades_Black","G_Shades_Green","G_Shades_Red","G_Squares","G_Squares_Tinted","G_Sport_BlackWhite","G_Sport_Blackyellow","G_Sport_Greenblack","G_Sport_Checkered","G_Sport_Red","G_Tactical_Black","G_Aviator","G_Lady_Mirror","G_Lady_Dark","G_Lady_Red","G_Lady_Blue","G_Diving","G_B_Diving","G_O_Diving","G_I_Diving","G_Goggles_VR","G_Balaclava_blk","G_Balaclava_oli","G_Balaclava_combat","G_Balaclava_lowprofile","G_Bandanna_blk","G_Bandanna_oli","G_Bandanna_khk","G_Bandanna_tan","G_Bandanna_beast","G_Bandanna_shades","G_Bandanna_sport","G_Bandanna_aviator","G_Shades_Blue","G_Sport_Blackred","G_Tactical_Clear","rhs_scarf","rhs_balaclava","rhs_googles_black","rhs_googles_clear","rhs_googles_yellow","rhs_googles_orange","BWA3_G_Combat_Orange","BWA3_G_Combat_Black","BWA3_G_Combat_Clear"];
_NVGs = ["NVGoggles","NVGoggles_OPFOR","NVGoggles_INDEP","TFAx_NVGoggles","TFAx_NVGoggles2","rhsusf_ANPVS_14","rhsusf_ANPVS_15","ACE_NVG_Gen1","ACE_NVG_Gen2","ACE_NVG_Gen4","ACE_NVG_Wide"];
{_items pushBack _x} forEach (_accessories + _shortMidRange + _glasses + _NVGs);

// Tactical backpacks and dismantled heavy statics
{_backpacks pushBack _x} forEach ["B_Parachute","B_TacticalPack_Base","B_TacticalPack_rgr","B_TacticalPack_mcamo","B_TacticalPack_ocamo","B_TacticalPack_blk","B_TacticalPack_oli","B_GMG_01_A_weapon_F","B_HMG_01_A_weapon_F","B_HMG_01_weapon_F","B_HMG_01_high_weapon_F","B_GMG_01_weapon_F","B_GMG_01_high_weapon_F","B_HMG_01_support_F","B_HMG_01_support_high_F","B_Bag_Searchlight_Cool","B_Bag_Searchlight","B_AT_01_weapon_F","ACE_TacticalLadder_Pack","B_UAV_01_backpack_F"];

{_weapons pushBack _x} forEach [
	// Assault rifles
	"arifle_MX_Black_F","hlc_rifle_auga2_t","hlc_rifle_auga3_b","BWA3_G36","RH_hk416_des","rhs_weap_m16a4","rhs_weap_m4_carryhandle",
	
	// Items considered weapons by config
	"Binocular","Rangefinder","lerca_1200_black","rhs_weap_tr8","rhs_tr8_periscope"
];

{_items pushBack _x} forEach [
	// Helmets
	"gign_helm","gign_helm3","gign_Balaclava","gign_helm4","H_Cap_police",
	
	// Uniforms
	"gign_uniform",

	// Vests
	"V_TacVest_blk_POLICE","V_Chestrig_blk","V_PlateCarrier1_blk","V_TacVestIR_blk","LOP_V_Carrier_BLK",
	
	// Items
	"ACE_elasticBandage","ACE_packingBandage","ACE_UAVBattery","ACE_HuntIR_monitor","BWA3_ItemNaviPad","MineDetector","ItemGPS","ToolKit","B_UavTerminal","O_UavTerminal","I_UavTerminal","ACE_bodyBag","ACE_fieldDressing","ACE_tourniquet","ACE_morphine","ACE_Banana","ACE_MapTools","ACE_microDAGR","ACE_IR_Strobe_Item","ACE_CableTie","ACE_ATragMX","ACE_Kestrel4500","ACE_Clacker","ACE_M26_Clacker","ACE_DefusalKit","ACE_DeadManSwitch","ACE_Cellphone","ACE_Altimeter","ACE_wirecutter",

	// Radios
	"ACRE_PRC343"
];

switch (typeOf player) do {
	case "B_Pilot_F": {
		player addItem "ACRE_PRC117F";
		{_items pushBack _x} forEach [
			"ACRE_PRC148","ACRE_PRC117F"
		];
	};
	case "B_officer_F";
	case "B_Soldier_SL_F": {
		[player,"arifle_MX_GL_Black_F",1] call BIS_fnc_addWeapon;
		player addItem "ACRE_PRC117F";
		{_weapons pushBack _x} forEach [
			"rhs_weap_M320","arifle_MX_GL_Black_F","hlc_rifle_auga3_GL","HLC_Rifle_g3ka4_GL","BWA3_G36K_AG","RH_m16a4gl_wdl","RH_m4a1_ris_m203_wdl"
		];
		{_items pushBack _x} forEach [
			"ACRE_PRC148","ACRE_PRC117F"
		];
	};
	case "B_Soldier_TL_F": {
		[player,"arifle_MX_GL_Black_F",1] call BIS_fnc_addWeapon;
		{_weapons pushBack _x} forEach [
			"rhs_weap_M320","arifle_MX_GL_Black_F","hlc_rifle_auga3_GL","HLC_Rifle_g3ka4_GL","BWA3_G36K_AG","RH_m16a4gl_wdl","RH_m4a1_ris_m203_wdl"
		];
	};
	
	case "B_soldier_M_F": {
		[player,"srifle_GM6_F",1] call BIS_fnc_addWeapon;
		{_weapons pushBack _x} forEach [
			"arifle_MXM_F","srifle_DMR_02_sniper_F","srifle_GM6_F","BWA3_G82","hlc_rifle_awcovert","srifle_EBR_F","rhs_weap_XM2010_sa","srifle_LRR_F","srifle_DMR_02_camo_F","hlc_rifle_awMagnum_OD_ghillie"
		];
		{_items pushBack _x} forEach [
			"optic_PGO7V","optic_PGO7V2","optic_PGO7V3","optic_NSPU_RPG","optic_Arco","optic_Hamr","optic_Aco","optic_ACO_grn","optic_Aco_smg","optic_ACO_grn_smg","optic_Holosight","optic_Holosight_smg","optic_SOS","optic_MRCO","optic_NVS","optic_Nightstalker","optic_tws","optic_tws_mg","optic_DMS","optic_Yorris","optic_MRD","optic_LRPS","optic_AMS_base","optic_AMS","optic_AMS_khk","optic_AMS_snd","optic_KHS_base","optic_KHS_blk","optic_KHS_hex","optic_KHS_old","optic_KHS_tan","iansky_nfbeast","iansky_specterdr","iansky_specterdr_2d","iansky_specterdr_d","iansky_specterdr_d_2D","iansky_specterdr_fde","iansky_specterdr_fde_2D","iansky_specterdr_t","iansky_specterdr_t_2D","iansky_specterdrkf","iansky_specterdrkf_2D","iansky_specterdrkf_d","iansky_specterdrkf_d_2D","iansky_specterdrkf_fde","iansky_specterdrkf_fde_2D","iansky_specterdrkf_t","iansky_specterdrkf_t_2D","iansky_cmore","iansky_cmore_g","iansky_cmore_gy","iansky_rds","iansky_rx01","iansky_rx01kf","iansky_t1","iansky_t1s","iansky_t1kf","iansky_deltapoint","rhs_acc_sniper_base","rhs_acc_1p29","rhs_acc_1p78","rhs_acc_pkas","rhs_acc_1p63","rhs_acc_ekp1","rhs_acc_ekp1b","rhs_acc_ekp1c","rhs_acc_ekp1d","rhs_acc_pso1m2","rhs_acc_npz","rhs_acc_pgo7v","rhs_acc_1pn93_base","rhs_acc_1pn93_1","rhs_acc_1pn93_2","rhsusf_acc_sniper_base","rhsusf_acc_compm4","rhsusf_acc_eotech_552","rhsusf_acc_LEUPOLDMK4","rhsusf_acc_ELCAN","rhsusf_acc_ELCAN_pip","rhsusf_acc_ACOG","rhsusf_acc_ACOG_pip","rhsusf_acc_ACOG2","rhsusf_acc_ACOG3","rhsusf_acc_ACOG_USMC","rhsusf_acc_ACOG2_USMC","rhsusf_acc_ACOG3_USMC","rhsusf_acc_LEUPOLDMK4_2","rhsusf_acc_EOTECH","HLC_Optic_PSO1","HLC_Optic_1p29","hlc_optic_kobra","hlc_optic_goshawk","hlc_barrel_standard","hlc_barrel_carbine","hlc_barrel_hbar","hlc_barrel_9mm","hlc_optic_suit","hlc_optic_PVS4FAL","HLC_Optic_ZFSG1","hlc_optic_accupoint_g3","hlc_optic_PVS4G3","hlc_optic_artel_m14","hlc_optic_PVS4M14","hlc_optic_LRT_m14","RH_eotech553","RH_eotech553_tan","RH_eotech553mag","RH_eotech553mag_tan","RH_eotexps3","RH_eotexps3_tan","RH_eothhs1","RH_eothhs1_tan","RH_compm4s","RH_compM2","RH_compM2_tan","RH_compM2l","RH_compM2l_tan","RH_t1","RH_t1_tan","RH_reflex","RH_barska_rds","RH_cmore","RH_LTdocter","RH_LTdocterl","RH_zpoint","RH_shortdot","RH_accupoint","RH_m3lr","RH_leu_mk4","RH_ta648","RH_c79","RH_c79_2d","RH_m145","RH_ta01nsn","RH_ta01nsn_2D","RH_ta01nsn_tan","RH_ta01nsn_tan_2D","RH_ta31rco","RH_ta31rco_2D","RH_ta31rco_tan","RH_ta31rco_tan_2D","RH_ta31rmr","RH_ta31rmr_2D","RH_ta31rmr_tan","RH_ta31rmr_tan_2D","RH_anpvs4","RH_anpvs10","RH_pas13cl","RH_pas13cm","RH_pas13cmg","RH_pas13ch","RH_Delft","UK3CB_BAF_SUSAT","UK3CB_BAF_SUSAT_3D","UK3CB_BAF_TA648","UK3CB_BAF_TA648_308","UK3CB_BAF_TA31F","UK3CB_BAF_TA31F_Hornbill","UK3CB_BAF_TA31F_3D","UK3CB_BAF_TA31F_Hornbill_3D","UK3CB_BAF_Eotech","UK3CB_BAF_SB31250","UK3CB_BAF_SB31250_Ghillie","UK3CB_BAF_SB31250_Desert","UK3CB_BAF_SB31250_Desert_Ghillie","UK3CB_BAF_SpecterLDS","UK3CB_BAF_SpecterLDS_3D","UK3CB_BAF_SpecterLDS_Dot","UK3CB_BAF_SpecterLDS_Dot_3D","BWA3_optic_RSAS","BWA3_optic_Aimpoint","BWA3_optic_NSV600","BWA3_optic_IRV600","BWA3_optic_NSV80","BWA3_optic_NSA80","BWA3_optic_ZO4x30","BWA3_optic_ZO4x30_NSV","BWA3_optic_ZO4x30_IRV","BWA3_optic_Shortdot","BWA3_optic_20x50","BWA3_optic_20x50_NSV","BWA3_optic_24x72","BWA3_optic_24x72_NSV","tf47_optic_m3maaws","ACE_optic_Hamr_2D","ACE_optic_Hamr_PIP","ACE_optic_Arco_2D","ACE_optic_Arco_PIP","ACE_optic_MRCO_2D","ACE_optic_MRCO_PIP","ACE_optic_SOS_2D","ACE_optic_SOS_PIP","ACE_optic_LRPS_2D","ACE_optic_LRPS_PIP"
		];
	};
	
	case "B_soldier_AR_F": {
		[player,"LMG_Mk200_F",1] call BIS_fnc_addWeapon;
		{_weapons pushBack _x} forEach [
			"hlc_lmg_M60E4","hlc_lmg_m60","LMG_Zafir_F","MMG_01_hex_F","BWA3_MG5","BWA3_MG4","hlc_lmg_M249E2","rhs_weap_m249_pip_L","hlc_m249_SQuantoon","LMG_Mk200_F"
		];
	};
	
	case "B_medic_F": {
		[player,"arifle_MX_Black_F",1] call BIS_fnc_addWeapon;
		{_items pushBack _x} forEach [
			"ACE_plasmaIV","ACE_plasmaIV_250","ACE_plasmaIV_500","ACE_salineIV","ACE_salineIV_250","ACE_salineIV_500","ACE_bloodIV","ACE_bloodIV_250","ACE_bloodIV_500","ACE_surgicalKit","ACE_fieldDressing","ACE_packingBandage","ACE_elasticBandage","ACE_tourniquet","ACE_atropine","ACE_morphine","ACE_epinephrine"
		];
		{_backpacks pushBack _x} forEach [
			"B_Carryall_cbr","B_Carryall_ocamo","B_Carryall_khk","B_Carryall_mcamo","B_Carryall_oli","B_Carryall_oucamo"
		];
		player addItemToBackpack "ACE_surgicalKit";
		for "_i" from 1 to 20 do {
			player addItemToBackpack "ACE_fieldDressing";
			player addItemToBackpack "ACE_packingBandage";
			player addItemToBackpack "ACE_elasticBandage";
		};
		for "_i" from 1 to 15 do {
			player addItemToBackpack "ACE_morphine";
			player addItemToBackpack "ACE_epinephrine";
			player addItemToBackpack "ACE_atropine";
			player addItemToBackpack "ACE_Banana";
		};
		for "_i" from 1 to 10 do {
			player addItemToBackpack "ACE_tourniquet";
		};
		for "_i" from 1 to 5 do {
			player addItemToBackpack "ACE_salineIV";
		};
	};
	
	case "B_soldier_LAT_F": {
		[player,"arifle_MX_Black_F",1] call BIS_fnc_addWeapon;
		[player,"tf47_m3maaws",1] call BIS_fnc_addWeapon;
		player addSecondaryWeaponItem "tf47_optic_m3maaws";
		{_weapons pushBack _x} forEach [
			"launch_B_Titan_F","launch_B_Titan_short_F","rhs_weap_rshg2","rhs_acc_1pn93_2","launch_RPG7V","launch_RPG32_F","rhs_weap_rpg26","BWA3_RGW90","launch_NLAW_F","BWA3_Pzf3","tf47_m3maaws","BWA3_Fliegerfaust","rhs_weap_fim92","rhs_weap_fgm148","rhs_weap_igla"
		];
		{_backpacks pushBack _x} forEach [
			"B_Carryall_cbr","B_Carryall_ocamo","B_Carryall_khk","B_Carryall_mcamo","B_Carryall_oli","B_Carryall_oucamo"
		];
	};
	
	case "B_soldier_repair_F": {
		[player,"arifle_MX_Black_F",1] call BIS_fnc_addWeapon;
		player addItem "Toolkit";
	};
	
	default {
		[player,"arifle_MX_Black_F",1] call BIS_fnc_addWeapon;
	};
};

[player,"hgun_Pistol_heavy_01_F",1] call BIS_fnc_addWeapon;

[missionNamespace,_weapons,false,false] call custom_fnc_addVirtualWeaponCargo;
[missionNamespace,_magazines,false,false] call custom_fnc_addVirtualMagazineCargo;
[missionNamespace,_items,false,false] call custom_fnc_addVirtualItemCargo;
[missionNamespace,_backpacks,false,false] call custom_fnc_addVirtualBackpackCargo;

["Open",false] spawn custom_fnc_arsenal;

/*
// Parse all magazines and weapon accessories
private ["_magazines","_accessories"];

// Magazines
_magazines = [];
_cfg = (configfile >> "CfgMagazines");
for "_i" from 0 to (count _cfg) - 1 do {_magazines pushBack configName (_cfg select _i)};
copyToClipboard str(_magazines);

// Accessories
private "_accessories";
_accessories = [];
_cfg = (configfile >> "CfgWeapons");
for "_i" from 0 to (count _cfg) - 1 do {
	_entry = configName(_cfg select _i);
	if ({(_entry call bis_fnc_itemType) select 1 == _x} count ["AccessoryMuzzle","AccessoryPointer","AccessoryBipod","AccessorySights"] > 0) then {
		_accessories pushBack _entry;
	};
};
copyToClipboard str(_accessories);

hint "done";
*/
