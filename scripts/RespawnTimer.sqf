disableSerialization;

while {true} do
{
    _main_disp=findDisplay 49;
    if (! isNull _main_disp) then {
        _ntime=time + 60;

        while {time < _ntime && ! (isNull _main_disp)} do {
            (_main_disp displayctrl 1010) ctrlEnable false;
            (_main_disp displayctrl 1010)  ctrlSetText format ["Respawn (%1)", (ceil (_ntime-time))];
            sleep 0.1;
        };

        (_main_disp displayctrl 1010) ctrlEnable true;
        (_main_disp displayctrl 1010) ctrlSetText "Respawn";
        waitUntil {isNull _main_disp};
    };
    sleep 0.1;
};