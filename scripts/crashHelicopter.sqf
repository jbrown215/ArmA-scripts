_caller = _this select 0;
_heli = _this select 1;
_name = _this select 2;
_caller addAction [_name, {
_heli = _this select 3 select 0;
(_this select 0) removeAction (_this select 2);

[_heli, ["HitHRotor", 1]] remoteExecCall ["setHitPointDamage", _heli];
[_heli, ["HitVRotor", 1]] remoteExecCall ["setHitPointDamage", _heli];
[_heli, ["HitHull", 1]] remoteExecCall ["setHitPointDamage", _heli];
[_heli, ["HitEngine", 1]] remoteExecCall ["setHitPointDamage", _heli];
[_heli,false] remoteExecCall ["allowDamage", _heli];
_crew = crew _heli;
{ [_x,false] remoteExecCall ["allowDamage", _x];
[ "SmallExplosion"] remoteExecCall ["playSound", _x];
} forEach _crew;
  
_fire1 = "test_EmptyObjectForFireBig" createVehicle position _heli; 
_fire1 attachTo[_heli,[2,0,-2]];
_fire2 = "test_EmptyObjectForFireBig" createVehicle position _heli; 
_fire2 attachTo[_heli,[-2,0,-2]];
_fire3 = "test_EmptyObjectForFireBig" createVehicle position _heli; 
_fire3 attachTo[_heli,[0,-2,-2]];
_fire4 = "test_EmptyObjectForFireBig" createVehicle position _heli; 
_fire4 attachTo[_heli,[0,2,-2]];
_fire5 = "test_EmptyObjectForFireBig" createVehicle position _heli; 
_fire5 attachTo[_heli,[4,4,-2]];
_fire6 = "test_EmptyObjectForFireBig" createVehicle position _heli; 
_fire6 attachTo[_heli,[-4,4,-2]];
waitUntil { ((getpos _heli) select 2) < 5 };
deleteVehicle _fire1;
deleteVehicle _fire2;
deleteVehicle _fire3;
deleteVehicle _fire4;
deleteVehicle _fire5;
deleteVehicle _fire6;

_bodyParts = ["LeftArm", "RightArm", "LeftLeg", "RightLeg"];
{ moveOut _x;
  _bodyPart = selectRandom _bodyParts;
  [[_x, 0.5, _bodyPart, "explosive"], 'ace_medical_fnc_addDamageToUnit'] call BIS_fnc_MP;
  [_x, true] remoteExecCall ["ace_medical_fnc_setUnconscious", _x];
} forEach _crew;
[_heli, true] remoteExec ["allowDamage", _heli];
_heli setDamage 1;
sleep 6;
{ [_x, false] remoteExecCall ["ace_medical_fnc_setUnconscious", _x];} forEach _crew;
sleep 20;
{[_x, true] remoteExecCall ["allowDamage", _x];} forEach _crew;
}, [_heli], 1.5, false, true, "", "_originalTarget == _this"
];
