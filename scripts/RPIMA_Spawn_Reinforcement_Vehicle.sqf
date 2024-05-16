// Run on HeadlessClient if HeadlessClient
HCPresent = if (isNil "Any_HC_present") then {False} else {True};

if ((!isServer && hasInterface) || (HCPresent && isServer)) exitWith{};

/*
	Author: <Popo>

	Description:
		        FR = La fonction permet de créée des renforts qui vont sur la dernière position connue du joueur. 
          
                EN = The function allows you to create reinforcements which go to the last known position of the player.

	Parameter(s):

    # SYNTAX

		_marker = the position of spawn

        _typeofunit = my units choose

        _numberofgrps = the number of vehicles or groups

    call POPO_fnc_InfantryReinforcement;

    or

    call POPO_fnc_VehicleReinforcement;

	Examples:
 
    null = ["m382", INS_men_list, 10] execVM "scripts\RPIMA_Spawn_Reinforcement_Infantry.sqf";

    the unit spawn @ marker with the chosen unit type x 3
*/

private ["_marker", "_typeofvehicle", "_numberofvehicle"];

_marker = _this select 0;
_typeofvehicle = _this select 1;
_numberofvehicle = _this select 2;

for '_i' from 0 to _numberofvehicle do { // -- On répète X fois le code pour X véhicules
    _spawnPos = [markerPos [_marker], 0, (RANDOM 360)] call BIS_fnc_relPos; 
    _spawnPos = [_spawnPos, 1, 150, 3, 0, 20, 0] call BIS_fnc_findSafePos;      
    _veh = createVehicle [_typeofvehicle,_spawnPos,[],0,"NONE"];
    _grp = createVehicleCrew _veh;
    [_grp,ARMskill] call POPO_fnc_SkillSet;
    if (typeOf _veh isEqualTo "O_T_MBT_04_command_F") then {[_veh, ["Grey",1],["showCamonetHull",1,"showCamonetTurret",1]] call BIS_fnc_initVehicle;};
    if (typeOf _veh isEqualTo "O_T_APC_Tracked_02_30mm_lxWS") then {[_veh, ["Grey",1],["showTracks",0,"showCamonetHull",1,"showBags",0,"showSLATHull",0]] call BIS_fnc_initVehicle;};
    _grp setCombatMode "RED";  
    _wp = _grp addWaypoint [getPosASL player, -1];  
    _wp setWaypointType "SAD";  
    _wp setWaypointSpeed "FULL";   
    _wp setWaypointBehaviour "AWARE";   
    _wp setWaypointFormation "COLUMN";   
    _wp setWaypointCompletionRadius 50;
};

