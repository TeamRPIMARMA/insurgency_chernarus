/*
INS_SuicideBomber.sqf by Jigsor
movement section by Zooloo75/Stealthstick
recruit existing civilian by SupahG33K
Modified by team 1er-RPIMA
*/

if (!isServer) exitWith {};
private ["_ins_debug","_loop"];
if (DebugEnabled > 0) then {_ins_debug = true;}else{waitUntil {time > 60}; _ins_debug = false;};

missionNamespace setVariable ["sstBomber",ObjNull];
private _makeBomberGrp = {
	private _grp = createGroup civilian;
	_grp
};
private _delay = true;
private _basePos = markerPos "Airfield";
private _safeZoneRad = 300;// radius _basePos marker safe zone/spawn suicide bomber beyond this distance
private _targetSide = WEST;
sstBomber = ObjNull;
random_w_player4 = ObjNull;
random_civ_bomber = ObjNull;
civBomberGrp = call _makeBomberGrp;

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	sleep 3;
	if (_delay) then {sleep 90};
	waitUntil {sleep 2; isNull sstBomber || (!alive sstBomber)};
	if ((isNull sstBomber) || (!alive sstBomber)) then
	{
		private "_rSleep";
		if (_ins_debug) then {
			_rSleep = [20,40] call BIS_fnc_randomInt;
			sleep _rSleep;
		} else {
			_rSleep = [900,2400] call BIS_fnc_randomInt;//15-40 minute random loop delay 900,2400
			sleep _rSleep;
		};

		if (isNull civBomberGrp) then {civBomberGrp = call _makeBomberGrp;};
		private _bmbrPos = nil;
		private _runCode = 1;
		private _explosiveClass = selectRandom suicide_bmbr_weps;
		private _VarName = "sstBomber";
		_delay = false;
		random_w_player4 = ObjNull;
		random_civ_bomber = nil; //SupahG33K - draftee

		publicVariableServer "random_w_player4";
		sleep 3;
		publicVariableServer "random_civ_bomber"; //SupahG33K - draftee
		sleep 3;
		random_w_player4 = [] call find_bombee_fnc;
		sleep 3;

		if (isNull random_w_player4) exitWith {_delay = true; diag_log "No credible target for suicide bomber";};

		if (_ins_debug) then {
			diag_log text format ["Bomber West Human Target1: %1", random_w_player4];
			titleText ["INS_SuicideBomber.sqf running","PLAIN DOWN"];
		};

		private _playerPos = getPos random_w_player4;

		if (isNil "_playerPos") exitWith {diag_log "Bad Position information for suicide bomber target"; _delay = true;};
		if (_ins_debug) then {diag_log text format ["Random Player Bomber Target Pos : %1", _playerPos]};
		if (_playerPos distance _basePos < _safeZoneRad) exitWith {_delay = true; diag_log "Suicide Bomber target inside base area - aborting";};

		//SupahG33K - look for existing local civilian
		random_civ_bomber = [] call find_civ_bomber_fnc;				
		sleep 3; // on laisse le temps à la fonction de s'executer
		
		//fonction qui check l'etat si le civil est inconscient;
		private _is_unconscious = {
			params ["_bmbr"];
			private _unconscious = _bmbr getVariable ["ACE_isUnconscious", false];
			_unconscious
		};
		//fonction qui check l'etat si le civil est arreté par les hendeks
		private _is_busted = {
			params ["_bmbr"];
			private _busted = _bmbr getVariable ["ace_captives_isHandcuffed", false];		
			_busted
		};		
		
		private "_unit";
		//on verifie qu'il y a un civil en premier; si pas de civil on quitte		
		if (!isNull random_civ_bomber) then {
			//check l'état du civil choisi comme martyr; doit etre conscient et libre
			private _random_civ_bomber_unconscious = random_civ_bomber call _is_unconscious ;
			private _random_civ_bomber_busted = random_civ_bomber call _is_busted;
			//si pas conscient ou pas libre alors on quitte
			if (_random_civ_bomber_unconscious isEqualTo true || _random_civ_bomber_busted isEqualTo true) exitWith {
				_delay = true; //pour que la boucle ne recommence pas immediatement
				diag_log "Pas de candidat au martyr conscient ou libre disponible"; //log
				if (_ins_debug) then {
					titleText ["Pas de candidat au martyr conscient ou libre disponible","PLAIN DOWN"]
				}; //debug			
			};
			//Si pas de candidat on annule et on recommence la boucle sinon on continue

			//diag_log "SupahG33K - Civilian Jihadi Draftee found and being equipped for martyrdom";
			if (_ins_debug) then {titleText ["Civilian Jihadi Draftee found and being equipped for martyrdom","PLAIN DOWN"]};

			_unit = random_civ_bomber;
			_unit addeventhandler ["killed",{_this call killed_ss_bmbr_fnc}];

			_bmbrdir = random_w_player4 getDir _unit;
			if (_bmbrdir < 0) then {_bmbrdir = _bmbrdir + 360};
			
			
			_unit addItemToUniform "ACE_Cellphone"; //Appel maman
			_unit addItemToUniform "ACE_DeadManSwitch";// Quand je relache je péte !
			_unit addVest "sVestDM";//Petit gilet il fait froid
			//_unit addItemToVest ["DemoCharge_Remote_Mag", 7];// Pour un maxi boom !!!
			_unit addMagazines ["DemoCharge_Remote_Mag",7];

			_unit setDir _bmbrdir;
			[_unit] joinSilent civBomberGrp;
			_unit SetUnitPos "UP";
			_unit setSkill ["spotTime", 0.8];
			_unit setSkill ["courage", 1];
			_unit setSkill ["spotDistance", 1];
			_unit allowFleeing 0;
			_unit enableStamina false;
			_unit disableAI "AUTOTARGET";
			_unit disableAI "FSM";
			_unit setVehicleVarName _VarName; sstBomber = _unit;
			_unit Call Compile Format ["%1=_this; publicVariable '%1'",_VarName];
			sleep 3;
			//diag_log "SupahG33K Civilian Jihadi Draftee briefed and sent on his way";		
		};//fin recrutement martyr
	
		// movement section si martyr prêt et équipé
		while {alive sstBomber && _runCode isEqualTo 1} do
		{
			private _nearUnits = nearestObjects [_unit, ["CAManBase"], 300];
			_nearUnits deleteAt 0;

			{
				if (!(side _x == _targetSide)) then {_nearUnits = _nearUnits - [_x];};
			} count _nearUnits;

			if(count _nearUnits > 0) then
			{
				private _btarget = _nearUnits # 0;

				[_unit,_btarget] spawn {
					params ["_u","_targ"];

					while {alive _u and !isNull _targ} do {
						_u doMove (getPosATL _targ);
						_u setspeedMode "NORMAL";
						sleep 8;
					};
				};//Jig adding

				waitUntil {sleep 1; (_unit distance getPosATL (_nearUnits # 0) > 300) || (_unit distance getPosATL (_nearUnits # 0) < 17)};

				//Target out of range, remove bomber
				if (_unit distance getPosATL (_nearUnits # 0) > 300) exitWith {
					_runCode = 0;
					_unit setPos [0,0,0];
					_unit removeAllEventHandlers "killed";
					_unit setdamage 1;
					sleep 1;
					deleteVehicle _unit;
					sleep 1;
				};//Jig adding

				// Charge Target & Detonate Bomb
				if(_unit distance (_nearUnits select 0) < 17)
				exitWith
				{
					_unit setspeedMode "FULL";
					_runCode = 0;
					private _explosive = _explosiveClass createVehicle (position _unit);
					sleep jig_tvt_globalsleep;

					//Shout and explode
					[_unit,_explosive] spawn {
						params ["_u","_exp"];
						//_u setmimic "combat";//[_u,'combat'] remoteExec ['setmimic',_btarget];
						null = [_u,"allahuakbar"] call mp_Say3D_fnc;
						//_u setRandomLip true;
						uiSleep 2.1;
						_exp setDamage 1;
						_u addRating 2000;
					};

					//Remove explosive
					[_explosive,_unit] spawn {
						params ["_exp","_u"];
						waitUntil {!alive _u};
						deleteVehicle _exp;
						removeVest _u; // Son gilet a explosé ainsi que les charges de démos !
					};

					private _unitpos = (getPosATL _unit);
					if(floor random 2 isEqualTo 0) then {
						_explosive attachTo [_unit,[-0.02,-0.07,0.042],"rightHand"];
						_unit setPos _unitpos;
					} else {
						_explosive attachTo [_unit,[0, 0.15, 0.15],"Pelvis"];
						_explosive setVectorDirAndUp [[1, 0, 0], [0, 1, 0]];
						_unit setPos _unitpos;
					};
				};
			}
			else
			{
			_unit setPos [0,0,0];
			_unit removeAllEventHandlers "killed";
			_unit setdamage 1;
			sleep 1;
			deleteVehicle _unit;
			};// Jig adding else

			sleep 1;
		};//fin du while
	};//fin du if (_delay... ; problème le if s'arretait trop tot
}; //fin de la boucle principal