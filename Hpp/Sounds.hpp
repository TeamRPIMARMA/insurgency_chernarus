class CfgSounds
{
	sounds[] = {NoSound,cantDo,Vent,Vent2,Para,shout,introfx,siren,HighVoltage,boo,allahuakbar,Prout,chantmosquee,furnal,burned,03,01,02,04,05,flames,foc_initial_2,unit_fire,SonDetachHostage};
	class NoSound {name="NoSound";sound[]={"", 0, 1};titles[] = {};};
//JW Custom CAS	
	class cantDo {name="cantDo";sound[]={"JWC_CASFS\cantDo.ogg", 1.0, 1.0};titles[] = {};};
//ATM Airdrop
	class Vent {name="Vent";sound[]={ATM_airdrop\data\Vent.ogg, db-11, 1.0};titles[] = {};};
	class Vent2 {name="Vent2";sound[]={ATM_airdrop\data\Vent2.ogg, db-11, 1.0};titles[] = {};};
	class Para {name="Para";sound[]={ATM_airdrop\data\parachute.ogg, db-11, 1.0};titles[] = {};};
//Suicide Bomber
	class shout {name="shout";sound[]={"Sound\shout.ogg", 4, 1, 100};titles[] = {};};
//RPIMA Sounds
	class allahuakbar {name="allahuakbar";sound[]={"Sound\allahuakbar.ogg", 4, 1, 100};titles[] = {};};
//Jig's Sounds
	class introfx {name="introfx";sound[]={"Sound\introfx.ogg", db-10, 1.0};titles[] = {};};
//RPIMA Sounds
	class sirenAncienne {name="sirenAncienne";sound[]={"Sound\sirenAncienne.ogg", db+100, 1.0,900};titles[] = {};};
	class siren {name="siren";sound[]={"Sound\siren.ogg", db+100, 1.0,900};titles[] = {};};	
	class HighVoltage {name="HighVoltage";sound[]={"Sound\HighVoltage.ogg", db+19, 1.0,900};titles[] = {};};
	class boo {name="boo";sound[]={"Sound\boo.ogg", db+3, 1.0};titles[] = {};};
//RPIMA Sounds
	class Prout {name="Prout";sound[]={"Sound\Prout.ogg", db+19, 1.0,900};titles[] = {};};
	class chantmosquee {name="chantmosquee";sound[]={"Sound\chantmosquee.ogg", db+18, 1.0,900};titles[] = {};};
	class SonDetachHostage {name="SonDetachHostage";sound[]={"Sound\SonDetachHostage.ogg", db+18, 1.0,900};titles[] = {};};
//Sounds Script Fire
/*
	class furnal {name = "furnal";sound[] = {"Sound\furnal.ogg", db+5, 1};titles[] = {1, ""};};
	class burned {name = "burned";sound[] = {"Sound\burned.ogg", db+3, 1};titles[] = {1, ""};};
	class 03 {name = "03";sound[] = {"Sound\03.ogg", db+23, 1};titles[] = {1, ""};};
	class 01 {name = "01";sound[] = {"Sound\01.ogg", db+17, 1};titles[] = {1, ""};};		
	class 02 {name = "02";sound[] = {"Sound\02.ogg", db+22, 1};titles[] = {1, ""};};	
	class 04 {name = "04";sound[] = {"Sound\04.ogg", db+17, 1};titles[] = {1, ""};};
	class 05 {name = "05";sound[] = {"Sound\05.ogg", db+25, 1};titles[] = {1, ""};};
	class flames {name = "flames";sound[] = {"Sound\flames.ogg", db+7, 1};titles[] = {1, ""};};
	class foc_initial_2 {name = "foc_initial_2";sound[] = {"Sound\foc_initial_2.ogg", db+10, 1};titles[] = {1, ""};};
	class unit_fire {name = "unit_fire";sound[] = {"Sound\unit_fire.ogg", db+2, 1};titles[] = {1,""};};
*/
};