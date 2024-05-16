/*
      ::: ::: :::             ::: :::             :::
     :+: :+:   :+:           :+:   :+:           :+:
    +:+ +:+     +:+         +:+     +:+         +:+
   +#+ +#+       +#+       +#+       +#+       +#+
  +#+ +#+         +#+     +#+         +#+     +#+
 #+# #+#           #+#   #+#           #+#   #+#
### ###             ### ###             ### ###

 Helicopter ammo box drop script (aw_drop.sqf) was written by Jester [AW] of AhoyWorld.co.uk
 You may add or alter this code to your liking as long as you leave the authors name in place.
 set _reloadtime = 30 to however many seconds you want before it is available to use again.
 place "this addAction ["<t color='#0000f6'>Ammo Drop</t>", "aw_drop.sqf",[1],0,false,true,""," driver  _target == _this"];" in the helicopter/plane init field.
 change the loadouts to the crate to your likings.
*/

private ["_heli", "_reloadtime"];

	// lets set some local variables
	_heli = _this select 0;
    _chuteType = "O_Parachute_02_F";	//parachute for blufor, for opfor and greenfor replace the 'B' with 'O' or 'G' respectively
    _crateType =  "O_supplyCrate_F";	//ammocrate class for blufor, feel free to change to whichever box you desire
    _smokeType =  "SmokeShellPurple";  //smoke shell color you want to use
    _lightType =  "Chemlight_red";  //chemlightcolor you want used
    _reloadtime = 900;  // time before next ammo drop is available to use
    _minheight = 0;  // the height you have to be before you can actually drop the crate
    _HQ = [East,"HQ"];  // do not touch this!
    _toLow = format
    	[
    	"<t align='center'><t size='2.2' color='#ed3b00'>TO LOW</t><br/><t size='1.2' color='#9ef680'>You need to be above</t><br/><t size='1.5' color='#ed3b00'>%1 meters</t><br/><t size='1.2' color='#9ef680'>in order to drop an ammo crate.</t></t>",
    		_minheight
    	];  //text to display when not high enough to drop
       
        if (!isServer && isNull player) then {isJIP=true;} else {isJIP=false;};
        // Wait until player is initialized
	if (!isDedicated) then
	{
		waitUntil {!isNull player && isPlayer player};
	};

	// meat and potatoes
	if ( !(isNil "AW_ammoDrop_O_Medic") ) exitWith {hint "Le largage n'est pas disponible actuellement"};
	if ((getPos player) select 2 < _minheight) exitWith {hint parseText _toLow};
	if ((getPos player) select 2 > _minheight) then
	{
		AW_ammoDrop_O_Medic = false;
		publicVariable "AW_ammoDrop_O_Medic";
		
		_chute = createVehicle [_chuteType, [100, 100, 200], [], 0, 'FLY'];
		_chute setPos [getPosASL _heli select 0, getPosASL _heli select 1, (getPosASL _heli select 2) + 500];
		_crate = createVehicle [_crateType, position _chute, [], 0, 'NONE'];
		_crate attachTo [_chute, [0, 0, -1.3]];
		_crate allowdamage false;
		_light = createVehicle [_lightType, position _chute, [], 0, 'NONE'];
		_light attachTo [_chute, [0, 0, 0]];

		// clear crate - leaves medkits in place. add clearItemCargoGlobal _crate; to remove medkits
		clearWeaponCargoGlobal _crate;
		clearMagazineCargoGlobal _crate;
		clearItemCargoGlobal _crate;
		clearBackpackCargoGlobal _crate;

		// fill crate with our junk
		//_crate addItemCargoGlobal ["maestro_darter_B_UAV_Packed", 6];
		_crate addItemCargoGlobal ["ACE_splint", 20];
		_crate addItemCargoGlobal ["ACE_epinephrine", 20];
		_crate addItemCargoGlobal ["ACE_morphine", 20];
		_crate addItemCargoGlobal ["ACE_packingBandage", 20];
		_crate addItemCargoGlobal ["ACE_elasticBandage", 20];
		_crate addItemCargoGlobal ["ACE_UAVBattery", 10];
		_crate addItemCargoGlobal ["ACE_EarPlugs", 4];
		_crate addItemCargoGlobal ["ACE_tourniquet", 20];
		_crate addItemCargoGlobal ["ACE_quikclot", 20];
		_crate addItemCargoGlobal ["ACE_fieldDressing", 20];
		_crate addItemCargoGlobal ["ACE_CableTie", 20];
		//_crate addMagazineCargoGlobal ["maestro_224_SS109_200Rnd", 10];
		_crate addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 4];
		_crate addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 4];
		_crate addMagazineCargoGlobal ["HandGrenade", 20];
		_crate addMagazineCargoGlobal ["SmokeShell", 20];
		_crate addMagazineCargoGlobal ["SmokeShellYellow", 20];
		_crate addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", 20];
		//_crate addMagazineCargoGlobal ["maestro_308_MK316_20Rnd", 20];
		//_crate addMagazineCargoGlobal ["maestro_224_MK318_30Rnd", 30];
		//_crate addMagazineCargoGlobal ["MRAWS_HEAT55_F", 5];
		_crate addMagazineCargoGlobal ["MRAWS_HE_F", 4];
		_crate addMagazineCargoGlobal ["MRAWS_HEAT_F", 4];
		_crate addMagazineCargoGlobal ["Titan_AA", 4];
		//_crate addMagazineCargoGlobal ["maestro_57_SS190_20Rnd", 10];
		//_crate addMagazineCargoGlobal ["maestro_9x19_JHP_19Rnd", 10];
		_crate addMagazineCargoGlobal ["ClaymoreDirectionalMine_Remote_Mag", 10];

		// lets people know stuff happened
		_HQ sideChat "Largage de la caisse de munitions sur votre postion à 500 mètres d'altitude !";
		hint format ["caisse larguée, prochain largage prêt dans: %1 secondes",_reloadtime];
		waitUntil {position _crate select 2 < 1 || isNull _chute};
		detach _crate;
		_crate setPos [position _crate select 0, position _crate select 1, 0];
		_smoke = _smokeType createVehicle [getPos _crate select 0, getPos _crate select 1,5];

		// let ground forces know they can resupply
		_HQ sideChat "Attention: la caisse de munition a atterri!";
		sleep 3;
		//_HQ sideChat "Je le répète, la caisse de ravitaillement pour véhicule a atterri!";

		// time to reload a new ammo crate
		sleep _reloadtime;

		// we are back in action
		vehicle player vehicleChat "Largage disponible.";
		AW_ammoDrop_O_Medic = nil;
		publicVariable "AW_ammoDrop_O_Medic";
	};