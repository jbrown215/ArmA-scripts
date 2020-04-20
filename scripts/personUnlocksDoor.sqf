this setVariable ['bis_disabled_Door_1',1,true];
this addAction ["Unlock Door", {
  _door = _this select 0;
  _door setVariable ['bis_disabled_Door_1',0,true];
  _door removeAction (_this select 2);  
}, [], 10, true, true, "", "(roleDescription _this) == 'Spy'", 3];
