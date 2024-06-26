remove_carcass_fnc = {
	// Deletes dead bodies and destroyed vehicles. Code by BIS
	params ['_unit'];
	sleep 2;
	if !(_unit isKindOf "Man") then {
		{_x setPos position _unit} forEach crew _unit;
		sleep 900;
		deleteVehicle _unit;
	};
	if (_unit isKindOf "Man") then {
		if !((vehicle _unit) isKindOf "Man") then {_unit setPos (position vehicle _unit)};
		sleep 900;
		_unit removeAllEventHandlers "killed";
		hideBody _unit;
	};
};
BTC_m_fnc_only_server = {
	params ["_type","_array"];
	if (_type isEqualTo 0) then	{
		private _veh = _array # 1;
		_veh spawn BTC_server_repair_wreck;
	}
	else
	{};
};
BTC_AIunit_init = {
	// sets skill of a unit if ASR AI is not detected
	params ["_unit"];
	if (isClass(configFile >> "cfgPatches" >> "asr_ai_main")) exitWith {};
		_unit setSkill ["aimingAccuracy",(0.2 + (random 0.3))];//la précision de viser 
		_unit setSkill ["aimingShake",(0.20 + (random 0.1)) ];// Affecte la régularité avec laquelle l'IA peut tenir une arme  
		_unit setSkill ["spotDistance",(0.50 + (random 0.2))];  
		_unit setSkill ["spotTime",0.8];// Affecte la rapidité avec laquelle l'IA réagit à la mort, aux dégâts ou à l'observation d'un ennemi 
		_unit setSkill ["courage",1.0];   
		_unit setSkill ["aimingSpeed",(0.5 + (random 0.3))];// Affecte la rapidité avec laquelle l'IA peut tourner et stabiliser sa visée
	if (_unit isEqualTo (leader group _x)) then	{
		_unit setSkill ["commanding", 1];
	};
	_unit setSkill ["general", 1];
};
BTC_AI_init = {
	// sets skill of a group if ASR AI is not detected
	params ["_group"];
	if (isClass(configFile >> "cfgPatches" >> "asr_ai_main")) exitWith {};
	{
		_x setSkill ["aimingAccuracy",(0.2 + (random 0.3))];  
		_x setSkill ["aimingShake",(0.20 + (random 0.1)) ];  
		_x setSkill ["spotDistance",(0.50 + (random 0.2))];  
		_x setSkill ["spotTime",0.8];  
		_x setSkill ["courage",1.0];   
		_x setSkill ["aimingSpeed",(0.5 + (random 0.3))]; 
		if (leader _group isEqualTo _x) then {
			_x setSkill ["commanding", 1];
		};
		_x setSkill ["general", 1];
	} forEach units _group;
};
/*
Helmet_weapon_drop = {
	// drop helmet and weapon AI on a shoot
	this addEventHandler ["handledamage", {    params ["_group","_part","_dam","_shooter"];
	{ 
    if (!alive _group) exitWith {_group removeEventHandler ["handleDamage", _thisEventHandler]};
    if (_group getVariable ["parts_handle", false]) exitWith {false};
    private _parts= ["arms", "hands", "head"];
    if (_part in _parts) then {
        private _holder = createVehicle ["WeaponHolderSimulated",ASLtoATL eyePos _group, [], 0, "CAN_COLLIDE"];
        if !(_part == "head" && _dam > 0.4 && currentWeapon _group != "" && local _group) then {
            _holder addItemCargoGlobal [currentWeapon _group,1];
            _group removeWeapon (currentWeapon _group);
        };
        if (_part == "head" && _dam > 0.4 && headgear _group != "" && local _group) then {
            _holder addItemCargoGlobal [headgear _group,1];
            {
                _group unlinkItem _x;
            }forEach [goggles _group, hmd _group, headgear _group];
        };
        _holder setVelocity [5 * sin (_shooter getdir _group), 5 * cos (_shooter getDir _group), 0.3];
        _holder addTorque [random 0.02, random 0.02, random 0.02];
      };
    _group setVariable ["parts_handle", true];
    _group spawn {sleep 1; _this setVariable ["parts_handle", false]};
	} forEach units _group;
	}];
};
/*
/*
Helmet_weapon_drop = {
	// drop helmet and weapon AI on a shoot
	this addEventHandler ["handledamage", {    params ["_unit","_part","_dam","_shooter"];
    if (!alive _unit) exitWith {_unit removeEventHandler ["handleDamage", _thisEventHandler]};
    if (_unit getVariable ["parts_handle", false]) exitWith {false};
    private _parts= ["arms", "hands", "head"];
    if (_part in _parts) then {
        private _holder = createVehicle ["WeaponHolderSimulated",ASLtoATL eyePos _unit, [], 0, "CAN_COLLIDE"];
        if !(_part == "head" && _dam > 0.4 && currentWeapon _unit != "" && local _unit) then {
            _holder addItemCargoGlobal [currentWeapon _unit,1];
            _unit removeWeapon (currentWeapon _unit);
        };
        if (_part == "head" && _dam > 0.4 && headgear _unit != "" && local _unit) then {
            _holder addItemCargoGlobal [headgear _unit,1];
            {
                _unit unlinkItem _x;
            }forEach [goggles _unit, hmd _unit, headgear _unit];
        };
        _holder setVelocity [5 * sin (_shooter getdir _unit), 5 * cos (_shooter getDir _unit), 0.3];
        _holder addTorque [random 0.02, random 0.02, random 0.02];
      };
    _unit setVariable ["parts_handle", true];
    _unit spawn {sleep 1; _this setVariable ["parts_handle", false]};
	}];
};
*/
/*
paint_heli_fnc = {
	//Paints blufor helis (typically Mowhawk and Hellcat) a different color matching terrain as to not mistake them for Opfor/Indie helis by Jigsor.
	params ["_veh"];
	private _colorSelection = missionNamespace getVariable ["BMR_paintSchemeB1", 0];
	if (_colorSelection isEqualType 0) exitWith {
		private _darkGrey = [
			[0,"#(argb,8,8,3)color(0.518,0.519,0.455,0.2)"],
			[1,"#(argb,8,8,3)color(0.518,0.519,0.455,0.2)"],
			[2,"#(argb,8,8,3)color(0.518,0.519,0.455,0.2)"]
		];
		private _sandColor = [
			[0,"#(argb,8,8,3)color(0.96,0.88,0.69,0.35)"],
			[1,"#(argb,8,8,3)color(0.96,0.88,0.69,0.35)"],
			[2,"#(argb,8,8,3)color(0.96,0.88,0.69,0.35)"]
		];
		private _green1 = [
			[0,"#(argb,8,8,3)color(0.550,0.620,0.4,0.1)"],
			[1,"#(argb,8,8,3)color(0.550,0.620,0.4,0.1)"],
			[2,"#(argb,8,8,3)color(0.550,0.620,0.4,0.1)"]
		];
		private _green2 = [
			[0,"#(argb,8,8,3)color(0.56,0.62,0.4,0.07)"],
			[1,"#(argb,8,8,3)color(0.56,0.62,0.4,0.07)"],
			[2,"#(argb,8,8,3)color(0.56,0.62,0.4,0.07)"]
		];
		private "_color";
		switch (true) do {
			case (toLowerANSI (worldName) isEqualTo "altis"): {_color = _darkGrey};
			case (toLowerANSI (worldName) isEqualTo "tanoa"): {_color = _green2};
			case (toLowerANSI (worldName) isEqualTo "malden"): {_color = _darkGrey};
			case (toLowerANSI (worldName) isEqualTo "enoch"): {_color = _green1};
			case (toLowerANSI (worldName) isEqualTo "stratis"): {_color = _darkGrey};
			case (toLowerANSI (worldName) isEqualTo "takistan"): {_color = _sandColor};
			case (toLowerANSI (worldName) isEqualTo "fallujah"): {_color = _sandColor};
			case (toLowerANSI (worldName) isEqualTo "lingor3"): {_color = _green1};
			case (toLowerANSI (worldName) isEqualTo "dingor"): {_color = _sandColor};
			case (toLowerANSI (worldName) isEqualTo "pja305"): {_color = _green1};
			case (toLowerANSI (worldName) isEqualTo "sara"): {_color = _darkGrey};
			case (toLowerANSI (worldName) isEqualTo "zargabad"): {_color = _sandColor};
			case (toLowerANSI (worldName) isEqualTo "kunduz"): {_color = _sandColor};
			case (toLowerANSI (worldName) isEqualTo "pja310"): {_color = _sandColor};
			case (toLowerANSI (worldName) isEqualTo "xcam_taunus"): {_color = _green1};
			case (toLowerANSI (worldName) isEqualTo "mog"): {_color = _sandColor};
			case (toLowerANSI (worldName) isEqualTo "dya"): {_color = _sandColor};
			case (toLowerANSI (worldName) isEqualTo "fata"): {_color = _sandColor};
			case (toLowerANSI (worldName) isEqualTo "bornholm"): {_color = _green1};
			case (toLowerANSI (worldName) isEqualTo "clafghan"): {_color = _sandColor};
			case ((toLowerANSI (worldName) isEqualTo "napfwinter") || (toLowerANSI (worldName) isEqualTo "napf")): {_color = _darkGrey};
			case (toLowerANSI (worldName) isEqualTo "kapaulio"): {_color = _green1};
			case (toLowerANSI (worldName) isEqualTo "lythium"): {_color = _sandColor};
			case (toLowerANSI (worldName) isEqualTo "tem_anizay"): {_color = _darkGrey};
			case (toLowerANSI (worldName) isEqualTo "pja312"): {_color = _green2};
			case (toLowerANSI (worldName) isEqualTo "wl_rosche"): {_color = _green1};
			default {_color = []};
		};
		if (_color isEqualTo []) exitWith {missionNamespace setVariable ["BMR_paintSchemeB1", []]};
		{_veh setObjectTextureGlobal _x;} forEach _color;
		missionNamespace setVariable ["BMR_paintSchemeB1", _color];
	};
	if !(_colorSelection isEqualTo []) then {{_veh setObjectTextureGlobal _x;} forEach _colorSelection};
};
*/
add_UAV_crew = {
	// add crew to UAV/UGV.
	params ["_veh"];
	createVehicleCrew _veh;
};
/*
add_veh_flare = {
	// add flares
	params ["_veh"];
	_veh addweapon "CMFlareLauncher";
	_veh addmagazine "120Rnd_CMFlare_Chaff_Magazine";
};
/*
remove_veh_ti = {
	// remove vehicle thermal imaging
	params ["_veh"];
	_veh disableTIEquipment true;
};
*/
INS_fold_wings = {
	params ["_veh"];
	_veh animate ["wing_fold_l", 1, true]; _veh animate ["wing_fold_r", 1, true];
};
INS_replace_pylons = {
	params ["_veh","_pylons"];
	private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _veh >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
	private _nonPylonWeapons = [];
	{ _nonPylonWeapons append getArray (_x >> "weapons") } forEach ([_veh, configNull] call BIS_fnc_getTurrets);
	{ _veh removeWeaponGlobal _x } forEach ((weapons _veh) - _nonPylonWeapons);
	{ _veh setPylonLoadOut [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex] } forEach _pylons;
};
INS_noBTC_Logistics = {
	params ["_obj"];
	_obj setVariable ["BTC_cannot_lift",1,true];
	_obj setVariable ["BTC_cannot_drag",1,true];
	_obj setVariable ["BTC_cannot_load",1,true];
	_obj setVariable ["BTC_cannot_place",1,true];
};
/*
INS_unilimitedAmmo = {
	params ["_wep"];
	_wep addeventhandler ["fired", {(_this # 0) setvehicleammo 1}];
};
*/
fnc_ghst_build_positions = {
	/*
	Original code by Ghost. Modified by Jigsor to exclude exit positions, buildings listed in StructureBlackList and buildings with "_Pier" in classname.
	//building positions function for one building
	//_build_positions = _building call fnc_ghst_find_positions;
	*/
	private _i = 0;
	private _b = [];
	private _build_positions = [];
	private _pIsEmpty = false;
	private _type = typeof _this;
	private ["_e","_p"];

	while { ! _pIsEmpty } do {

		_e = _this buildingExit _i;
		_p = _this buildingPos _i;

		if (( str _p != "[0,0,0]" ) && {!(_type in StructureBlackList)} && {!(_type find "_Pier" != -1)} && {!(_e isEqualTo _p)}) then {
			_b pushback _p;
		}else{
			_pIsEmpty = true;
		};
		_i = _i + 1;
	};
	if (!(isNil "_b") and {!(_b isEqualTo [])}) then {
		_build_positions = _build_positions + _b;
	};

	_build_positions
};
fnc_ghst_rand_position = {
	/*
	//Find Random Position in a rectangle radius
	//_pos = [[1,1,2],[300,500,60]] call fnc_ghst_rand_position;
	//_pos = ["marker",[]] call fnc_ghst_rand_position;
	*/
	private ["_dir","_position_mark","_radx","_rady","_pos","_xpos","_ypos"];

	_pos_mark = _this # 0;//position or marker
	_radarray = _this # 1;//array of x,y radius and direction
	_wateronly = if (count _this > 2) then {_this # 2;} else {false;};//get position in water only

	if (_pos_mark isEqualType []) then {
		_position_mark = _pos_mark;//position array
		_radx = _radarray # 0;//radius A if position is Not a marker
		_rady = _radarray # 1;//radius B if position is Not a marker
		_dir = _radarray # 2;
		if (isNil "_dir") then {
			_dir = (random 360) * -1;//random direction if not given
		}else{
			_dir = (_radarray select 2) * -1;//specified direction
		};
	}else{
		_position_mark = (markerPos _pos_mark);//getmarker position
		_radx = (getMarkerSize _pos_mark) # 0;//radius A if position is a marker
		_rady = (getMarkerSize _pos_mark) # 1;//radius b if position is a marker
		_dir = (markerDir _pos_mark) * -1;//Marker Direction
	};
	private _loop = true;
	while {_loop} do {
		_rx = (random (_radx * 2)) - _radx;
		_ry = (random (_rady * 2)) - _rady;
		if (_dir != 0) then {
			_xpos = (abs(_position_mark select 0)) + ((cos _dir) * _rx - (sin _dir) * _ry);
			_ypos = (abs(_position_mark select 1)) + ((sin _dir) * _rx + (cos _dir) * _ry);
		}else{
			_xpos = (abs(_position_mark select 0)) + _rx;
			_ypos = (abs(_position_mark select 1)) + _ry;
		};
		_pos = [_xpos,_ypos,0];
		if (!_wateronly and !(surfaceIsWater [_pos # 0,_pos # 1])) then {_loop = false};
		if (_wateronly and (surfaceIsWater [_pos # 0,_pos # 1])) then {_loop = false};
	};
	_pos
};
JIG_issue_reward = {
	params ["_p"];
	if (side _p == INS_Blu_side) then {
		_pScore = 20;
		_p addrating 2000;
		_p addScore _pScore;
		[West,"HQ"] sideChat "+20 points";
		rewardp = getPlayerUID _p;
		publicVariable "rewardp";
		_destroyerName = if (alive _p) then {name _p} else {format["[%1]", getText(configFile>>"CfgVehicles">>typeOf _p>>"DisplayName")]};
		_text = format [localize "STR_BMR_who_destroyed_ammocache",_destroyerName];
		[_text] remoteExec ["JIG_MPsideChatWest_fnc", [0,-2] select isDedicated];
	}else{
		_pScore = -10;
		_p addScore _pScore;
		[East,"HQ"] sideChat "-10 points";
		_penalty = -1500;
		_tally = (rating _p) + _penalty;
		_p addRating _tally;
	};
};
JIG_ammmoCache_damage = {
	// Restrict damage to be taken only when satchel or charge used, delete cache box, add score to explosive setter, side chat who destroyed cache, add vehicle reward to cache destroyer. by Jigsor
    _cache = _this # 0;
    _damage = _this # 2;
    _source = _this # 3;
    _ammo = _this # 4;
    _out = 0;

    if ((_ammo == "satchelCharge_remote_ammo") ||
	(_ammo == "Bo_Air_LGB") ||
	(_ammo == "Bomb_03_F") ||
	(_ammo == "Bomb_04_F") ||
	(_ammo == "ace_m47_magazine") ||
	(_ammo == "ace_dragon_penetrator_super") ||
	(_ammo == "ace_dragon_super") ||
	(_ammo == "ace_rearm_Rocket_03_AP_F") ||
	(_ammo == "Missile_AGM_01_F") ||
	(_ammo == "Missile_AGM_02_F") ||
	(_ammo == "M_Jian_AT") ||
	(_ammo == "Bo_Leaflets") ||
	(_ammo == "BombDemine_01_Ammo_F") ||
	(_ammo == "ammo_Bomb_SDB") ||	
	(_ammo == "Bo_Air_LGB_hidden") ||
	(_ammo == "Bo_GBU12_LGB") ||
	(_ammo == "Bo_GBU12_LGB_MI10") ||
	(_ammo == "Cannon_30mm_HE_Plane_CAS_02_F") ||
	(_ammo == "M_120mm_cannon_ATGM_LG") ||
	(_ammo == "M_120mm_cannon_ATGM") ||
	(_ammo == "M_125mm_cannon_ATGM") ||
	(_ammo == "M_Scalpel_AT") ||
	(_ammo == "M_Scalpel_AT_hidden") ||
	(_ammo == "M_Titan_AT") ||
	(_ammo == "M_Titan_AT_long") ||
	(_ammo == "M_Titan_AT_static") ||
	(_ammo == "M_Vorona_HEAT") ||
	(_ammo == "Gatling_30mm_HE_Plane_CAS_01_F") ||
	(_ammo == "demoCharge_remote_ammo") ||
	(_ammo == "satchelCharge_remote_ammo_scripted") ||
	(_ammo == "demoCharge_remote_ammo_scripted") ||
	(_ammo == "CUP_PipeBomb_Ammo") ||
	(_ammo == "LIB_Ladung_Small_ammo") ||
	(_ammo == "LIB_Ladung_Big_ammo") ||
	(_ammo == "LIB_US_TNT_4pound_ammo") ||
	(_ammo == "PylonRack_3Rnd_LG_scalpel") ||
	(_ammo == "ace_hot_HOT3") ||
	(_ammo == "ACE_Hellfire_AGM114L") ||
	(_ammo == "ace_maverick_L") ||
	(_ammo == "Bo_Leaflets") ||
	(_ammo == "ace_kh25ml") ||
	(_ammo == "BombCluster_01_Ammo_F") ||
	(_ammo == "BombCluster_02_cap_Ammo_F") ||
	(_ammo == "BombCluster_02_Ammo_F") ||
	(_ammo == "BombCluster_03_Ammo_F") ||
	(_ammo == "Bo_Mk82") ||
	(_ammo == "ammo_SCALP_F") ||
	(_ammo == "M_AT") ||
	(_ammo == "M_PG_AT") ||
	(_ammo == "R_80mm_HE") ||
	(_ammo == "Rocket_03_AP_F") ||
	(_ammo == "Rocket_03_HE_F") ||
	(_ammo == "Rocket_04_AP_F") ||
	(_ammo == "Rocket_04_HE_F") ||
	(_ammo == "R_PG7_F") ||
	(_ammo == "M_SPG9_HE") ||
	(_ammo == "M_SPG9_HEAT") ||
	(_ammo == "Bomb_AASM_F") ||
	(_ammo == "C7_Remote_Ammo")) then {
        _cache spawn {
            sleep 0.1;
            _this setDamage 1;
            sleep 1;

			private ["_pos","_dur","_count","_veh","_bObj"];
			_pos = getPosATL(_this);
			_bObj = nearestBuilding _pos;
			_bObj allowDamage true;

			//Block from Insurgency by Fireball, Kol9yN
			curTime	= time;
			_dur = 5 + random 5;
			deleteVehicle _this;
			"Bo_Air_LGB" createVehicle _pos;
			while{ (time - curTime) < _dur } do {
			_veh = "Bo_Air_LGB" createVehicle _pos;
			_veh setVectorDirAndUp [[(((random 1) -0.5) max 0.2),(((random 1) -0.5) max 0.2),(((random 1) -0.5) min 0.8)],[0,(random -1.5),(random 1) -0.5]];//Jig adding
			sleep random 1;
			};
			"Bo_Air_LGB" createVehicle _pos;
        };
		if (!isNull _source && {isPlayer _source}) then {
			[_source] spawn JIG_issue_reward;
		}else{
			//Reward compatibility fix for ACE explosives
			private _rpos = getPosATL _cache;
			[_rpos] spawn {
				params ["_pos"];
				private _uArr = [];
				{_uArr pushBack _x} forEach (_pos nearEntities ["CAManBase",200] select {((captiveNum _x isEqualTo 0) || (lifeState _x isEqualTo "HEALTHY") || (lifeState _x isEqualTo "INJURED")) && ((side _x isEqualTo west) && (isPlayer _x))});
				if !(_uArr isEqualTo []) then {
					private _source = _uArr # 0;
					[_source] call JIG_issue_reward;
					private _text = format ["%1-%2", localize "STR_BMR_veh_awarded", name _source];
					_txt remoteExec ['JIG_MPhint_fnc', [0,-2] select isDedicated];
				};
			};
		};
	};
    _out
};
JIG_tower_damage = {
	// Restrict damage to be taken only when satchel or charge used, delete undamaged tower model, add score to explosive setter, side chat who destroyed tower. by Jigsor
    _tower = _this # 0;
    _damage = _this # 2;
    _source = _this # 3;
    _ammo = _this # 4;
    _out = 0;

     if ((_ammo == "satchelCharge_remote_ammo") || (_ammo == "Bo_Air_LGB") || (_ammo == "Bomb_03_F") || (_ammo == "Bomb_04_F") || (_ammo == "ace_m47_magazine") || (_ammo == "ace_dragon_penetrator_super") || (_ammo == "ace_dragon_super") || (_ammo == "ace_rearm_Rocket_03_AP_F") || (_ammo == "Missile_AGM_01_F") || (_ammo == "Missile_AGM_02_F") || (_ammo == "M_Jian_AT") || (_ammo == "Bo_Leaflets") || (_ammo == "BombDemine_01_Ammo_F") || (_ammo == "ammo_Bomb_SDB") ||	 (_ammo == "Bo_Air_LGB_hidden") || (_ammo == "Bo_GBU12_LGB") || (_ammo == "Bo_GBU12_LGB_MI10") || (_ammo == "Cannon_30mm_HE_Plane_CAS_02_F") || (_ammo == "M_120mm_cannon_ATGM_LG") || (_ammo == "M_120mm_cannon_ATGM") || (_ammo == "M_125mm_cannon_ATGM") || (_ammo == "M_Scalpel_AT") || (_ammo == "M_Scalpel_AT_hidden") || (_ammo == "M_Titan_AT") || (_ammo == "M_Titan_AT_long") || (_ammo == "M_Titan_AT_static") || (_ammo == "M_Vorona_HEAT") || (_ammo == "Gatling_30mm_HE_Plane_CAS_01_F") || (_ammo == "demoCharge_remote_ammo") || (_ammo == "satchelCharge_remote_ammo_scripted") || (_ammo == "demoCharge_remote_ammo_scripted") || (_ammo == "CUP_PipeBomb_Ammo") || (_ammo == "LIB_Ladung_Small_ammo") || (_ammo == "LIB_Ladung_Big_ammo") || (_ammo == "LIB_US_TNT_4pound_ammo") || (_ammo == "PylonRack_3Rnd_LG_scalpel") || (_ammo == "ace_hot_HOT3") || (_ammo == "ACE_Hellfire_AGM114L") || (_ammo == "ace_maverick_L") || (_ammo == "Bo_Leaflets") || (_ammo == "ace_kh25ml") || (_ammo == "BombCluster_01_Ammo_F") || (_ammo == "BombCluster_02_cap_Ammo_F") || (_ammo == "BombCluster_02_Ammo_F") || (_ammo == "BombCluster_03_Ammo_F") || (_ammo == "Bo_Mk82") || (_ammo == "ammo_SCALP_F") || (_ammo == "M_AT") || (_ammo == "M_PG_AT") || (_ammo == "R_80mm_HE") || (_ammo == "Rocket_03_AP_F") || (_ammo == "Rocket_03_HE_F") || (_ammo == "Rocket_04_AP_F") || (_ammo == "Rocket_04_HE_F") || (_ammo == "R_PG7_F") || (_ammo == "M_SPG9_HE") || (_ammo == "M_SPG9_HEAT") || (_ammo == "Bomb_AASM_F") || (_ammo == "C7_Remote_Ammo")) then {
        _tower spawn {
            sleep 0.1;
            _this setDamage 1;
            sleep 3;
            deleteVehicle _this;
        };
		if (!isNull _source && {alive _source}) then {
			_destroyerName = name _source;
			_text = format [localize "STR_BMR_who_destroyed_tower",_destroyerName];
			[_text] remoteExec ["JIG_MPsideChatWest_fnc", [0,-2] select isDedicated];
		};
    };
    _out
};
miss_object_pos_fnc = {
	// Objective position. by Jigsor
	params ["_cooX","_cooY"];

	private _dis = 150;
	private _wheX = random (_dis*2)-_dis;
	private _wheY = random (_dis*2)-_dis;
	private _ObjRandomPos = [_cooX+_wheX,_cooY+_wheY,0];
	private _newPos = _ObjRandomPos isFlatEmpty [25,384,0.4,2,0,false,ObjNull];

	while {(count _newPos) < 1} do {
		_newPos = _ObjRandomPos isFlatEmpty [20,384,0.6,2,0,false,ObjNull];
		_dis = _dis + 50;
		_wheX = random (_dis*2)-_dis;
		_wheY = random (_dis*2)-_dis;
		_ObjRandomPos = [_cooX+_wheX,_cooY+_wheY,0];
		if (_dis > 499) then {
			private _trees = nearestTerrainObjects [_ObjRandomPos, ["TREE","SMALL TREE","BUSH"], 15, false];
			if !(_trees isEqualTo []) then {
				for "_i" from 0 to (count _trees - 1) step 1 do {
					private _tree = _trees # 0;
					if !(isObjectHidden _tree) then {hideobjectGlobal _tree} else {_tree hideObjectGlobal false};
					_trees deleteAt 0;
				};
			};
		};
		if (_dis > 550) exitWith {_newPos = []};
		sleep 0.5;
	};

	if (!(_newPos isEqualTo [])) then {
		if !(getMarkerType "tempObjMkr" isEqualTo "") then {deleteMarkerLocal "tempObjMkr"};
		private _mkrType = ["EMPTY", "mil_dot"] select (DebugEnabled isEqualTo 1);
		private _mkr = createMarkerLocal ["tempObjMkr", _newPos];
		_mkr setMarkerShapeLocal "ELLIPSE";
		"tempObjMkr" setMarkerSizeLocal [1, 1];
		"tempObjMkr" setMarkerShapeLocal "ICON";
		"tempObjMkr" setMarkerTypeLocal _mkrType;
	};
	_newPos
};
opfor_NVG = {
	// Add NVG to all existing enemy AI units by Jigsor.
	private _ai = allUnits;
	{if (isPlayer _x) then {_ai =_ai - [_x];};} count _ai;
	{
		if (side _x isEqualTo resistance) then {
			_x unlinkItem "NVGoggles_INDEP";
			//_x linkItem "NVGoggles_INDEP";
		}else{
			if (side _x isEqualTo east) then {
				_x unlinkItem "NVGoggles_OPFOR";
				_x linkItem "NVGoggles_OPFOR";
			};
		};
		_x addPrimaryWeaponItem "acc_flashlight";
		_x enableGunLights "forceOn";//"AUTO"
	} forEach _ai;
};
editorAI_GasMask = {
	// Add Gas Masks to all existing AI units by Jigsor.
	private _ai = [];
	{_ai pushBack _x} forEach (allUnits select {(!isPlayer _x) && (_x isKindOf "Man")});
	{
		removeGoggles _x;
		if (side _x isEqualTo resistance) then {_x addGoggles "G_AirPurifyingRespirator_02_olive_F";};
		if (side _x isEqualTo east) then {_x addGoggles "G_AirPurifyingRespirator_02_black_F";};
		If (side _x isEqualTo west) then {_x addGoggles "G_AirPurifyingRespirator_01_F";};
	} count _ai;
};
JIPmkr_updateClient_fnc = {
	// Local client maker states update. by Jigsor
	_coloredMarkers=server getVariable "IntelMarkers";
	if (isNil {server getVariable "IntelMarkers"}) exitWith {};
	{
		_x setMarkerType (getMarkerType _x);
		_x setMarkercolor (getMarkercolor _x);
		_x setMarkerAlpha (MarkerAlpha _x);
	} forEach _coloredMarkers;
	true
};
find_bombee_fnc = {
	// Find suicide bomber player target. by Jigsor
	private _btarget = ObjNull;
	// exclude east players, players in moving vehicles, exclude above ground players such as players in aircraft or in high structures
	private _potentialTargets = playableUnits select {(vectorMagnitudeSqr velocity _x < 9) && ((getPosATL _x) select 2 < 3.1) && (side _x isEqualTo west)};
	if !(_potentialTargets isEqualTo []) then	{
		_btarget = selectRandom _potentialTargets;
	};
	_btarget
};
find_civ_bomber_fnc = {
	// Look for a suitable draftee by SupahG33K. Slightly modified by Jigsor.
	private ["_foundCiv","_civs","_closestEntity","_draftee"];
	_draftee = ObjNull;
	if (isNull random_w_player4) exitWith {_draftee};
	_foundCiv = false;
	_civs = (position random_w_player4) nearEntities ["CAManBase",300];
	if (count _civs != 0) then {_civs deleteAt 0};

	//Filter _civs array for CIVILIANS, take the closest one found
	{
		if (count _civs != 0) then {
			_closestEntity = _civs # 0;
			if ((side _closestEntity isEqualTo CIVILIAN) && {!isPlayer _closestEntity} && {!captive _closestEntity}) then {
				_draftee = _closestEntity;
				_foundCiv = true;
				//diag_log text format ["SupahG33K - Civilian Jihadi Draftee found object: %1 class: %2", _draftee, typeOf _draftee];
			}else{
				_civs deleteAt 0;
			};
		};
		if(_foundCiv) exitWith{_foundCiv};
	} forEach _civs;
	_draftee
};
killed_ss_bmbr_fnc = {
	// Add suicide bomber evidence and chance of deadMan switch by SupahG33K
	// Add point/rating back to killer of civilian bomber. by Jigsor
	params ["_bmbr","_killer"];
	_pRating = rating _killer;// Jig adding low rating deterrent for killing innocent civilians.

	if (!isNull _killer) then {// no deadman switch if bomb detonates
		//SupahG33K - random deadMan-switch detonation. Small explosion when bomber killed (not full power)
		if((floor random 100 < 33) || (_pRating < 10000)) then {
			_bmbr spawn {
				_miniexplosive = selectRandom suicide_bmbr_deadman;
				_explosive = _miniexplosive createVehicle (position _this);
				sleep jig_tvt_globalsleep;
				_explosive setDamage 1;
			};
		};
	};

	//SupahG33K - Add small grenade to body for identification purposes
	//_miniExplosiveEvidence = selectRandom suicide_bmbr_miniweps;
	//_bmbr addItemToUniform _miniExplosiveEvidence;
	//_bmbr addMagazines [_miniExplosiveEvidence,1];

	_pScore = 1;
	_killer addrating 1000;
	_killer addScore _pScore;
	paddscore = [_killer, _pscore]; publicVariableServer "paddscore";
	true
};
bmbrBuildPos = {
	params ["_posX","_posY","_debug"];
	private ["_found","_c","_repeat","_n","_build","_houses","_l","_r","_position"];
	_found = false;
	_c = 1;
	while {!_found && _c < 20} do {
		_houses = [_posX, _posY] nearObjects ["HouseBase", 150];
		//if (_debug) then {diag_log text format["Bomber building position placement %1 : %2", _c, _houses];};
		if (!isNil "_houses" && {!(_houses isEqualTo [])}) then {
			_n = count _houses;
			_i = floor(random _n);
			_build = (_houses select _i);
			_houses deleteAt _i;
			_l = _build call fnc_ghst_build_positions;
			_r = floor(random count _l);
			_position = _l # _r;
			_l deleteAt _r;
			if (!isnil "_position") exitwith {
				if (_debug) then {diag_log text format["Bomber Spawning building position : %1", _position];};
				_found = true;
			};
		};
		_c = _c + 1;
	};
	if ((!_found) || {[_posX, _posY] distance2D _position < 20}) then {
		//if (_debug) then {diag_log "FAILED TO PLACE Bomber in Building";};
		_position = [0,0,0];
	};
	_position
};
bmbr_spawnpos_fnc = {
	// Suicide bomber random position. by Jigsor
	params ["_cooX","_cooY"];
	private ["_disX","_disY","_wheX","_wheY","_startPos","_empty","_goodPos","_c","_newPos","_mkr"];

	_disX = [130,240] call BIS_fnc_randomInt;
	_disY = [130,240] call BIS_fnc_randomInt;
	_wheX = random (_disX*2)-_disX;
	_wheY = random (_disY*2)-_disY;
	_startPos = [_cooX+_wheX,_cooY+_wheY,0];
	_empty = [];
	_goodPos = [];
	_c = 0;

	_newPos = _startPos isFlatEmpty [15,384,0.5,2,0,false,ObjNull];
	while {(count _newPos) < 1} do {
		_disX = [110,135] call BIS_fnc_randomInt;
		_disY = [110,135] call BIS_fnc_randomInt;
		_wheX = random (_disX*2)-_disX;
		_wheY = random (_disY*2)-_disY;
		_startPos = [_cooX+_wheX,_cooY+_wheY,0];
		_newPos = _startPos isFlatEmpty [10,384,0.7,2,0,false,ObjNull];
		_c = _c + 1;
		if (DebugEnabled > 0) then {hintSilent "finding suitable pos for sstBomber";};
		if (_c > 5) exitWith {_goodPos = []};
		sleep 0.2;
	};

	if (!(_newPos isEqualTo [])) then {
		if !(getMarkerType "bomberMkr" isEqualTo "") then {deleteMarkerLocal "bomberMkr";};
		_mkr = createMarkerLocal ["bomberMkr", _newPos];
		_mkr setMarkerShapeLocal "ELLIPSE";
		"bomberMkr" setMarkerSizeLocal [1, 1];
		"bomberMkr" setMarkerShapeLocal "ICON";
		"bomberMkr" setMarkerTypeLocal "EMPTY";//"mil_dot"
	};

	if (_newPos isEqualTo []) exitWith {if (DebugEnabled > 0) then {hintSilent "suitable pos for sstBomber not found";}; _empty;};
	_newPos
};
spawn_Op4_grp = {
	// Creates infantry group. by Jigsor
	params ["_newZone","_grpSize"];
	private ["_grp","_unit_type","_unit"];
	_grp = createGroup INS_Op4_side;

	for "_i" from 0 to (_grpSize - 2) step 1 do {
		_unit_type = selectRandom INS_men_list;
		_unit = _grp createUnit [_unit_type, _newZone, [], 0, "NONE"];
	};
	_grp createUnit [INS_Op4_medic, _newZone, [], 0, "NONE"];

	(group _unit) setVariable ["zbe_cacheDisabled",false];
	if (BTC_p_skill isEqualTo 1) then {[_grp] call BTC_AI_init};

	{
		_x addeventhandler ["killed","[(_this select 0)] spawn remove_carcass_fnc"];
		if !(AIdamMod isEqualTo 1) then {
			_x removeAllEventHandlers "HandleDamage";
			_x addEventHandler ["HandleDamage",{_damage = (_this select 2)*AIdamMod;_damage}];
		};
		_x addEventHandler ["Reloaded", {
			params ["_unit", "_weapon", "_muzzle", "_newmag", ["_oldmag", ["","","",""]]];
			if (_oldmag select 2 isEqualType "") then {_unit addMagazine (_newmag # 0)} else {_unit addMagazine (_oldmag # 0)};
		}];
		if (INS_op_faction in [20]) then {[_x] call Trade_Biofoam_fnc};
	} forEach (units _grp);

	_grp
};
spawn_Op4_StatDef_Objectifs = {
	// Static Gunner group creation and placements. by Jigsor
	params ["_newZone","_grpSize","_radius"];
	private ["_allGuns1","_interval","_assets","_randType","_circle","_startPos","_finalPos","_type","_static","_statGrp","_unitType","_allGuns2"];

	_assets = [];
	_allGuns1 = [];
	_allGuns2 = [];
	_interval = round(360/_grpSize);

	//add weighting/favored static guns
	_favored1 = (INS_Op4_stat_weps # 0);
	_favored2 = (INS_Op4_stat_weps # 1);
	_assets pushBack _favored1;
	_assets pushBack _favored2;

	if (_grpSize > 2) then {
		for "_i" from 0 to _grpSize step 1 do {
			_randType = selectRandom INS_Op4_stat_weps;
			_assets pushBack _randType;
		};
	};

	for "_circle" from 1 to 360 step _interval do {
		_startPos = [(_newZone select 0) + (sin(_circle)*_radius), (_newZone select 1) + (cos(_circle)*_radius), _newZone select 2];
		_type = _assets # 0;
		_assets deleteAt 0;

		if (isOnRoad _startPos) then {
			_finalPos = _startPos findEmptyPosition [2, 30, _type];
			if (_finalPos isEqualTo []) then {_finalPos = _startPos};
		}else{
			_finalPos = _startPos;
		};

		_static = createVehicle [_type, _finalPos, [], 0, "NONE"];
		_static allowDamage false;
		_static modelToWorld _finalPos;
		_static setDir (_newZone getDir _finalPos);
		_allGuns1 pushBack _static;
		_allGuns2 pushBack _static;
	};

	_statGrp = createGroup INS_Op4_side;

	for "_i" from 1 to _grpSize step 1 do {
		_unitType = selectRandom INS_men_list;
		_statGrp createUnit [_unitType, _newZone, [], 0, "NONE"];
	};

	if (BTC_p_skill isEqualTo 1) then {[_statGrp] call BTC_AI_init};

	{
		_x addeventhandler ["killed", "[(_this select 0)] spawn remove_carcass_fnc"];
		if !(AIdamMod isEqualTo 1) then {
			_x removeAllEventHandlers "HandleDamage";
			_x addEventHandler ["HandleDamage", {_damage = (_this select 2)*AIdamMod;_damage}];
		};
		if (INS_op_faction in [20]) then {[_x] call Trade_Biofoam_fnc};
	} forEach (units _statGrp);

	objective_pos_logic setVariable ["INS_ObjectiveStatics", _allGuns1];

	{
		private _thisGun = (_allGuns2 # 0);
		_allGuns2 deleteAt 0;
		_thisGun setVectorUp [0,0,1];
		_thisGun allowDamage true;
		_x assignAsGunner _thisGun;
		_x moveInGunner _thisGun;
	} forEach (units _statGrp);

	_statGrp setCombatMode "RED";
/*
	// Roof top placement
	if (_grpSize > 2) then {
		private ["_list1","_ranSel"];
		_list1 = [];
		_ranSel = selectRandom _allGuns1;
		_list1 pushBack _ranSel;

		[_list1,_newZone] spawn {
			params ["_array1","_sPos"];
			private _fail = false;
			[_array1,_sPos] call {
				if (!params [
					["_array1", [0]],
					["_sPos", [0,0,0]]
				]) exitWith {_fail = true;};
			};
			if (_sPos isEqualTo [0,0,0] || _fail) exitWith {if (DebugEnabled isEqualTo 1) then {diag_log format["RoofTop Static UnitArray: %1 Static Center %2", _array1, _sPos];};};
			if (DebugEnabled isEqualTo 1) then {diag_log "Attempting rooftop static placement"};

			sleep 2;
			null = [_sPos, _array1, 110, 2, [0,33], true, false] execVM "scripts\SHK_buildingpos.sqf";
		};
	};
	_statGrp
*/
};
spawn_Op4_StatDef = {
	// Static Gunner group creation and placements. by Jigsor
	params ["_newZone","_grpSize","_radius"];
	private ["_allGuns1","_interval","_assets","_randType","_circle","_startPos","_finalPos","_type","_static","_statGrp","_unitType","_allGuns2"];

	_assets = [];
	_allGuns1 = [];
	_allGuns2 = [];
	_interval = round(360/_grpSize);

	//add weighting/favored static guns
	_favored1 = (INS_Op4_stat_weps # 0);
	_favored2 = (INS_Op4_stat_weps # 1);
	_assets pushBack _favored1;
	_assets pushBack _favored2;

	if (_grpSize > 2) then {
		for "_i" from 0 to _grpSize step 1 do {
			_randType = selectRandom INS_Op4_stat_weps;
			_assets pushBack _randType;
		};
	};

	for "_circle" from 1 to 360 step _interval do {
		_startPos = [(_newZone select 0) + (sin(_circle)*_radius), (_newZone select 1) + (cos(_circle)*_radius), _newZone select 2];
		_type = _assets # 0;
		_assets deleteAt 0;

		if (isOnRoad _startPos) then {
			_finalPos = _startPos findEmptyPosition [2, 30, _type];
			if (_finalPos isEqualTo []) then {_finalPos = _startPos};
		}else{
			_finalPos = _startPos;
		};

		_static = createVehicle [_type, _finalPos, [], 0, "NONE"];
		_static allowDamage false;
		_static modelToWorld _finalPos;
		_static setDir (_newZone getDir _finalPos);
		_allGuns1 pushBack _static;
		_allGuns2 pushBack _static;
	};
	_statGrp = createGroup INS_Op4_side;

	for "_i" from 1 to _grpSize step 1 do {
		_unitType = selectRandom INS_men_list;
		_statGrp createUnit [_unitType, _newZone, [], 0, "NONE"];
	};

	if (BTC_p_skill isEqualTo 1) then {[_statGrp] call BTC_AI_init};

	{
		_x addeventhandler ["killed", "[(_this select 0)] spawn remove_carcass_fnc"];
		if !(AIdamMod isEqualTo 1) then {
			_x removeAllEventHandlers "HandleDamage";
			_x addEventHandler ["HandleDamage", {_damage = (_this select 2)*AIdamMod;_damage}];
		};
		if (INS_op_faction in [20]) then {[_x] call Trade_Biofoam_fnc};
	} forEach (units _statGrp);

	objective_pos_logic setVariable ["INS_ObjectiveStatics", _allGuns1];

	{
		private _thisGun = (_allGuns2 # 0);
		_allGuns2 deleteAt 0;
		_thisGun setVectorUp [0,0,1];
		_thisGun allowDamage true;
		_x assignAsGunner _thisGun;
		_x moveInGunner _thisGun;
	} forEach (units _statGrp);

	_statGrp setCombatMode "RED";

	// Roof top placement
	if (_grpSize > 2) then {
		private ["_list1","_ranSel"];
		_list1 = [];
		_ranSel = selectRandom _allGuns1;
		_list1 pushBack _ranSel;

		[_list1,_newZone] spawn {
			params ["_array1","_sPos"];
			private _fail = false;
			[_array1,_sPos] call {
				if (!params [
					["_array1", [0]],
					["_sPos", [0,0,0]]
				]) exitWith {_fail = true;};
			};
			if (_sPos isEqualTo [0,0,0] || _fail) exitWith {if (DebugEnabled isEqualTo 1) then {diag_log format["RoofTop Static UnitArray: %1 Static Center %2", _array1, _sPos];};};
			if (DebugEnabled isEqualTo 1) then {diag_log "Attempting rooftop static placement"};

			sleep 2;
			null = [_sPos, _array1, 110, 2, [0,33], true, false] execVM "scripts\SHK_buildingpos.sqf";
		};
	};
	_statGrp
};
INS_Tsk_GrpMkrs = {
	params ["_grp","_wpMkrArray","_mkr","_wpMkr","_cid","_newMkr"];
	_wpMkrArray = [];

	for "_i" from 1 to (count (waypoints _grp)) -1 step 1 do {
		_mkr = format["%1 WP%2", objective_pos_logic, _i];
		_wpMkr = createMarker [_mkr, getWPPos [_grp, _i]];
		_wpMkr setMarkerText _mkr;
		_wpMkr setMarkerType "waypoint";
		_wpMkrArray pushBack _wpMkr;
	};

	_cid = floor(random 1000);
	_mkr = format["Tsk Defence Grp_%1", _cid];
	_newMkr = createMarker [_mkr, (position leader _grp)];
	_newMkr setMarkerText _mkr;
	_newMkr setMarkerType "o_inf";

	while {alive leader _grp} do {
		_newMkr setMarkerPos (getPosWorld leader _grp);
		uiSleep 0.5;
	};
	deleteMarker _newMkr;
	{deleteMarker _x;} forEach _wpMkrArray;
};
Inf_taskPatrol_mod = {
	//Optimized version of BIS_fnc_taskPatrol used for infantry by Jigsor.
	params [["_grp",grpNull],["_pos",[]],["_maxDist",0],["_blacklist",[]]];

	_grp setBehaviour "SAFE";

	private _prevPos = _pos;
	for "_i" from 0 to (2 + (floor (random 3))) step 1 do {
		private _newPos = [_prevPos, 50, _maxDist, 1, 0, 60 * (pi / 180), 0, _blacklist] call BIS_fnc_findSafePos;
		_prevPos = _newPos;
		private _wp = _grp addWaypoint [_newPos, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointCompletionRadius 20;
		if (_i == 0) then {//Set the group's speed and formation at the first waypoint.
			_wp setWaypointSpeed "LIMITED";
			_wp setWaypointFormation "STAG COLUMN";
		};
	};

	private _wp = _grp addWaypoint [_pos, 0];
	_wp setWaypointType "CYCLE";
	_wp setWaypointCompletionRadius 20;
	true
};
Veh_taskPatrol_mod = {
	// BIS_fnc_taskPatrol modified by Demonized to fix some vehicle bugs not moving when speed or behaviour was not defined for each wp.
	_grp = _this # 0;
	_pos = _this # 1;
	_maxDist = _this # 2;

	for "_i" from 0 to (2 + (floor (random 3))) step 1 do {
		_newPos = [_pos, 50, _maxDist, 1, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
		_wp = _grp addWaypoint [_newPos, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointSpeed "LIMITED";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointFormation "COLUMN";
		_wp setWaypointCompletionRadius 20;
	};

	_wp = _grp addWaypoint [_pos, 0];
	_wp setWaypointType "CYCLE";
	_wp setWaypointCompletionRadius 20;
	true
};
/*
remove_charge_fnc = {
	// remove charge/satchel from ammo cache's cargo space by Jigsor.
	params ["_crate","_all_mags","_type"];
	_all_mags = magazineCargo _crate;
	{
		_type = [_x] call BIS_fnc_itemType;
		if ((_type select 1) == "mine") then {
			_all_mags = _all_mags - [_x];
		};
	} count _all_mags;
	clearMagazineCargoGlobal _crate;
	{_crate addMagazineCargoGlobal [_x, 1];} count _all_mags;
	//hint str (_all_mags);
	true
};
*/
INS_MHQ_VarName = {
	params ["_veh"];
	INS_MHQ_killed = VehicleVarName _veh;
	publicVariable "INS_MHQ_killed";
	true
};
GAS_smoke_AIdamage = {
	// Give damage to AI not wearing gas mask in toxic smoke by Jigsor
	private ["_currPos","_aiArray","_sound","_odd"];
	private _currPos = _this;
	private _odd = 1;

	// loop time based on approximate life time of smoke grenade (21 seconds)
	for '_i' from 1 to 10 step 1 do {
		private _aiArray = _currPos nearEntities ["CAManBase",15] select {(!isPlayer _x) && (([(headgear _x),(goggles _x)] arrayIntersect INS_allGasMask) isEqualTo [])};
		{
			if (_odd isEqualTo 1) then {
				private _sound = selectRandom Choke_Sounds;
				playsound3d [_sound, _x, false, getPosasl _x, 5,1,40];
				_odd = 2;
			}else{
				_odd = 1;
			};
			uiSleep (random 0.21);
			_x setDamage (damage _x + 0.13);
		} count _aiArray;
		uiSleep 2.1;
	};
	ToxicGasLoc = [];
};
JIG_DustIsOn = {
	if (missionNameSpace getVariable ["JSSactive", false]) then {call JIG_SnowIsOn};
	// If Dust Storm active then deactivate
	private _active = missionNameSpace getVariable ["JDSactive", false];
	if (_active) then {
		missionNameSpace setVariable ["JDSactive", false];
		setWind [0,0,true];
		JIG_DustStorm = false;
		publicVariable "JIG_DustStorm";
		true
	}else{
		false
	};
};
JIG_RandomWindDir = {
	params [["_vel", 1, [0]]];
		private _dir = selectRandom [
		[0,_vel,true],	//North
		[0,-_vel,true],	//South
		[_vel,0,true],	//East
		[-_vel,0,true],	//West
		[-_vel,_vel,true],	//North West
		[_vel,_vel,true],	//North East
		[-_vel,-_vel,true],	//South West
		[_vel,-_vel,true]	//South East
	];
	setWind _dir;
};
JIG_ActivateDust = {
	// Activate Dust Storm
	params [["_vel", 12, [0]]];
	missionNameSpace setVariable ["JDSactive", true];
	[_vel] call JIG_RandomWindDir;
	JIG_DustStorm = true;
	publicVariable "JIG_DustStorm";
	sleep 3;
	[] remoteExec ["JIG_Dust_Storm", [0,-2] select isDedicated];
};
JIG_SnowIsOn = {
	if (missionNameSpace getVariable ["JDSactive", false]) then {call JIG_DustIsOn};
	// If Snow Storm active then deactivate
	private _active = missionNameSpace getVariable ["JSSactive", false];
	if (_active) then {
		missionNameSpace setVariable ["JSSactive", false];
		setWind [0,0,true];
		JIG_SnowStorm = false;
		publicVariable "JIG_SnowStorm";
		[] remoteExec ['INS_ClearSnowOverCast'];
		true
	}else{
		false
	};
};
JIG_ActivateSnow = {
	// Activate Snow Storm
	params [["_vel", 2, [0]]];
	missionNameSpace setVariable ["JSSactive", true];
	[_vel] call JIG_RandomWindDir;
	JIG_SnowStorm = true;
	publicVariable "JIG_SnowStorm";
	sleep 3;
	[] remoteExec ['INS_SnowOverCast'];
	sleep 3;
	[] remoteExec ["JIG_Snow_Storm", [0,-2] select isDedicated];
};
INSciviKilled_fnc = {
	params [["_unit",objNull],["_killer",objNull]];
	if (!(vehicleVarName _unit isEqualTo "sstBomber") && {!isNull _killer} && {isPlayer _killer}) then {
		private _killerName = if (alive _killer) then {name _killer}else{"Unidentified"};
		private _killed = name _unit;
		private _penalty = -3500;
		private _tally = (rating _killer) + _penalty;
		private _txt = format ["%1 Killed Civilian %2", _killerName, _killed];
		_killer addRating _tally;
		[_txt] remoteExec ["JIG_MPSystemChat_fnc", [0,-2] select isDedicated];
		//_killer remoteExec ["JIG_Boo", _killer];//too cheesy?

		private _mTxt = format ["%1", _killerName];
		private _m = createMarker [_mTxt, getPosWorld _killer];
		_m setMarkerType "hd_warning";
		_m setMarkerColor "ColorRed";
		_m setMarkerText _mTxt;

		[_m, _killer] spawn {
			params ["_m","_killer"];
			for "_i" from 1 to 300 step 1 do {//show civ killer marker for approx. 14 seconds
				uiSleep 1;
				if (!alive _killer) exitWith {};
				_m setMarkerPos getPosWorld _killer;
			};
			deleteMarker _m;
		};
	};
	_unit spawn remove_carcass_fnc;
};
killedByInfo_fnc = {
	params ["_poorSoul","_killer"];
	if (!isNull _killer && {alive _killer}) then {
		private _killerName = if (name _killer == "Error: No unit") then {"Unidentified"}else{name _killer};
		private _killedName = name _poorSoul;
		private _txt = format ["%1 Killed by %2",_killedName, _killerName];
		_txt remoteExec ['JIG_MPTitleText_fnc', [0,-2] select isDedicated];
	};
};
