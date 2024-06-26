/* == TASKMASTER ===============================================================================

  Version 0.44
Author: Shuko (shuko@quakenet, miika@miikajarvinen.fi)
  Contributors: Alwarren, cuel, Fat_Lurch, galzohar, Levrex, zuff
Forum: http://forums.bistudio.com/showthread.php?160974-SHK_Taskmaster

Slightly optimized by Jigsor.
Documentation on implementation can be found here:
http://arma3.de/include.php?path=download&contentid=309
Original version with documentation can be found here:
http://www.armaholic.com/page.php?id=21970
*/
DEBUG = false;
/* == COMMON =================================================================================== */
SHK_Taskmaster_initDone = false;
SHK_Taskmaster_add = {
	/*	Take a task data array, apply default params if needed, save to the task list. Send to clients.
		In: array	["Name","Title","Desc",[Marker],"State",Destination]
		Out:
	*/
	if isserver then {
		private ["_name","_short","_long","_cond","_marker","_state","_dest"];
		_name = _this select 0;
		_short = _this select 1;
		_long = _this select 2;
		if (count _this > 3) then { _cond = _this select 3 } else { _cond = true };
		if (count _this > 4) then { _marker = _this select 4 } else { _marker = [] };
		if (count _this > 5) then { _state = _this select 5 } else { _state = "created" };
		if (count _this > 6) then { _dest = _this select 6 } else { _dest = 0 };
		SHK_Taskmaster_Tasks set [count SHK_Taskmaster_Tasks, [_name,_short,_long,_cond,_marker,_state,_dest]];
		publicvariable "SHK_Taskmaster_Tasks";
		/*
		Update for host of the non-dedicated server.
		*/
		if (!isdedicated && SHK_Taskmaster_initDone) then {
			SHK_Taskmaster_Tasks spawn SHK_Taskmaster_handleEvent;
		};
	};
};
SHK_Taskmaster_addNote = {
	/*	Creates a briefing note.
		In: array	["Title","TextBody",Condition]
		Out:
	*/
	private "_cond";
	if (count _this > 2) then { _cond = _this select 2 } else { _cond = true };
	{
		if ( [_x,_cond] call SHK_Taskmaster_checkCond ) then {
			_x creatediaryrecord ["Diary",[_this select 0,_this select 1]];
			if (time > 10) then{ hintsilent "Diary note added." };
		};
	} foreach  (if ismultiplayer then {playableunits} else {switchableunits});
};
SHK_Taskmaster_addTask = {
	/*   Creates the given task for each playableunit and saves the handles.
		Adds a task array with name, state and handles to the local task list.
		If marker exists, it will be shown or hidden depending if the unit has the task.
		In: array	["Name","Title","Desc",[Marker],"State",Destination]
	*/

	private ["_handle","_handles","_name","_state","_marker","_dest"];
	_handles = [];
	_name = _this select 0;
	_marker = _this select 4;
	_state = _this select 5;
	_dest = _this select 6;
	if DEBUG then { diag_log format ["SHK_Taskmaster> addTask: %1, %2, %3, %4",_name,_marker,_state,_dest]};
	{
		if ( [_x,(_this select 3)] call SHK_Taskmaster_checkCond ) then {
			_handle = _x createsimpletask [_name];
			_handle setsimpletaskdescription [(_this select 2),(_this select 1),""];
			_handle settaskstate _state;

			if (_state == "assigned") then {
				_x setcurrenttask _handle;
			};
			if (_dest isEqualType ObjNull) then { _handle setsimpletasktarget [_dest,true] };
			if (_dest isEqualType "") then { _handle setsimpletaskdestination (markerPos _dest) };
			if (_dest isEqualType []) then { _handle setsimpletaskdestination _dest };

			_handles set [count _handles,_handle];

			if (_x == player) then {
				if (SHK_Taskmaster_showHints) then { [_handle,_state] call SHK_Taskmaster_showHint };

				if (count _marker > 0) then {
					if !(_state in ["succeeded","failed","canceled"]) then {
						if ((_marker select 0) isEqualType "") then {
							_marker = [_marker];
						};
						private ["_m","_type","_color","_txt","_shape","_size"];
						{
							_m = createmarkerlocal [(_x select 0),(_x select 1)];

							_type = "selector_selectedMission";
							if (count _x > 2) then {
								private _tmp = (_x select 2);
								if (_tmp != "") then {
									_type = _tmp;
								};
							};
							_m setmarkertypelocal _type;

							_color = "ColorRed";
							if (count _x > 3) then {
								private	_tmp = (_x select 3);
								if (_tmp != "") then {
									_color = _tmp;
								};
							};
							_m setmarkercolorlocal _color;

							_txt = "";
							if (count _x > 4) then {
								private _tmp = (_x select 4);
								if (_tmp != "") then {
									_txt = _tmp;
								};
							};
							_m setmarkertextlocal _txt;

							_shape = "ICON";
							if (count _x > 5) then {
								private _tmp = (_x select 5);
								if (_tmp != "") then {
									_shape = _tmp;
								};
							};
							_m setmarkershapelocal _shape;

							_size = [1,1];
							if (count _x > 6) then {
								private _tmp = (_x select 6);
								if (_tmp isEqualType 0) then {
									_tmp = [_tmp,_tmp];
								};
								if !(_tmp isEqualTo [1,1]) then {
									_size = _tmp;
								};
							};
							_m setmarkersizelocal _size;

						} foreach _marker;
					};
				};
			};
		};
	} foreach (if ismultiplayer then {playableunits} else {switchableunits});
	SHK_Taskmaster_TasksLocal set [count SHK_Taskmaster_TasksLocal,[_name,_state,_handles]];
};
SHK_Taskmaster_areCompleted = {
	/*   Checks if tasks are completed.
		In: array of strings	Task names
		Out: boolean
	*/
	private _b = false;
	_b = _this call SHK_Taskmaster_isCompleted;
	_b;
};
SHK_Taskmaster_assign = {
	/*   Changes task's state to assigned.
		In: string	"Name"
		Out:
	*/
	if isserver then {
		private "_task";
		for "_i" from 0 to (count SHK_Taskmaster_Tasks - 1) do {
			if (_this == ((SHK_Taskmaster_Tasks select _i) select 0)) then {
				_task =+ SHK_Taskmaster_Tasks select _i;
				_task set [5,"assigned"];
				SHK_Taskmaster_Tasks set [_i,_task];
			};
		};
		publicvariable "SHK_Taskmaster_Tasks";
		/*
		Update for host of the non-dedicated server.
		*/
		if (!isdedicated && SHK_Taskmaster_initDone) then {
			SHK_Taskmaster_Tasks spawn SHK_Taskmaster_handleEvent;
		};
	};
};
SHK_Taskmaster_checkCond = {
	/*	Checks if given unit fulfills the requirement.
		In: array	[Unit,Condition]
		Out: boolean
	*/
	params ["_unit","_cond"];

	if (!isNil "_cond") then {
		if DEBUG then { diag_log format ["SHK_Taskmaster> typename condition: %1",typename _cond]};
		switch (typename _cond) do {
			case (typename grpNull): { (_unit in (units _cond)) };
			case (typename objNull): { _unit == _cond };
			case (typename sideUnknown):    { (side _unit == _cond) };
			case (typename true):    { _cond };
			case (typename []):      { (_unit in _cond) };
			case (typename ""): {
				if (_cond call SHK_Taskmaster_isFaction) then {
					(faction _unit == _cond)
				} else {
					(call compile format ["%1",_cond])
				};
			};
			default { false };
		};
	} else { false };
};
SHK_Taskmaster_getAssigned = {
	/*	Returns list of tasks which have "assigned" as their state.
		In:
		Out: array	["TaskName","TaskName"]
	*/
	private "_l";
	_l = [];
	{
		if ((_x select 5) == "assigned") then {
			_l set [count _l,(_x select 0)];
		};
	} foreach SHK_Taskmaster_Tasks;
	_l;
};
SHK_Taskmaster_getState = {
	/*	Returns state of the given task.
		In: string	"Name"
		Out: string	"State"
	*/
	private "_s";
	{
		if (_this == (_x select 0)) exitwith {
			_s = (_x select 5);
		};
	} foreach SHK_Taskmaster_Tasks;
	_s;
};
SHK_Taskmaster_handleEvent = {
	/*	Takes the pubvar'd task array and determines if a task needs to be added or updated.
		In: array	SHK_Taskmaster_Tasks from pubvar eventhandler
		Out:
	*/
	waituntil {sleep 3; alive player && {(missionNameSpace getVariable "BMR_regSide") isEqualTo side player}};
	private "_name";
	{
		_name = _x select 0;
		if (_name call SHK_Taskmaster_hasTaskLocal) then {
			if ([_name,(_x select 5)] call SHK_Taskmaster_hasStateChanged) then {
				if DEBUG then { diag_log format ["SHK_Taskmaster> handleEvent calling updateTask: %1",_name]};
				_x call SHK_Taskmaster_updateTask;
			};
		} else {
			if DEBUG then { diag_log format ["SHK_Taskmaster> handleEvent calling addTask: %1",_name]};
			_x call SHK_Taskmaster_addTask;
		};
	} foreach _this;
};
SHK_Taskmaster_hasState = {
	/*	Checks if given task has a specific state.
		In: array	["Name","State"]
		Out: boolean
	*/
	private _b = false;
	{
		if ((_this select  0) == (_x select 0)) then {
			if (((_this select 0) call SHK_Taskmaster_getState) == (_this select 1)) then {
				_b = true;
			};
		};
	} foreach SHK_Taskmaster_Tasks;
	_b;
};
SHK_Taskmaster_hasStateChanged = {
	/*	Checks if the task state of the given task has changed.
		In: array	["TaskName","TaskState"]
		Out: boolean
	*/
	private _b = false;
	{
		if ((_this select 0) == (_x select 0)) then {
			if ((_this select 1) != (_x select 1)) exitwith {
				_b = true;
			};
		};
	} foreach SHK_Taskmaster_TasksLocal;
	_b;
};
SHK_Taskmaster_hasTask = {
	/*	Checks if task with given name already exists.
		In: string	Task name
		Out: boolean
	*/
	private _b = false;
	{
		if (_this == (_x select 0)) exitwith { _b = true };
	} foreach SHK_Taskmaster_Tasks;
	_b;
};
SHK_Taskmaster_hasTaskLocal = {
	/*   Checks if task with given name already exists.
		In: string	Task name
		Out: boolean
	*/
	private _b = false;
	{
		if (_this == (_x select 0)) exitwith { _b = true };
	} foreach SHK_Taskmaster_TasksLocal;
	_b;
};
SHK_Taskmaster_isCompleted = {
	/*	Checks if task(s) are completed.
		In: string				Task name
		In: array of strings	Task names
		Out: boolean
	*/
	private ["_b","_t","_i","_foreachIndex"];
	_b = false;
	if (_this isEqualType "") then {
		_this = [_this];
	};

	{
		_t = _x;
		_i = _foreachIndex;
		{
			if (_t == (_x select 0)) then {
				if ((_x select 5) in ["succeeded","failed","canceled"]) then {
					_this set [_i,true];
				} else {
					_this set [_i,false]
				};
			};
		} foreach SHK_Taskmaster_Tasks;
	} foreach _this;

	if ({_x} count _this == count _this) then {
		_b = true;
	};

	_b;
};
SHK_Taskmaster_isFaction = {
	/* Checks if a string is a valid BIS or an addon faction
	In: string	Faction name
	Out: boolean
	*/
	private ["_cond", "_cfg", "_result"];
	_cond = _this;
	_cfg = configFile >> "cfgFactionClasses";
	_result = false;
	for "_i" from 0 to (count _cfg)-1 do {
		if (configName (_cfg select _i) == _cond) exitWith {
			_result = true;
		};
	};
	_result;
};
SHK_Taskmaster_setCurrentLocal = {
	/* Set the given task as current task. */
	{
		if (_this == (_x select 0)) exitwith {
			private "_handle";
			{
				_handle = _x;
				{
					if (_handle in (simpletasks _x)) then {
						_x setcurrenttask _handle;

						if (_x == player) then {
							if (SHK_Taskmaster_showHints) then { [_handle,"Assigned"] call SHK_Taskmaster_showHint };
						};
					};
				} foreach (if ismultiplayer then {playableunits} else {switchableunits});
			} foreach (_x select 2);
		};
	} foreach SHK_Taskmaster_TasksLocal;
};
SHK_Taskmaster_showHint = {
	private ["_p", "_taskCase"];
	_p = switch (toLowerANSI (_this select 1)) do {
		case "created": {   _taskCase = "TaskCreated" };
		case "assigned": {  _taskCase = "TaskAssigned" };
		case "succeeded": { _taskCase = "TaskSucceeded" };
		case "failed": {    _taskCase = "TaskFailed" };
		case "canceled": {  _taskCase = "TaskCanceled" };
	};
	[_taskCase, ["", format ["%1", ((taskDescription (_this select 0)) select 1)]]] spawn BIS_fnc_showNotification;
};
SHK_Taskmaster_upd = {
	/*	Take a task data array, update the task list. Send to clients.
		In: array	["Name","Title","Desc",[Marker],"State"]
		Out:
	*/
	if isserver then {
		private ["_task","_state"];
		_state = (_this select 1);
		for "_i" from 0 to (count SHK_Taskmaster_Tasks - 1) do {
			_task =+ (SHK_Taskmaster_Tasks select _i);
			if ((_task select 0) == (_this select 0)) then {
				_task set [5,_state];
			};
			SHK_Taskmaster_Tasks set [_i,_task];
		};
		if (count _this > 2) then {
			if ((_this select 2) isEqualType "") then { (_this select 2) call SHK_Taskmaster_assign };
			if ((_this select 2) isEqualType []) then { (_this select 2) spawn { sleep 1; _this call SHK_Taskmaster_add} };
		};
		publicvariable "SHK_Taskmaster_Tasks";
		/*
		Update for host of the non-dedicated server.
		*/
		if (!isdedicated && SHK_Taskmaster_initDone) then {
			SHK_Taskmaster_Tasks spawn SHK_Taskmaster_handleEvent;
		};
	};
};
SHK_Taskmaster_updateTask = {
	/*	Updates task state for all playableunits and local task list.
		Delete marker of completed task.
		In: array	["Name","Title","Desc",[Marker],"State"]
		Out:
	*/
	private ["_task","_name","_state","_handle","_marker"];
	for "_i" from 0 to (count SHK_Taskmaster_TasksLocal - 1) step 1 do {
		_task =+ SHK_Taskmaster_TasksLocal select _i;
		_name = _task select 0;
		if (_name == (_this select 0)) then {
			_marker = _this select 4;
			_state = _this select 5;
			_task set [1,_state];
			SHK_Taskmaster_TasksLocal set [_i,_task];
			{
				_handle = _x;
				{
					if (_handle in (simpletasks _x)) then {
						_handle settaskstate _state;

						if (_x == player) then {
							if (SHK_Taskmaster_showHints) then { [_handle,_state] call SHK_Taskmaster_showHint };

							if (count _marker > 0) then {
								if (_state in ["succeeded","failed","canceled"]) then {
									if DEBUG then { diag_log format ["SHK_Taskmaster> updateTask deleting marker: %1, state: %2",_marker,_state]};
									if ((_marker select 0) isEqualType "") then {
										_marker = [_marker];
									};
									{
										deletemarkerlocal (_x select 0);
									} foreach _marker;
								};
							};
						};
					};
				} foreach (if ismultiplayer then {playableunits} else {switchableunits});
			} foreach (_task select 2);
		};
	};
};

/* == SERVER =================================================================================== */
if isserver then {
	SHK_Taskmaster_Tasks = []; // Array member: ["Name","Title","Desc","Marker","State"]
	/*
	Iterate through the tasks received from init.sqf and add them to an array. Then send it to clients.
	*/
	if (!isnil "_this") then {
		if (count _this > 0) then {
			private ["_task","_tasks","_i"];
			_tasks = _this select 0;
			{
				_x call SHK_Taskmaster_add;
			} foreach _tasks;
		};
	};
	publicvariable "SHK_Taskmaster_Tasks";
	if DEBUG then {
		diag_log "-- SHK_Taskmaster_Tasks --";
		diag_log SHK_Taskmaster_Tasks;
	};
};
/* == CLIENT =================================================================================== */
//if !isdedicated then {
if (hasInterface) then {
	SHK_Taskmaster_showHints = false;
	SHK_Taskmaster_TasksLocal = []; // Array member: ["TaskName","TaskState",TaskHandles]
	/*
	If any notes given in init.sqf, simply add them.
	*/
	if (!isnil "_this") then {
		if (count _this > 1) then {
			private ["_notes","_i"];
			_notes = _this select 1;
			for [{_i=(count _notes - 1)},{_i>-1},{_i=_i-1}] do {
				(_notes select _i) call SHK_Taskmaster_addNote;
			};
		};
	};
/*
	Initially wait for server to send the task list for briefing. After briefing is created, add
	an eventhandler to catch the updated task list server might send.

	Wait for briefing tasks to be created before enabling taskhints. This prevents hints from briefing tasks
	from being spammed at the start of the mission.
*/
	0 spawn {
		waituntil {!isnull player};
		waituntil {!isnil "SHK_Taskmaster_Tasks"};
		if DEBUG then {diag_log format ["SHK_Taskmaster> Tasks received first time: %1",SHK_Taskmaster_Tasks]};
		private _sh = SHK_Taskmaster_Tasks spawn SHK_Taskmaster_handleEvent;
		missionNameSpace setVariable ["BMR_regSide", playerSide];
		private _side = missionNameSpace getVariable ["BMR_regSide", side player];
		waituntil {scriptdone _sh};

		SHK_Taskmaster_showHints = true;
		SHK_Taskmaster_initDone = true;

		"SHK_Taskmaster_Tasks" addpublicvariableeventhandler {
			(_this select 1) spawn SHK_Taskmaster_handleEvent;
		};
	};
};