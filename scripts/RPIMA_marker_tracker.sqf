_marker = _this select 0;
_vehicle = _this select 1;

while {alive _vehicle} do
  {
  _marker setmarkerpos getpos _vehicle;
  sleep 3;
  };

deletemarker _marker;

/*
POPO_fnc_TrackerMarker = {
  [params = "_marker","_vehicle"];
  while {alive _vehicle} do
  {
  _marker setmarkerpos getpos _vehicle;
  sleep 3;
  };

deletemarker _marker;
};