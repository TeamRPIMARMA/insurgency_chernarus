// functions for BLUFOR

Popo_teleport_avions_fnc = {
	// teleport by Popo
	_tele = _this select 0;
	_caller = _this select 1;
	_caller setPos ((INS_flag) modelToWorld [3,0,-3.5]);
	true
};
Popo_teleport_MHQ_1_fnc = {
	// teleport by Popo
	_unit = _this select 0;
	_caller = _this select 1;
	_id = _this select 2;
	_caller moveInCargo MHQ_1;
	true
};
Popo_teleport_MHQ_2_fnc = {
	// teleport by Popo
	_unit = _this select 0;
	_caller = _this select 1;
	_id = _this select 2;
	_caller moveInCargo MHQ_2;
	true
};
Popo_teleport_MHQ_3_fnc = {
	// teleport by Popo
	_unit = _this select 0;
	_caller = _this select 1;
	_id = _this select 2;
	_caller moveInCargo MHQ_3;
	true
};
Popo_teleport_RHIB_1_fnc = {
	// teleport by Popo
	_unit = _this select 0;
	_caller = _this select 1;
	_id = _this select 2;
	_caller moveInCargo RPIMA_RHIB_1;
	true
};
Popo_teleport_RHIB_2_fnc = {
	// teleport by Popo
	_unit = _this select 0;
	_caller = _this select 1;
	_id = _this select 2;
	_caller moveInCargo RPIMA_RHIB_2;
	true
};
Popo_teleport_RPIMA_Pickup_1_fnc = {
	// teleport by Popo
	_unit = _this select 0;
	_caller = _this select 1;
	_id = _this select 2;
	_caller moveInCargo RPIMA_Pickup_1;
	true
};
Popo_teleport_FOB_Obeh_fnc = {
	// teleport by Popo
	_tele = _this select 0;
	_caller = _this select 1;
	_caller setPos ((FOB_Obeh) modelToWorld [2,0,0]);
	true
};
Popo_teleport_FOB_Nauzad_fnc = {
	// teleport by Popo
	_tele = _this select 0;
	_caller = _this select 1;
	_caller setPos ((FOB_Nauzad) modelToWorld [2,0,0]);
	true
};

// functions for OPFOR
//Addaction Popo_E_VA
Popo_teleport_Imam_fnc = {
	// teleport by Popo
	_tele = _this select 0;
	_caller = _this select 1;
	_caller setPos ((Imam) modelToWorld [0,1,0]);
	true
};
Popo_teleport_KA60_fnc = {
	// teleport by Popo
	_unit = _this select 0;
	_caller = _this select 1;
	_id = _this select 2;
	_caller moveInCargo KA60;
	true
};
Popo_teleport_Pandur_fnc = {
	// teleport by Popo
	_unit = _this select 0;
	_caller = _this select 1;
	_id = _this select 2;
	_caller moveInCargo Pandur;
	true
};
Popo_teleport_CamionCiterne_fnc = {
	// teleport by Popo
	_unit = _this select 0;
	_caller = _this select 1;
	_id = _this select 2;
	_caller moveInCargo CamionCiterne;
	true
};
// Addaction tunnel
Popo_teleport_AmmoCachePlayer_Skalisty_fnc = {
	// teleport by Popo
	_tele = _this select 0;
	_caller = _this select 1;
	_caller setPos ((AmmoCachePlayer_Skalisty) modelToWorld [0,1,0]);
	true
};
Popo_teleport_AmmoCachePlayer_Maku_fnc = {
	// teleport by Popo
	_tele = _this select 0;
	_caller = _this select 1;
	_caller setPos ((AmmoCachePlayer_Maku) modelToWorld [0,1,0]);
	true
};
Popo_teleport_AmmoCachePlayer_Naudeh_fnc = {
	// teleport by Popo
	_tele = _this select 0;
	_caller = _this select 1;
	_caller setPos ((AmmoCachePlayer_Naudeh) modelToWorld [0,1,0]);
	true
};
Popo_teleport_AmmoCachePlayer_Tebbi_fnc = {
	// teleport by Popo
	_tele = _this select 0;
	_caller = _this select 1;
	_caller setPos ((AmmoCachePlayer_Tebbi) modelToWorld [0,1,0]);
	true
};
//Opfor MHQ
Popo_teleport_Opfor_MHQ_fnc = {
	// teleport by Popo
	_unit = _this select 0;
	_caller = _this select 1;
	_id = _this select 2;
	_caller moveInCargo Opfor_MHQ;
	true
};
//player setpos activated_cache_pos;
Popo_teleport_Ammocache_teleport_OPFORPlayer_fnc = {
	// teleport by Popo
	_tele = _this select 0;
	_caller = _this select 1;
	//_caller setPos ((activated_cache_pos) modelToWorld [0,1,0]);
	_caller setPos activated_cache_pos;
	true
};
// function attach logistic
//on attache la caisse et on désactive les places dans la benne 
Popo_Attach_Logistic_Vehicle_Mhq_1_fnc = {
	params ["_veh"];
	[RPIMA_arsenal_MHQ_1, _veh] call BIS_fnc_attachToRelative;
	[RPIMA_c_m_1_MHQ_1, _veh] call BIS_fnc_attachToRelative;
	[RPIMA_c_m_2_MHQ_1, _veh] call BIS_fnc_attachToRelative;
	[RPIMA_c_m_3_MHQ_1, _veh] call BIS_fnc_attachToRelative;
	_veh lockCargo [3, true];
	_veh lockCargo [4, true];
	_veh lockCargo [5, true];
	_veh lockCargo [6, true];
	if (hasInterface) then {[west, "Base"] sideChat "Caisses chargées dans le MHQ 1 ... OK";};
};
//on attache la caisse et on désactive les places dans la benne 
Popo_Attach_Logistic_Vehicle_Mhq_2_fnc = {
	params ["_veh"];
	[RPIMA_arsenal_MHQ_2, _veh] call BIS_fnc_attachToRelative;
	[RPIMA_c_m_1_MHQ_2, _veh] call BIS_fnc_attachToRelative;
	[RPIMA_c_m_2_MHQ_2, _veh] call BIS_fnc_attachToRelative;
	[RPIMA_c_m_3_MHQ_2, _veh] call BIS_fnc_attachToRelative;
	_veh lockCargo [3, true];
	_veh lockCargo [4, true];
	_veh lockCargo [5, true];
	_veh lockCargo [6, true];
	if (hasInterface) then {[west, "Base"] sideChat "Caisses chargées dans le MHQ 2 ... OK";};
};
//on attache la caisse et on désactive les places dans la benne 
Popo_Attach_Logistic_Vehicle_pickup_rearm_repair_fnc = {
	params ["_veh"];
    [RPIMA_ammo_veh, _veh] call BIS_fnc_attachToRelative;
    [RPIMA_ammo_veh, _veh] call BIS_fnc_attachToRelative;
    [RPIMA_ammo_veh, _veh] call BIS_fnc_attachToRelative;
    [RPIMA_ammo_veh, _veh] call BIS_fnc_attachToRelative;
    _veh lockCargo [3, true];
    _veh lockCargo [4, true];
    _veh lockCargo [5, true];
    _veh lockCargo [6, true];
	if (hasInterface) then {[west, "Base"] sideChat "Caisse chargée dans le pickup support ... OK";};
};
/*Ne fonctionne que en local
// # SYNTAX [POSITION] call Popo_GarageVirtual_fnc;
Popo_GarageVirtual_fnc = {
    _DirGarage = getDir SpawnGarage;
	_pos = SpawnGarage getPos [0, _DirGarage];
	_vehicle = createVehicle ["Land_HelipadEmpty_F", _pos, [], 0, "CAN_COLLIDE"];
    _vehicle setdir _DirGarage;
	["Open", [true, _vehicle]] call BIS_fnc_garage;
};
*/

