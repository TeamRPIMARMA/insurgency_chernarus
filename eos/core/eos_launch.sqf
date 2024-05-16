HCPresent = if (isNil "Any_HC_present") then {False} else {True};

if ((!isServer && hasInterface) || (HCPresent && isServer)) exitWith{};

private ["_HPpatrols","_HPgroupProbability","_CHgroupArray","_LVgroupArray","_HPgroupArray","_PAgroupArray","_CHgroupSize","_CHGroups","_SVehGroups","_AVgroupSize","_AVehGroups","_LVehGroups","_LVgroupSize","_PAgroupSize","_PApatrols","_HPpatrols","_HPgroupSize"];

RedHot = 0; //activated zones count

_JIPmkr=(_this # 0);

{
	if (getmarkerColor _x isEqualTo "ColorGreen") then {_JIPmkr =_JIPmkr - [_x];};
} forEach _JIPmkr;
if (_JIPmkr isEqualTo []) exitWith {};

_HouseInfantry=(_this # 1);
_HPpatrols=_HouseInfantry # 0;
_HPgroupSize=_HouseInfantry # 1;
_HPgroupProbability=if (count _HouseInfantry > 2) then {_HouseInfantry # 2} else {100};

_infantry=(_this # 2);
_PApatrols=_infantry # 0;
_PAgroupSize=_infantry # 1;
_PAgroupProbability=if (count _infantry > 2) then {_infantry # 2} else {100};

_LVeh=(_this # 3);
_LVehGroups=_LVeh # 0;
_LVgroupSize=_LVeh # 1;
_LVgroupProbability=if (count _LVeh > 2) then {_LVeh # 2} else {100};

_AVgrp=(_this # 4);
_AVehGroups=_AVgrp # 0;
_AVgroupProbability=if (count _AVgrp > 1) then {_AVgrp # 1} else {100};

_SVgrp=(_this # 5);
_SVehGroups=_SVgrp # 0;
_SVgroupProbability=if (count _SVgrp > 1) then {_SVgrp # 1} else {100};

_CHGrp=(_this # 6);
_CHGroups=_CHGrp # 0;
_CHgroupSize=_CHGrp # 1;
_CHgroupProbability=if (count _CHGrp > 2) then {_CHGrp # 2} else {100};

_settings=(_this # 7);

if (_HPgroupProbability > floor random 100) then {
	if (_HPgroupSize==0) then {_HPgroupArray=[1,1]};
	if (_HPgroupSize==1) then {_HPgroupArray=[2,4]};
	if (_HPgroupSize==2) then {_HPgroupArray=[4,8]};
	if (_HPgroupSize==3) then {_HPgroupArray=[8,12]};
	if (_HPgroupSize==4) then {_HPgroupArray=[12,16]};
	if (_HPgroupSize==5) then {_HPgroupArray=[16,20]};
	}else{_HPpatrols=0;_HPgroupArray=[1,1];};

if (_PAgroupProbability > floor random 100) then {
	if (_PAgroupSize==0) then {_PAgroupArray=[1,1]};
	if (_PAgroupSize==1) then {_PAgroupArray=[2,4]};
	if (_PAgroupSize==2) then {_PAgroupArray=[4,8]};
	if (_PAgroupSize==3) then {_PAgroupArray=[8,12]};
	if (_PAgroupSize==4) then {_PAgroupArray=[12,16]};
	if (_PAgroupSize==5) then {_PAgroupArray=[16,20]};
	}else{_PApatrols=0;_PAgroupArray=[1,1];};

if (_LVgroupProbability > floor random 100) then {
	if (_LVgroupSize==0) then {_LVgroupArray=[0,0]};
	if (_LVgroupSize==1) then {_LVgroupArray=[2,4]};
	if (_LVgroupSize==2) then {_LVgroupArray=[4,8]};
	if (_LVgroupSize==3) then {_LVgroupArray=[8,12]};
	if (_LVgroupSize==4) then {_LVgroupArray=[12,16]};
	if (_LVgroupSize==5) then {_LVgroupArray=[16,20]};
}else{_LVehGroups=0;_LVgroupArray=[0,0];};

if !(_AVgroupProbability > floor random 100) then {_AVehGroups=0;};

if !(_SVgroupProbability > floor random 100) then {_SVehGroups=0;};

if (_CHgroupProbability > floor random 100) then {
	if (_CHgroupSize==0) then {_CHgroupArray=[0,0]};
	if (_CHgroupSize==1) then {_CHgroupArray=[2,4]};
	if (_CHgroupSize==2) then {_CHgroupArray=[4,8]};
	if (_CHgroupSize==3) then {_CHgroupArray=[8,12]};
	if (_CHgroupSize==4) then {_CHgroupArray=[12,16]};
	if (_CHgroupSize==5) then {_CHgroupArray=[16,20]};
}else{_CHGroups=0;_CHgroupArray=[0,0]};

{
	_eosMarkers=server getvariable "EOSmarkers";
	if (isnil "_eosMarkers") then {_eosMarkers=[];};
	_eosMarkers pushBack _x;
	server setvariable ["EOSmarkers",_eosMarkers,true];
	null = [_x,[_HPpatrols,_HPgroupArray],[_PApatrols,_PAgroupArray],[_LVehGroups,_LVgroupArray],[_AVehGroups,_SVehGroups,_CHGroups,_CHgroupArray],_settings] execVM "eos\core\eos_core.sqf";
}foreach _JIPmkr;