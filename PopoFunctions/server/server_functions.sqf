POPO_fnc_SkillSet = {
	params ["_unit","_skillset"];
	_unit = _x;
	{
		_skillvalue = (_skillset select _forEachIndex) + (random 0.2) - (random 0.2);
		_unit setSkill [_x,_skillvalue];
	} forEach ['aimingAccuracy','aimingShake','aimingSpeed','spotDistance','spotTime','courage','reloadSpeed','commanding','general'];
};