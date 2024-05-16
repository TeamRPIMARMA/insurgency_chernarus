// init variable
/*
InfskillSet = [
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
ArmSkillSet = [
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
LigSkillSet = [
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
*/
// choisi une unité au hasard
Popo_Reinforcement_Armor = ["rhs_bmd4ma_vdv","rhs_bmd1r","rhs_bmd2m","rhs_bmp2d_vdv","rhs_bmp3_late_msv","rhs_t72bd_tv","rhs_t72be_tv","rhs_t80uk","rhs_t90sab_tv"] call BIS_fnc_selectRandom;
// choisi un marqueur au hasard
//Popo_Reinforcement_Armor_Spawn_Marker = ["m596","m538","m661"] call BIS_fnc_selectRandom;

// choisi une unité au hasard
Popo_Reinforcement_Light = ["rhs_btr60_msv","rhs_btr70_msv","rhs_btr80_msv","rhs_btr80a_msv","rhs_tigr_sts_msv","RHS_Ural_Zu23_MSV_01","rhs_gaz66_zu23_msv"] call BIS_fnc_selectRandom;
// choisi un marqueur au hasard
//Popo_Reinforcement_Light_Spawn_Marker = ["m596","m661","m538"] call BIS_fnc_selectRandom;

// Choisi un prototype au hasard
Popo_Reinforcement_Prototype = ["O_T_APC_Tracked_02_30mm_lxWS","O_T_MBT_04_command_F"] call BIS_fnc_selectRandom;
// choisi un marqueur au hasard
//Popo_Reinforcement_Prototype_Spawn_Marker = ["m596","m661","m538"] call BIS_fnc_selectRandom;

//Crew_russian = ["rhs_msv_emr_combatcrew","rhs_msv_emr_armoredcrew","rhs_msv_emr_crew_commander"];