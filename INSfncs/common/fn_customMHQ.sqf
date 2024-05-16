//MHQ vehicle customizations
params [["_veh", objNull]];
if (isNull _veh) exitWith {};
private _type = typeOf _veh;
private _customization = [];

if (INS_Blu_side isEqualTo WEST) then {
	if (_type isEqualTo "I_APC_Wheeled_03_cannon_F") then {
		_veh animateSource ["HideTurret",1];
		_veh lockTurret [[0],true];
		_veh lockTurret [[0,0],true];
		_customization = [["Guerilla_02",1], ["showCamonetHull",0,"showBags",1,"showBags2",1,"showTools",1,"showSLATHull",0]];
	};
	if (_type in ["B_APC_Wheeled_01_cannon_F","B_T_APC_Wheeled_01_cannon_F"]) then {
		_veh animateSource ["HideTurret",1];
		_veh lockTurret [[0],true];
		_veh lockTurret [[0,0],true];
	};
	if (typeOf _veh isEqualTo "I_MRAP_03_F") then {
		_customization = [["Blufor",1],[]];
	};
	if (typeOf _veh isEqualTo "maestro_polaris_hmg") then {
		//clearMagazineCargoGlobal _veh;
		//clearWeaponCargoGlobal _veh;
		//clearBackpackCargoGlobal _veh;
		//clearItemCargoGlobal _veh;
		_customization = [["Olive",1],["HideDoor1",1,"HideDoor2",1,"HideDoor3",1,"HideDoor4",1]];
	};
	if (typeOf _veh isEqualTo "maestro_polaris_at") then {
		//clearMagazineCargoGlobal _veh;
		//clearWeaponCargoGlobal _veh;
		//clearBackpackCargoGlobal _veh;
		//clearItemCargoGlobal _veh;
		_customization = [["Olive",1],["HideDoor1",1,"HideDoor2",1,"HideDoor3",1,"HideDoor4",1]];
	};
	/*
	if (typeOf _veh isEqualTo "B_LSV_01_unarmed_F") then {
		clearMagazineCargoGlobal _veh;
		clearWeaponCargoGlobal _veh;
		clearBackpackCargoGlobal _veh;
		clearItemCargoGlobal _veh;
		_customization = [["Olive",1],["HideDoor1",1,"HideDoor2",1,"HideDoor3",1,"HideDoor4",1]];
	};
	*/
};

if (INS_Blu_side isEqualTo RESISTANCE) then {
	if (_type isEqualTo "I_APC_Wheeled_03_cannon_F") then {
		_veh animateSource ["HideTurret",1];
		_veh lockTurret [[0],true];
		_veh lockTurret [[0,0],true];
		_customization = [[], ["showCamonetHull",0,"showBags",1,"showBags2",1,"showTools",1,"showSLATHull",0]];
	};
};

if (INS_play_op4 isEqualTo EAST) then {
	if (_veh isEqualTo "O_T_APC_Tracked_02_30mm_lxWS") then {
		_customization = [["Grey",1],["showTracks",0,"showCamonetHull",1,"showBags",0,"showSLATHull",0]];
	};
	if (_veh isEqualTo "O_T_MBT_04_command_F") then {
		_customization = [["Grey",1],["showCamonetHull",1,"showCamonetTurret",1]];
	};
};



if !(_customization isEqualTo []) then {
	[_veh, _customization # 0, _customization # 1] call BIS_fnc_initVehicle;
};

