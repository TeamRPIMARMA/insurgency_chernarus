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

private ["_marker", "_typeofunit", "_numberofvehicle"];

_marker = _this select 0;
_typeofunit = _this select 1;
_numberofvehicle = _this select 2;

for '_i' from 0 to _numberofvehicle do {// -- On répète X fois le code pour X groupes
    _spawnPos = [markerPos [_marker], 0, (RANDOM 360)] call BIS_fnc_relPos; 
    _spawnPos = [_spawnPos, 1, 150, 3, 0, 20, 0] call BIS_fnc_findSafePos;         
    _grp = [_spawnPos, East, _typeofunit] call BIS_fnc_spawnGroup;
    [_grp,INFskill] call POPO_fnc_SkillSet;
    _grp setCombatMode "RED";
    _wp = _grp addWaypoint [getPosASL player, -1];  
    _wp setWaypointType "SAD";   
    _wp setWaypointSpeed "FULL";   
    _wp setWaypointBehaviour "AWARE";   
    _wp setWaypointFormation "WEDGE";   
    _wp setWaypointCompletionRadius 50;
};