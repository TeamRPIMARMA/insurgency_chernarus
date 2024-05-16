//private _player_RPIMA = [RPIMA_OpeDrone_1,RPIMA_OpeDrone_2,RPIMA_OpeDrone_3,RPIMA_Medic_1,RPIMA_Medic_2,RPIMA_Medic_3,RPIMA_Sapeur_1,RPIMA_Sapeur_2,RPIMA_Sapeur_3,TL1,TL2,TL3];

if (side player == west && alive MHQ_1)  then
{
	[  
		 INS_B_Teleport,             
		 "MHQ 1",            
		 "HoldActionsPAA\holdAction_car_ca.paa",   
		 "HoldActionsPAA\holdAction_car_ca.paa",   
		 "player distance _target < 3",        
		 "player distance _target < 3",        
		 {},               
		 {},               
		 {_this call Popo_teleport_MHQ_1_fnc},      
		 {},               
		 [],               
		 12,               
		 9,               
		 false,              
		 false              
	] call BIS_fnc_holdActionAdd;
};

if (side player == west && alive MHQ_2)  then
{
	[  
		 INS_B_Teleport,             
		 "MHQ 2",            
		 "HoldActionsPAA\holdAction_car_ca.paa",   
		 "HoldActionsPAA\holdAction_car_ca.paa",   
		 "player distance _target < 3",        
		 "player distance _target < 3",        
		 {},               
		 {},               
		 {_this call Popo_teleport_MHQ_2_fnc},      
		 {},               
		 [],               
		 12,               
		 8,               
		 false,              
		 false              
	] call BIS_fnc_holdActionAdd;
};
if (side player == west && alive MHQ_3)  then
{
	[  
		 INS_B_Teleport,             
		 "MHQ 3",            
		 "HoldActionsPAA\holdAction_heli_ca.paa",   
		 "HoldActionsPAA\holdAction_heli_ca.paa",    
		 "player distance _target < 3",        
		 "player distance _target < 3",        
		 {},               
		 {},               
		 {_this call Popo_teleport_MHQ_3_fnc},      
		 {},               
		 [],               
		 12,               
		 7,               
		 false,              
		 false              
	] call BIS_fnc_holdActionAdd;
};
if (side player == west && alive RPIMA_RHIB_1)  then
{
	[  
		 INS_B_Teleport,             
		 "RHIB 1",            
		 "HoldActionsPAA\holdAction_car_ca.paa",   
		 "HoldActionsPAA\holdAction_car_ca.paa",   
		 "player distance _target < 3",        
		 "player distance _target < 3",        
		 {},               
		 {},               
		 {_this call Popo_teleport_RHIB_1_fnc},      
		 {},               
		 [],               
		 12,               
		 6,               
		 false,              
		 false              
	] call BIS_fnc_holdActionAdd;
};
if (side player == west && alive RPIMA_RHIB_2)  then
{
	[  
		 INS_B_Teleport,             
		 "RHIB 2",            
		 "HoldActionsPAA\holdAction_car_ca.paa",   
		 "HoldActionsPAA\holdAction_car_ca.paa",   
		 "player distance _target < 3",        
		 "player distance _target < 3",        
		 {},               
		 {},               
		 {_this call Popo_teleport_RHIB_2_fnc},      
		 {},               
		 [],               
		 12,               
		 5,               
		 false,              
		 false              
	] call BIS_fnc_holdActionAdd;
};
/*
if (side player == west)  then 
{ 
 [   
   GarageAction,              
   "Virtuel Garage",             
   "\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_open_ca.paa",    
   "\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_open_ca.paa",    
   "player distance _target < 10",         
   "player distance _target < 10",         
   {},                
   {},                
   {_this call Popo_GarageVirtual_fnc},       
   {},                
   [],                
   1,                
   5,                
   false,               
   false               
 ] call BIS_fnc_holdActionAdd; 
};
*/
/*
if (side player == west && alive RPIMA_Pickup_1)  then
{
	[  
		 INS_B_Teleport,             
		 "Tout-terrain",            
		 "HoldActionsPAA\holdAction_car_ca.paa",   
		 "HoldActionsPAA\holdAction_car_ca.paa",   
		 "player distance _target < 3",        
		 "player distance _target < 3",        
		 {},               
		 {},               
		 {_this call Popo_teleport_RPIMA_Pickup_1_fnc},      
		 {},               
		 [],               
		 12,               
		 4,               
		 false,              
		 false              
	] call BIS_fnc_holdActionAdd;
};
/*
if (alive Hostage1)  then
{
	[  
		Hostage1,             
		"Escorter",            
		"HoldActionsPAA\holdAction_run_ca.paa",   
		"HoldActionsPAA\holdAction_run_ca.paa",   
		"player distance _target < 3",        
		"player distance _target < 3",        
		{},               
		{},               
		{_this call Popo_Follow_Hostage1_fnc},      
		{},               
		[],               
		3,               
		6,               
		false,              
		false              
	] call BIS_fnc_holdActionAdd;
};

if (alive Hostage1)  then
{
	[  
		Hostage1,             
		"Arrêter l'escort",            
		"A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa",   
		"A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa",   
		"player distance _target < 6",        
		"player distance _target < 6",        
		{},               
		{},               
		{_this call Popo_Detach_Hostage1_fnc},      
		{},               
		[],               
		1,               
		5,               
		false,              
		false              
	] call BIS_fnc_holdActionAdd;
};

if (side player == west && alive AmmoCachePlayer_Skalisty)  then
{
	[  
		 INS_B_Teleport,             
		 "Aller à Skalisty",            
		 "HoldActionsPAA\holdAction_car_ca.paa",   
		 "HoldActionsPAA\holdAction_car_ca.paa",   
		 "player distance _target < 3",        
		 "player distance _target < 3",        
		 {},               
		 {},               
		 {_this call Popo_teleport_AmmoCachePlayer_Skalisty_fnc},      
		 {},               
		 [],               
		 12,               
		 4,               
		 false,              
		 false              
	] call BIS_fnc_holdActionAdd;
};
*/
/*
if (side player == west && alive INS_HVT_Haut_Grader)  then
{
	[  
		 INS_HVT_Haut_Grader,             
		 "Interroger",            
		 "\a3\missions_f_oldman\data\img\holdactions\holdAction_talk_ca.paa",   
		 "\a3\missions_f_oldman\data\img\holdactions\holdAction_talk_ca.paa",   
		 "player distance _target < 2",        
		 "player distance _target < 2",        
		 {playSound3D [getMissionPath "Sound\Vladimir_Putain.ogg", INS_HVT_Haut_Grader,true,INS_HVT_Haut_Grader modelToWorld [0,0,0],1,1,50];[west, "Base"] sideChat "Je vous ai mis sur votre carte les emplacements des défences anti-airs, par compte pour les radars ils sont sans cesse déplacés";},               
		 {},               
		 {_this execVM "scripts\RPIMA_active_marker_objectif.sqf"},      
		 {},               
		 [],               
		 6,               
		 4,               
		 true,              
		 false              
	] call BIS_fnc_holdActionAdd;
};
*/
//Addaction for OPFOR
//Addaction teleport
/*
if (side player == east && alive AmmoCachePlayer_Skalisty) then
{

	[  
		INS_E_HQ,             
		"Aller à Skalisty",            
		"HoldActionsPAA\holdAction_map_ca.paa",   
		"HoldActionsPAA\holdAction_map_ca.paa", 
		"player distance _target < 8",        
		"player distance _target < 8",        
		{},               
		{},               
		{_this call Popo_teleport_AmmoCachePlayer_Skalisty_fnc},    
		{},               
		[],               
		12,               
		8,               
		false,              
		false              
	] call BIS_fnc_holdActionAdd;
	
};
*/
if (side player == east && alive Opfor_MHQ) then
{	
	[  
		INS_E_HQ,             
		"MHQ",            
		"HoldActionsPAA\holdAction_car_ca.paa",   
		"HoldActionsPAA\holdAction_car_ca.paa",
		"player distance _target < 8",        
		"player distance _target < 8",         
		{},               
		{},               
		{_this call Popo_teleport_Opfor_MHQ_fnc},    
		{},               
		[],               
		12,               
		9,               
		false,              
		false              
	] call BIS_fnc_holdActionAdd;
};

if (side player == east) then
{
	[  
		INS_E_HQ,             
		"Défendre cache d'arme",            
		"HoldActionsPAA\holdAction_car_ca.paa",   
		"HoldActionsPAA\holdAction_car_ca.paa",
		"player distance _target < 8",        
		"player distance _target < 8",         
		{},               
		{},               
		{_this call Popo_teleport_Ammocache_teleport_OPFORPlayer_fnc},    
		{},               
		[],               
		12,               
		8,               
		false,              
		false              
	] call BIS_fnc_holdActionAdd;
};

////Script ajout d'un timer au respawn manuel
[] execVM "scripts\RespawnTimer.sqf";