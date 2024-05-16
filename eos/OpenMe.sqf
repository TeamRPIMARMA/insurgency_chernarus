/* EOS 1.98 by BangaBob
GROUP SIZES
 0 = 1
 1 = 2,4
 2 = 4,8
 3 = 8,12
 4 = 12,16
 5 = 16,20

EXAMPLE CALL - EOS
 null = [["MARKERNAME","MARKERNAME2"],[2,1,70],[0,1],[1,2,30],[2,60],[2],[1,0,10],[1,0,250,WEST]] call EOS_Spawn;
 null=[["M1","M2","M3"],[HOUSE GROUPS,SIZE OF GROUPS,PROBABILITY],[PATROL GROUPS,SIZE OF GROUPS,PROBABILITY],[LIGHT VEHICLES,SIZE OF CARGO,PROBABILITY],[ARMOURED VEHICLES,PROBABILITY], [STATIC VEHICLES,PROBABILITY],[HELICOPTERS,SIZE OF HELICOPTER CARGO,PROBABILITY],[FACTION,MARKERTYPE,DISTANCE,SIDE,HEIGHTLIMIT,DEBUG]] call EOS_Spawn;

EXAMPLE CALL - BASTION
 null = [["BAS_zone_1"],[3,1],[2,1],[2],[0,0],[0,0,EAST,false,false],[10,2,120,TRUE,TRUE]] call Bastion_Spawn;
 null=[["M1","M2","M3"],[PATROL GROUPS,SIZE OF GROUPS],[LIGHT VEHICLES,SIZE OF CARGO],[ARMOURED VEHICLES],[HELICOPTERS,SIZE OF HELICOPTER CARGO],[FACTION,MARKERTYPE,SIDE,HEIGHTLIMIT,DEBUG],[INITIAL PAUSE, NUMBER OF WAVES, DELAY BETWEEN WAVES, INTEGRATE EOS, SHOW HINTS]] call Bastion_Spawn;
*/

params ["_side"];
private _fac1 = 1;//major
private _fac2 = 2;//minor
private _infPb = InfPb;
private _dis = AI_SpawnDis;
private _mecArmPb = MecArmPb;
private _InfAirReinPb = InfAirReinPb;

EOS_Spawn = compile preprocessfilelinenumbers "eos\core\eos_launch.sqf";
Bastion_Spawn=compile preprocessfilelinenumbers "eos\core\b_launch.sqf";
null=[] execVM "eos\core\spawn_fnc.sqf";
if (isServer) then {["updateEOSmkrs","onplayerConnected", {[] execVM "eos\functions\EOS_Markers.sqf";}] call BIS_fnc_addStackedEventHandler;};

VictoryColor="ColorGreen";	// Colour of marker after completion
hostileColor="ColorRed";	// Default colour when enemies active
bastionColor="ColorOrange";	// Colour for bastion marker
EOS_KILLCOUNTER=false;		// Counts killed units

//[HOUSE GROUPS,SIZE OF GROUPS,PROBABILITY],[PATROL GROUPS,SIZE OF GROUPS,PROBABILITY],[LIGHT VEHICLES,SIZE OF CARGO,PROBABILITY],[ARMOURED VEHICLES,PROBABILITY], [STATIC VEHICLES,PROBABILITY],[HELICOPTERS,SIZE OF HELICOPTER CARGO,PROBABILITY],[FACTION,MARKERTYPE,DISTANCE,SIDE,HEIGHTLIMIT,DEBUG]]

// Tisy Military Base
// Infantry markers
null=[["m538"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m544"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m678"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m525"],[1,1,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m670"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m564"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m539"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m536"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m543"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m674"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m810"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m719"],[2,1,_infPb],[2,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m556"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m550"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m561"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m685"],[1,0,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m683"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m579"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m575"],[2,2,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m576"],[2,1,_infPb],[2,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m677"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m838"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m572"],[1,0,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m813"],[2,3,_infPb],[2,3,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m808"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Infantry reinforcement chopper transport
null=[["m676"],[0,0],[0,0],[0,0],[0],[0],[1,5,_InfAirReinPb],[_fac2,0,_dis,_side]] call EOS_Spawn;
//Paired Infantry markers
null=[["m679","m680"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m672","m673"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m681","m682"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m541","m542"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m546","m547"],[1,0,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m568","m569"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m590","m591"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m583","m584"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light Vehicles
null=[["m573"],[0,0],[0,0],[1,3],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Heavy Vehicles
null=[["m570"],[2,2],[0,0],[0,0],[2,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Stary Yar
// Infantry markers
null=[["m700"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m701"],[4,0,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m703"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m704"],[4,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Infantry reinforcement chopper transport
null=[["m879"],[0,0],[0,0],[0,0],[0],[0],[1,5,_InfAirReinPb],[_fac2,0,_dis,_side]] call EOS_Spawn;
null=[["m880"],[0,0],[0,0],[0,0],[0],[0],[1,5,_InfAirReinPb],[_fac2,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Kammensk Military Base
// Infantry markers
null=[["m675"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m684"],[1,0,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m687"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m723"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m724"],[1,0,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m646"],[2,0,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m660"],[2,2,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m657"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m656"],[1,0,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m653"],[1,0,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m717"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m688"],[1,0,_infPb],[0,0],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m713"],[1,0,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m741"],[2,2,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m807"],[2,0,_infPb],[1,5,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m654"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m671"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m669"],[2,1,_infPb],[2,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m710"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m809"],[2,0,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Infantry markers + static weapon
null=[["m647"],[1,0,_infPb],[0,0],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m655"],[0,0],[1,0],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m661"],[1,0,_infPb],[0,0],[2,1],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Belaya Polyana
// Infantry reinforcement chopper transport
null=[["m881"],[0,0],[0,0],[0,0],[0],[0],[1,5,_InfAirReinPb],[_fac2,0,_dis,_side]] call EOS_Spawn;
// Infantry markers
null=[["m442"],[1,1,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m443"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m444"],[4,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m475"],[0,0],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m454"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m462"],[2,1,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m452"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m453"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Infantry markers + static weapon
null=[["m463"],[0,0],[0,0],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Novodmitrovsk
// Infantry markers

null=[["m784"],[0,0],[1,0,_infPb],[0,0],[0],[2],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m783"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m782"],[2,1,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m780"],[3,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m778"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m774"],[3,2,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m775"],[1,0,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m773"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m791"],[0,0],[1,3,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m769"],[2,2,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m764"],[2,1,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m776"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m765"],[1,1,_infPb],[0,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m734"],[1,0,_infPb],[0,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m850"],[1,0,_infPb],[0,0],[0,0],[0,0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m762"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m763"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m771"],[2,1,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m768"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m735"],[1,0,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m342"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m361"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m352"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m341"],[4,0,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m644"],[2,1,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m328"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m643"],[3,2,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m592"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m351"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m565"],[1,0],[1,0,_infPb],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m353"],[1,0,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m552"],[2,0,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m532"],[2,1,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m535"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m760"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m534"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m759"],[2,0,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m766"],[2,0,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m205"],[2,0,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m758"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m649"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m645"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m400"],[3,1,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m648"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m767"],[0,0],[1,0,_infPb],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m206"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m209"],[3,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m208"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m375"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m376"],[2,1,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m380"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m379"],[2,0,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m378"],[3,1,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m432"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m365"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m297"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m802"],[2,1,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m716"],[0,0],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m801"],[2,0,_infPb],[1,0,_infPb],[2,4],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m869"],[0,0],[0,0],[1,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m792"],[1,2,_infPb],[0,0],[1,1],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m740"],[1,0,_infPb],[0,0],[1,1],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m366"],[2,2,_infPb],[0,0],[1,1],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m519"],[0,0],[0,0],[1,1],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m772"],[2,1,_infPb],[1,0,_infPb],[1,1],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Heavy Vehicles
null=[["m833"],[0,0],[0,0],[0,0],[2,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m781"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m779"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m777"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m746"],[0,0],[0,0],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Infantry reinforcement chopper transport
null=[["m533"],[0,0],[0,0],[0,0],[0],[0],[1,5,_InfAirReinPb],[_fac2,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Berezhki
// Infantry markers
null=[["m42"],[0,0],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m43"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m65"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m132"],[0,0],[0,0],[1,5],[0],[2],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Patrol boats invisible markers
null=[["m865"],[0,0],[0,0],[1,3],[0],[0],[0,0],[_fac2,1,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Svetloyarsk
// Infantry markers
null=[["m785"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m872"],[2,1,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m873"],[1,0,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m874"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m796"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m799"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m788"],[2,1,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m790"],[2,1,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m721"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m722"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m800"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m786"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m787"],[2,1,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m794"],[0,0],[1,0],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m789"],[0,0],[0,0],[2,4],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Heavy Vehicles
null=[["m793"],[0,0],[0,0],[0,0],[2,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Patrol boats invisible markers
null=[["m866"],[0,0],[0,0],[1,3],[0],[0],[0,0],[_fac2,1,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
//Olsha
// Infantry markers
null=[["m574"],[1,0,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m540"],[0,0],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m526"],[1,0,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m829"],[0,0],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m529"],[2,1,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m530"],[2,1,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m521"],[0,0],[0,0],[1,1],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m527"],[0,0],[0,0],[1,1],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Cernaya Polana
// Infantry markers
null=[["m821"],[2,1,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m299"],[2,1,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m300"],[0,0],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m301"],[2,0,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m322"],[2,1,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m303"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m304"],[2,1,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m832"],[0,0],[1,1,_infPb],[0,0],[0,0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m306"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m756"],[0,0],[1,2,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m305"],[2,1,_infPb],[1,0,_infPb],[1,2],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Heavy Vehicles
null=[["m302"],[0,0],[0,0],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Airport NE
// Infantry markers
null=[["m531"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m499"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m22"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m37"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m108"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m500"],[1,1,_infPb],[0,0],[1,4],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m61"],[1,0,_infPb],[1,0,_infPb],[1,1],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Infantry reinforcement chopper transport
null=[["m498"],[0,0],[0,0],[0,0],[0,0],[0],[1,5,_InfAirReinPb],[_fac2,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Mont noir
// Infantry markers
null=[["m510"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m497"],[1,2,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m516"],[0,0],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m505"],[1,1,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Krasnostav
// Infantry markers
null=[["m501"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m507"],[0,0],[1,0,_infPb],[0,0],[0],[2],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m508"],[1,1,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m506"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m513"],[2,1,_infPb],[2,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m514"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m845"],[0,0],[1,0,_infPb],[0,0],[0],[2],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m522"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m504"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m515"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m814"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m517"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m509"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Infantry reinforcement chopper transport
null=[["m502"],[0,0],[0,0],[0,0],[0,0],[0],[1,5,_InfAirReinPb],[_fac2,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m503"],[0,0],[0,0],[1,4],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m518"],[0,0],[0,0],[1,4],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Severograd
// Infantry markers
null=[["m852"],[3,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m666"],[2,2,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m668"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m667"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m658"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m640"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m639"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m641"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m642"],[3,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m626"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m627"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m652"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m635"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m662"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m629"],[3,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m637"],[3,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m761"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m729"],[3,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m686"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m659"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m634"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m631"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m632"],[0,0],[1,0,_infPb],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m665"],[0,0],[0,0],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m718"],[1,3,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m689"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m663"],[0,0],[0,0],[1,4],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m636"],[2,1,_infPb],[1,0,_infPb],[1,4],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m806"],[2,0,_infPb],[0,0],[1,3],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Infantry reinforcement chopper transport
null=[["m664"],[0,0],[0,0],[0,0],[0],[0],[1,5,_InfAirReinPb],[_fac2,0,_dis,_side]] call EOS_Spawn;
// Heavy Vehicles
null=[["m628"],[0,0],[0,0],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m638"],[0,0],[0,0],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Château du diable
// Infantry markers
null=[["m633"],[2,1,_infPb],[2,1,_infPb],[0,0],[0],[0],[0,0],[_fac2,0,_dis,_side]] call EOS_Spawn;
null=[["m842"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m804"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m615"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m622"],[0,0],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m623"],[2,1,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m625"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m630"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m577"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m578"],[0,0],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Bashnya
// Infantry markers
null=[["m551"],[6,0,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m553"],[3,2,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m545"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m555"],[2,2,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m560"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m566"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m563"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m549"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m567"],[1,4,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m554"],[1,2,_infPb],[0,0],[1,3],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Novaya Petrovka
// Infantry markers
null=[["m588"],[3,2,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m589"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m598"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m616"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m597"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m805"],[2,1,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m651"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m690"],[2,1,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m695"],[4,2,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m693"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m711"],[3,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m697"],[4,0,_infPb],[2,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m696"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m812"],[1,1,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m694"],[0,0],[0,0],[1,4],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Heavy Vehicles
null=[["m624"],[0,0],[0,0],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m691"],[0,0],[0,0],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Topolniki
// Infantry markers
null=[["m511"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m524"],[1,2,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m256"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m528"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m571"],[2,1,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m369"],[2,1,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m383"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m118"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn; 
null=[["m136"],[0,0],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Infantry reinforcement chopper transport
null=[["m91"],[0,0],[0,0],[0,0],[0],[0],[1,5,_InfAirReinPb],[_fac2,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m92"],[0,0],[0,0],[1,2],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m116"],[0,0],[0,0],[1,3],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Heavy Vehicles
null=[["m512"],[1,1,_infPb],[0,0],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m548"],[0,0],[0,0],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m117"],[0,0],[0,0],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn; 
//*******************************************************************************************************************
// Sinystok
// Infantry markers
null=[["m251"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m254"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Infantry reinforcement chopper transport
null=[["m247"],[0,0],[0,0],[0,0],[0],[0],[1,5,_InfAirReinPb],[_fac2,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m837"],[0,0],[0,0],[1,2],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Turovo
// Infantry markers
null=[["m871"],[0,0],[2,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m797","m798"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m795"],[2,1,_infPb],[1,0,_infPb],[1,2],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Vavilovo
// Infantry markers
null=[["m248"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m537"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m354"],[2,2,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m417"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m430"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m367"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m377"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m313"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m425"],[1,0,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m371"],[0,0],[0,0],[1,4],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m557"],[0,0],[0,0],[1,2],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Heavy Vehicles
null=[["m523"],[0,0],[0,0],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn; 
null=[["m422"],[0,0],[0,0],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn; 
// Infantry reinforcement chopper transport
null=[["m387"],[0,0],[0,0],[0,0],[0],[0],[1,5,_InfAirReinPb],[_fac2,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Airport NW
// Infantry markers
null=[["m269"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m260"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m282"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m286"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m268"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m381","m382"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m384"],[1,3,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m364"],[1,3,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m389"],[1,3,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m418"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m474"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m491"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m293"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m419"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m373"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m370"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m390"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m831"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m263"],[1,0,_infPb],[1,0,_infPb],[1,4],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m287"],[1,0,_infPb],[1,0,_infPb],[1,3],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m407"],[1,0,_infPb],[1,0,_infPb],[1,2],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m391"],[1,0,_infPb],[1,0,_infPb],[1,3],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Infantry reinforcement chopper transport
null=[["m385"],[0,0],[0,0],[0,0],[0],[0],[1,5,_InfAirReinPb],[_fac2,0,_dis,_side]] call EOS_Spawn;
null=[["m420"],[0,0],[0,0],[0,0],[0],[0],[1,5,_InfAirReinPb],[_fac2,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Zabolotye
// Infantry markers
null=[["m698"],[1,2,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m702"],[4,1,_infPb],[2,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m288"],[2,1,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Heavy Vehicles
null=[["m843"],[0,0],[0,0],[0,0],[2,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Krona
// Infantry markers
null=[["m712"],[1,1,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m699"],[1,0,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m705"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m706"],[3,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m803"],[0,0],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m692"],[2,1,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m708","m709"],[2,1,_infPb],[2,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Lopatino
// Infantry markers and Light vehicle
null=[["m558"],[2,1,_infPb],[1,0,_infPb],[1,4],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m292"],[0,0],[0,0],[1,1],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Infantry markers 
null=[["m275"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m559"],[2,1,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m562"],[4,0,_infPb],[2,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m281"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m257"],[2,1,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Infantry markers and Heavy vehicles
null=[["m294"],[2,0,_infPb],[1,0,_infPb],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Infantry markers and static defense
null=[["m285"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Vybor
// Infantry markers
null=[["m296"],[4,0,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m291"],[3,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m289","m290"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m283"],[2,0,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m280"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m270"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m278"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m284"],[0,0],[0,0],[1,4],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Heavy vehicles
null=[["m840"],[0,0],[0,0],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Kabanino
// Infantry markers
null=[["m266"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m271","m272"],[2,1,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m273"],[2,1,_infPb],[2,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m267"],[1,0,_infPb],[0,0],[1,4],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Heavy vehicle
null=[["m274"],[2,0,_infPb],[1,0,_infPb],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Grishino
// Infantry markers
null=[["m388"],[2,2,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m359"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m363"],[4,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m295"],[2,1,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m350"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Infantry markers and static defense
null=[["m820"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m360"],[0,0],[1,0,_infPb],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m336"],[0,0],[1,0,_infPb],[1,4],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Heavy vehicle
null=[["m851"],[1,0,_infPb],[1,0,_infPb],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Khelm
// Infantry markers
null=[["m87","m88"],[4,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m110"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m111"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m112"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m161"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac2,0,_dis,_side]] call EOS_Spawn;
null=[["m174","m175"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Infantry markers and static defense
null=[["m160"],[0,0],[1,0,_infPb],[0,0],[0],[1],[0,0],[_fac2,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m86"],[1,0,_infPb],[1,0,_infPb],[1,4],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Heavy vehicle
null=[["m89"],[0,0],[0,0],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m109"],[1,0,_infPb],[1,0,_infPb],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Port east
// Infantry markers
null=[["m750"],[2,2,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m728"],[4,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m733"],[3,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m738"],[2,2,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m736"],[2,2,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m737"],[4,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m720"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m725"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m726"],[0,0],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m727"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m739"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Infantry markers and static defense
null=[["m707"],[0,0],[1,0,_infPb],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m731"],[0,0],[1,0,_infPb],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m715"],[0,0],[0,0],[1,4],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m732"],[0,0],[0,0],[1,2],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Heavy vehicle
null=[["m770"],[0,0],[0,0],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Patrol boats invisible markers
null=[["m864"],[0,0],[0,0],[1,3],[0],[0],[0,0],[_fac2,1,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Scierie
// Infantry markers
null=[["m23"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m11"],[1,2,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m128"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m129"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m130"],[1,2,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m131"],[1,2,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn; 
null=[["m149"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Berezino north
// Infantry markers
null=[["m85"],[4,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m63"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m64"],[4,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m148"],[4,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m40"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m60"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m62"],[0,0],[1,0,_infPb],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m39"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m59"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m84"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Infantry reinforcement chopper transport
null=[["m41"],[0,0],[0,0],[0,0],[0],[0],[1,5,_InfAirReinPb],[_fac2,0,_dis,_side]] call EOS_Spawn;
// Heavy vehicle
null=[["m38"],[0,0],[0,0],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Berezino
// Infantry markers
null=[["m751"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m755"],[3,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m811"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m742"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m747"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m176"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m748"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m743"],[1,2,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m57"],[0,0],[0,0],[1,4],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m752"],[0,0],[0,0],[1,4],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Heavy vehicle
null=[["m58"],[0,0],[1,0,_infPb],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Dubrovka
// Infantry markers
null=[["m124"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m125"],[0,0],[1,2,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m104"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m830"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m162"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m105"],[1,1,_infPb],[1,2,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m178"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m177"],[3,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m7"],[2,0,_infPb],[0,0],[1,1],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Heavy vehicle
null=[["m145"],[0,0],[0,0],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Gorka
// Infantry markers
null=[["m423"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m520"],[3,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m333"],[3,2,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m334"],[1,2,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m393"],[3,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m818"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m406"],[3,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m335"],[1,1,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m397"],[1,1,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m396"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m339"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m348"],[1,1,_infPb],[1,2,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Infantry markers and static defense
null=[["m327"],[2,0,_infPb],[1,1,_infPb],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m340"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m392"],[2,0,_infPb],[1,0,_infPb],[1,2],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Heavy vehicle
null=[["m349"],[1,1,_infPb],[1,0,_infPb],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Novy sobor
// Infantry markers
null=[["m123"],[1,2,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn; 
null=[["m144"],[1,2,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m824"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m14"],[4,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m28"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Infantry markers and static defense
null=[["m29"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m27"],[0,0],[0,0],[1,2],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Heavy vehicle
null=[["m13"],[0,0],[1,0,_infPb],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Stary sobor
// Infantry markers
null=[["m321"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m261"],[3,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m372"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m404"],[4,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m405"],[1,2,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m312"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m362"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m357"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m358"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Infantry markers and static defense
null=[["m320"],[3,1,_infPb],[1,0,_infPb],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m279"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m374"],[2,0,_infPb],[1,0,_infPb],[1,2],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Heavy vehicle
null=[["m368"],[1,1,_infPb],[0,0],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Pustoschka
// Infantry markers
null=[["m244"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m262"],[1,2,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m276"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m264"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m265"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m252"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m253"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m258"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m259"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m255"],[1,1,_infPb],[0,0],[1,2],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m246"],[1,0,_infPb],[0,0],[1,2],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Infantry markers and static defense
null=[["m245"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m277"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Heavy vehicle
null=[["m243"],[0,0],[0,0],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m249"],[2,1,_infPb],[0,0],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m250"],[1,0,_infPb],[0,0],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Metalurg
// Infantry markers + Infantry reinforcement chopper transport
null=[["m1"],[0,0],[0,0],[0,0],[0],[0],[1,5,_InfAirReinPb],[_fac2,0,_dis,_side]] call EOS_Spawn;
null=[["m142"],[8,0,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac2,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Myshkino
// Infantry markers
null=[["m163"],[4,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m185"],[3,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m135"],[1,0,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m115"],[2,2,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Sosnovka
// Infantry markers
null=[["m74"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m164"],[3,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m73"],[8,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m151"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m133"],[2,1,_infPb],[0,0],[1,2],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Heavy vehicle
null=[["m165"],[0,0],[0,0],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
//Mont vert
// Infantry markers
null=[["m2"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m100"],[0,0],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m173"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m195"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Pogorevka
// Infantry markers
null=[["m184"],[1,2,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m193"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m846"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Infantry markers + Infantry reinforcement chopper transport
null=[["m183"],[0,0],[0,0],[0,0],[0],[0],[1,5,_InfAirReinPb],[_fac2,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
//Rogovo
// Infantry markers
null=[["m182"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m191"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m192"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m200"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Vishnoye
// Infantry markers
null=[["m237"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m240"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m134"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Heavy vehicle
null=[["m877"],[0,0],[0,0],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Nizhnoye
// Infantry markers
null=[["m730"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m744"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m745"],[1,2,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m714"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Patrol boats invisible markers
null=[["m861"],[0,0],[0,0],[1,3],[0],[0],[0,0],[_fac2,1,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Polana
// Infantry markers
null=[["m17"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m32"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m30"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m31"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m53"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m78"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m52"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m15"],[0,0],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m51"],[0,0],[1,2,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Infantry markers and static defense
null=[["m16"],[0,0],[1,0,_infPb],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m77"],[1,0,_infPb],[0,0],[1,2],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Heavy vehicles
null=[["m79"],[1,0,_infPb],[0,0],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Usine Malinovka
// Infantry markers
null=[["m20"],[1,2,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m189"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m35"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m36"],[0,0],[0,0],[1,2],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Orlovets
// Infantry markers
null=[["m5"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m9"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m8"],[2,2,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m54"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m55"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m81"],[1,2,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m80"],[1,2,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Heavy vehicles
null=[["m6"],[0,0],[0,0],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
//Usine @ east 
// Infantry markers
null=[["m754"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m757"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m749"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m753"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Guglovo
null=[["m18"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m19"],[1,1,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m33"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m34"],[0,0],[0,0],[1,2],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
//Shakovka
// Infantry markers
null=[["m122"],[1,1,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m102"],[1,1,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn; 
null=[["m121"],[3,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m157"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Infantry markers and static defense
null=[["m103"],[2,2,_infPb],[1,0,_infPb],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m3"],[0,0],[0,0],[1,2],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
//Dolina
// Infantry markers
null=[["m146"],[3,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m158"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m159"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m147"],[0,0],[0,0],[1,2],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
//Dolina east
// Infantry markers
null=[["m4"],[1,1,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m126"],[1,0,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m127"],[1,0,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m56"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m83"],[0,0],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m82"],[2,1,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Infantry markers and static defense
null=[["m106"],[1,1,_infPb],[1,1,_infPb],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m107"],[1,1,_infPb],[1,1,_infPb],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Solnitchniy
// Infantry markers
null=[["m201"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m202"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m198"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m221"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m226"],[3,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m203"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m199"],[3,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m207"],[1,0,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Infantry markers + Infantry reinforcement chopper transport
null=[["m212"],[0,0],[0,0],[0,0],[0],[0],[1,5,_InfAirReinPb],[_fac2,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m197"],[0,0],[0,0],[1,2],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Patrol boats invisible markers
null=[["m857"],[0,0],[0,0],[1,3],[0],[0],[0,0],[_fac2,1,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
//Msta
// Infantry markers
null=[["m150"],[2,1,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m114"],[3,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m21"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m179"],[1,0,_infPb],[0,0],[1,2],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Staroye
// Infantry markers
null=[["m190"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Infantry markers and static defense
null=[["m181"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m180"],[1,0,_infPb],[0,0],[1,2],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Heavy vehicle
null=[["m204"],[1,1,_infPb],[1,0,_infPb],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Mogilevka
// Infantry markers
null=[["m394"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m817"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m402"],[2,2,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m399"],[2,2,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m849"],[2,2,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m403"],[0,0],[0,0],[1,3],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m398"],[0,0],[0,0],[1,3],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Heavy vehicle
null=[["m395"],[0,0],[0,0],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Infantry markers + Infantry reinforcement chopper transport
null=[["m401"],[0,0],[0,0],[0,0],[0],[0],[1,5,_InfAirReinPb],[_fac2,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
//Zub
// Infantry markers
null=[["m332"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m319"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m854"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m386"],[1,2,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Tulga
// Infantry markers
null=[["m90"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m113"],[1,0,_infPb],[1,2,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Rog
// Infantry markers
null=[["m492"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m493"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m488"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m489"],[0,0],[0,0],[1,3],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Pusta
// Infantry markers
null=[["m451"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m815"],[1,0,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m436"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m429"],[2,0,_infPb],[1,0,_infPb],[1,3],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Kamyshovo
// Infantry markers
null=[["m472"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m485"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m225"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m455"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m456"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m465"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m478"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m471"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Infantry markers + Infantry reinforcement chopper transport
null=[["m464"],[0,0],[0,0],[0,0],[0],[0],[1,5,_InfAirReinPb],[_fac2,0,_dis,_side]] call EOS_Spawn;
// Patrol boats invisible markers
null=[["m860"],[0,0],[0,0],[1,3],[0],[0],[0,0],[_fac2,1,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// îles de skalisty
// Infantry markers
null=[["m844"],[0,0],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m44"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m45"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m215"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m827"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m234"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m494"],[0,0],[0,0],[1,3],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Patrol boats invisible markers
null=[["m862"],[0,0],[0,0],[1,3],[0],[0],[0,0],[_fac2,1,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Elektrozavodsk
// Infantry markers
null=[["m450"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m230"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m223"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m224"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m232"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m233"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m469"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m470"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m461"],[1,2,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m441"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m460"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m477"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m467"],[1,1,_infPb],[0,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m468"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m459"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m439"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m816"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m433"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m434"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m437"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m438"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m457"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m445"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Infantry markers and static defense
null=[["m481"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m476"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m446"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Infantry markers + Infantry reinforcement chopper transport
null=[["m449"],[0,0],[0,0],[0,0],[0],[0],[1,5,_InfAirReinPb],[_fac2,0,_dis,_side]] call EOS_Spawn;
null=[["m487"],[0,0],[0,0],[0,0],[0],[0],[1,5,_InfAirReinPb],[_fac2,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m447"],[0,0],[0,0],[1,3],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m431"],[0,0],[0,0],[1,3],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m458"],[0,0],[0,0],[1,3],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m440"],[0,0],[0,0],[1,3],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Heavy vehicle
null=[["m231"],[0,0],[0,0],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m448"],[0,0],[0,0],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m435"],[0,0],[0,0],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Patrol boats invisible markers
null=[["m859"],[0,0],[0,0],[1,3],[0],[0],[0,0],[_fac2,1,_dis,_side]] call EOS_Spawn;
null=[["m858"],[0,0],[0,0],[1,3],[0],[0],[0,0],[_fac2,1,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Baie Tchyornaya
// Infantry markers
null=[["m847"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m218"],[0,0,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m219"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m236"],[2,2,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m220"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m479"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m235"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m826"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m480"],[0,0],[0,0],[1,3],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Patrol boats invisible markers
null=[["m855"],[0,0],[0,0],[1,3],[0],[0],[0,0],[_fac2,1,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Nadezhdino
// Infantry markers
null=[["m876"],[1,0,_infPb],[1,2,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m213"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m214"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m216"],[1,0,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m217"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m222"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m878"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m228"],[1,0,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m828"],[1,0,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m875"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m227"],[0,0],[0,0],[1,3],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Tchernogorsk
// Infantry markers
null=[["m466"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m307"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m311"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m318"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m309"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m310"],[1,2,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m316"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m317"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m326"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m347"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m338"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m329"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m330"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m323"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m324"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m314"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m315"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m416"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m411"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m412"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m298"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m608"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m617"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m473"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m345"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m356"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m343"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m344"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m414"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m421"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m495"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m428"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m848"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m819"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m331"],[0,0],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m355"],[0,0],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m822"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m426"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m424"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m409"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m408"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m427"],[2,1,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Infantry reinforcement chopper transport
null=[["m580"],[0,0],[0,0],[0,0],[0],[0],[1,5,_InfAirReinPb],[_fac2,0,_dis,_side]] call EOS_Spawn;
null=[["m599"],[0,0],[0,0],[0,0],[0],[0],[1,5,_InfAirReinPb],[_fac2,0,_dis,_side]] call EOS_Spawn;
// Infantry markers and static defense
null=[["m337"],[0,0],[0,0],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m835"],[0,0],[1,1,_infPb],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m308"],[1,1,_infPb],[0,0],[1,3],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m346"],[1,1,_infPb],[0,0],[1,3],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m415"],[1,1,_infPb],[0,0],[1,3],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m496"],[0,0],[0,0],[1,3],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Heavy vehicle
null=[["m325"],[0,0],[0,0],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m650"],[0,0],[0,0],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m486"],[0,0],[0,0],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m413"],[0,0],[0,0],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Patrol boats invisible markers
null=[["m856"],[0,0],[0,0],[1,3],[0],[0],[0,0],[_fac2,1,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Koslovka
// Infantry markers
null=[["m241"],[1,2,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m10"],[1,0,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m239"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m823"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m238"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m242"],[0,0],[0,0],[1,3],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Drozhino
// Infantry markers
null=[["m171"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m839"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Infantry markers and static defense
null=[["m188"],[0,0],[0,0],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Heavy vehicle
null=[["m172"],[0,0],[0,0],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Airport SW
// Infantry markers
null=[["m594"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m603"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m610"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Infantry reinforcement chopper transport
null=[["m618"],[0,0],[0,0],[0,0],[0],[0],[1,5,_InfAirReinPb],[_fac2,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Balota
// Infantry markers
null=[["m593"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m601"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m600"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m609"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Infantry markers and static defense
null=[["m853"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m602"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m581"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m582"],[0,0],[0,0],[1,3],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Heavy vehicle
null=[["m410"],[0,0],[0,0],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Patrol boats invisible markers
null=[["m867"],[0,0],[0,0],[1,3],[0],[0],[0,0],[_fac2,1,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Bor
// Infantry markers
null=[["m483"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m490"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m836"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m482"],[0,0],[0,0],[1,3],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m484"],[0,0],[0,0],[1,3],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Zelenogorsk
// Infantry markers
null=[["m169"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m186"],[2,2,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m143"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m168"],[3,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m72"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m47"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m48"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m152"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn; 
null=[["m153"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn; 
null=[["m140"],[2,1,_infPb],[2,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m120"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m155"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m156"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m98"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn; 
null=[["m825"],[4,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m137"],[2,2,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m138"],[4,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m99"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m119"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m49"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Infantry reinforcement chopper transport
null=[["m71"],[0,0],[0,0],[0,0],[0],[0],[1,5,_InfAirReinPb],[_fac2,0,_dis,_side]] call EOS_Spawn;
// Infantry markers and static defense
null=[["m211"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m167"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m141"],[0,0],[1,1,_infPb],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m154"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m12"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m25"],[2,2,_infPb],[1,0,_infPb],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m187"],[0,0],[0,0],[1,3],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m139"],[2,0,_infPb],[0,0],[1,3],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Heavy vehicle
null=[["m170"],[0,0],[0,0],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Komarovo
// Infantry markers
null=[["m612"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m620"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m619"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m611"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Patrol boats invisible markers
null=[["m868"],[0,0],[0,0],[1,3],[0],[0],[0,0],[_fac2,1,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Kamenka
// Infantry markers
null=[["m75"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m76"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m196"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m101"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn; 
// Infantry markers and static defense
null=[["m26"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[1],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Heavy vehicle
null=[["m50"],[0,0],[0,0],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Patrol boats invisible markers
null=[["m863"],[0,0],[0,0],[1,3],[0],[0],[0,0],[_fac2,1,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Pavlovo
// Infantry markers
null=[["m97"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m70"],[1,0,_infPb],[1,2,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m67"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m66"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Light vehicle
null=[["m69"],[0,0],[0,0],[1,3],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
// Heavy vehicle
null=[["m166"],[0,0],[0,0],[0,0],[1,_mecArmPb],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//*******************************************************************************************************************
// Base military SW
// Infantry markers
null=[["m834"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m587"],[0,0],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m596"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m621"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m604"],[2,1,_infPb],[2,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m605"],[0,0],[1,2,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m614"],[0,0],[1,2,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m94"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m46"],[0,0],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m68"],[1,0,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m95"],[1,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m96"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m24"],[1,2,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m93"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m606"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m607"],[2,2,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m613"],[0,0],[1,2,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m841"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m585"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m586"],[1,3,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m229"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m595"],[2,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m210"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
null=[["m194"],[1,0,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;

// Klen
// Infantry markers
null=[["m870"],[0,0],[1,4,_infPb],[0,0],[0],[0],[0,0],[_fac1,0,_dis,_side]] call EOS_Spawn;
//Persistence and headless client JIP setup
null=[] call BMRINS_fnc_persistence;