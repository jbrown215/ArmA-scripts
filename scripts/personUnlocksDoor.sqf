// Add this to the init field of an object with one door. Replace 'Spy' with
// the unit role that should be allowed to unlock the door.
// Todo: make this script take an input for the condition instead.
this addAction ["Unlock Door", {
  _door = _this select 0;
  _door setVariable ['bis_disabled_Door_1',0,true];
  _door removeAction (_this select 2);  
}, [], 10, true, true, "", "(roleDescription _this) == 'Spy'", 3];
