// INFANTRY SKILL
_InfskillSet = [
0.30, // aimingAccuracy
0.15, // aimingShake
0.5, // aimingSpeed
0.8, // spotDistance
0.8, // spotTime
0.9, // courage
0.9, // reloadSpeed
1, // commanding
1 // general
];

// ARMOUR SKILL
_ArmSkillSet = [
0.60, // aimingAccuracy
0.30, // aimingShake
0.5, // aimingSpeed
1, // spotDistance
0.5, // spotTime
0.9, // courage
0.7, // reloadSpeed
1, // commanding
1  // general
];

// LIGHT VEHICLE skill
_LigSkillSet = [
0.40, // aimingAccuracy
0.30, // aimingShake
0.5, // aimingSpeed
0.6, // spotDistance
0.6, // spotTime
1, // courage
0.7, // reloadSpeed
1, // commanding
1  // general
];

// HELICOPTER SKILL
_AIRskillSet = [
0.70, // aimingAccuracy
0.60, // aimingShake
0.8, // aimingSpeed
1, // spotDistance
0.9, // spotTime
1, // courage
0.8, // reloadSpeed
1, // commanding
1  // general
];

// STATIC SKILL
_STAskillSet = [
0.40, // aimingAccuracy
0.70, // aimingShake
0.8, // aimingSpeed
0.6, // spotDistance
0.6, // spotTime
0.5, // courage
0.8, // reloadSpeed
1, // commanding
1  // general
];

server setvariable ["INFskill",_InfskillSet];
server setvariable ["ARMskill",_ArmSkillSet];
server setvariable ["LIGskill",_LigSkillSet];
server setvariable ["AIRskill",_AIRskillSet];
server setvariable ["STAskill",_STAskillSet];