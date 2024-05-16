private ["_Blu4m1", "_Blu4m2","_Blu4m3","_Blu4s1","_Blu4s2","_Blu4s3","_Blu4o1","_Blu4o2","_Blu4o3","_Op4m1","_Op4s1","_Op4o1"];

// Joueur BLUFOR
_Blu4m1 = RPIMA_Medic_1;
_Blu4m2 = RPIMA_Medic_2;
_Blu4m3 = RPIMA_Medic_3;

_Blu4s1 = RPIMA_Sapeur_1;
_Blu4s2 = RPIMA_Sapeur_2;
_Blu4s3 = RPIMA_Sapeur_3;

_Blu4o1 = RPIMA_OpeDrone_1;
_Blu4o2 = RPIMA_OpeDrone_2;
_Blu4o3 = RPIMA_OpeDrone_3;

//Joueur OPFOR
_Op4m1 = INS_Medic_1;
_Op4s1 = INS_Sapeur_1;
_Op4o1 = INS_OpeDro_1;

// BLUFOR Addaction paradrop 
if (/*hasInterface && not isServer && */alive RPIMA_Medic_1) then 
{
	[  
		 _Blu4m1,             
		 "Largage de munitions",            
		 "HoldActionsPAA\holdAction_container_ca.paa",   
		 "HoldActionsPAA\holdAction_container_ca.paa",     
		 "player distance _target < 1",        
		 "player distance _target < 1",        
		 {},               
		 {},               
		 {_this execVM "scripts\Drop_ammobox.sqf"},      
		 {},               
		 [],               
		 6,               
		 0,               
		 false,              
		 false              
	] call BIS_fnc_holdActionAdd;
};
if (/*hasInterface && not isServer && */alive RPIMA_Medic_2) then 
{
	[  
		 _Blu4m2,             
		 "Largage de munitions",            
		 "HoldActionsPAA\holdAction_container_ca.paa",   
		 "HoldActionsPAA\holdAction_container_ca.paa", 
		 "player distance _target < 1",        
		 "player distance _target < 1",        
		 {},               
		 {},               
		 {_this execVM "scripts\Drop_ammobox.sqf"},      
		 {},               
		 [],               
		 6,               
		 0,               
		 false,              
		 false              
	] call BIS_fnc_holdActionAdd;
};
if (/*hasInterface && not isServer && */alive RPIMA_Medic_3) then 
{
	[  
		 _Blu4m3,             
		 "Largage de munitions",            
		 "HoldActionsPAA\holdAction_container_ca.paa",   
		 "HoldActionsPAA\holdAction_container_ca.paa",   
		 "player distance _target < 1",        
		 "player distance _target < 1",        
		 {},               
		 {},               
		 {_this execVM "scripts\Drop_ammobox.sqf"},      
		 {},               
		 [],               
		 6,               
		 0,               
		 false,              
		 false              
	] call BIS_fnc_holdActionAdd;
};
if (hasInterface && not isServer && alive RPIMA_Sapeur_1) then
{
	[  
		 _Blu4s1,             
		 "Largage de ravitellement",            
		 "HoldActionsPAA\holdAction_container_ca.paa",   
		 "HoldActionsPAA\holdAction_container_ca.paa",   
		 "player distance _target < 1",        
		 "player distance _target < 1",        
		 {},               
		 {},               
		 {_this execVM "scripts\Drop_vehiclebox.sqf"},      
		 {},               
		 [],               
		 6,               
		 0,               
		 true,              
		 false              
	] call BIS_fnc_holdActionAdd;
};
if (hasInterface && not isServer && alive RPIMA_Sapeur_2) then
{
	[  
		 _Blu4s2,             
		 "Largage de ravitellement",            
		 "HoldActionsPAA\holdAction_container_ca.paa",   
		 "HoldActionsPAA\holdAction_container_ca.paa", 
		 "player distance _target < 1",        
		 "player distance _target < 1",        
		 {},               
		 {},               
		 {_this execVM "scripts\Drop_vehiclebox.sqf"},      
		 {},               
		 [],               
		 6,               
		 0,               
		 false,              
		 false              
	] call BIS_fnc_holdActionAdd;
};
if (hasInterface && not isServer && alive RPIMA_Sapeur_3) then
{
	[  
		 _Blu4s3,             
		 "Largage de ravitellement",            
		 "HoldActionsPAA\holdAction_container_ca.paa",   
		 "HoldActionsPAA\holdAction_container_ca.paa",  
		 "player distance _target < 1",        
		 "player distance _target < 1",        
		 {},               
		 {},               
		 {_this execVM "scripts\Drop_vehiclebox.sqf"},      
		 {},               
		 [],               
		 6,               
		 0,               
		 false,              
		 false              
	] call BIS_fnc_holdActionAdd;
};
if (hasInterface && not isServer && alive RPIMA_OpeDrone_1) then
{
	[  
		 _Blu4o1,             
		 "Largage UGV",            
		 "HoldActionsPAA\holdAction_container_ca.paa",   
		 "HoldActionsPAA\holdAction_container_ca.paa",   
		 "player distance _target < 1",        
		 "player distance _target < 1",        
		 {},               
		 {},               
		 {_this call JIG_UGVdrop_Blu4_fnc},      
		 {},               
		 [],               
		 6,               
		 0,               
		 false,              
		 false              
	] call BIS_fnc_holdActionAdd;
};
if (hasInterface && not isServer && alive RPIMA_OpeDrone_2) then
{
	[  
		 _Blu4o2,             
		 "Largage UGV",            
		 "HoldActionsPAA\holdAction_container_ca.paa",   
		 "HoldActionsPAA\holdAction_container_ca.paa",   
		 "player distance _target < 1",        
		 "player distance _target < 1",        
		 {},               
		 {},               
		 {_this call JIG_UGVdrop_Blu4_fnc},      
		 {},               
		 [],               
		 6,               
		 0,               
		 false,              
		 false              
	] call BIS_fnc_holdActionAdd;
};
if (hasInterface && not isServer && alive RPIMA_OpeDrone_3) then 
{
	[  
		 _Blu4o3,             
		 "Largage UGV",            
		 "HoldActionsPAA\holdAction_container_ca.paa",   
		 "HoldActionsPAA\holdAction_container_ca.paa",  
		 "player distance _target < 1",        
		 "player distance _target < 1",        
		 {},               
		 {},               
		 {_this call JIG_UGVdrop_Blu4_fnc},      
		 {},               
		 [],               
		 6,               
		 0,               
		 false,              
		 false              
	] call BIS_fnc_holdActionAdd;
};
// OPFOR addaction paradrop
if (hasInterface && not isServer && alive INS_Medic_1) then
{
	[  
		 _Op4m1,             
		 "Largage de munitions",            
		 "HoldActionsPAA\holdAction_container_ca.paa",   
		 "HoldActionsPAA\holdAction_container_ca.paa",     
		 "player distance _target < 1",        
		 "player distance _target < 1",        
		 {},               
		 {},               
		 {_this execVM "scripts\Drop_ammobox_OPFOR.sqf"},      
		 {},               
		 [],               
		 6,               
		 0,               
		 false,              
		 false              
	] call BIS_fnc_holdActionAdd;
};
if (hasInterface && not isServer && alive INS_Sapeur_1) then
{
	[  
		 _Op4s1,             
		 "Largage de ravitellement",            
		 "HoldActionsPAA\holdAction_container_ca.paa",   
		 "HoldActionsPAA\holdAction_container_ca.paa",   
		 "player distance _target < 1",        
		 "player distance _target < 1",        
		 {},               
		 {},               
		 {_this execVM "scripts\Drop_vehiclebox_OPFOR.sqf"},      
		 {},               
		 [],               
		 6,               
		 0,               
		 false,              
		 false              
	] call BIS_fnc_holdActionAdd;
};
if (hasInterface && not isServer && alive INS_OpeDro_1) then
{
	[  
		 _Op4o1,             
		 "Largage UGV",            
		 "HoldActionsPAA\holdAction_container_ca.paa",   
		 "HoldActionsPAA\holdAction_container_ca.paa",  
		 "player distance _target < 1",        
		 "player distance _target < 1",        
		 {},               
		 {},               
		 {_this call JIG_UGVdrop_Op4_fnc},      
		 {},               
		 [],               
		 6,               
		 0,               
		 false,              
		 false              
	] call BIS_fnc_holdActionAdd;
};