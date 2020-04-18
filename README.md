# ArmA Scripts

These are custom scripts used by the 8th Cavalry Regiment milsim group.

## Scripts
### customArsenal

Adds actions to an object to equip loadouts for different classes.

To use it, give the object a unique variable name (e.g., arsenal1) and then add this line
to its init field:
```
_null = [YOUR_VARIABLE_NAME_HERE] execVM "customArsenal.sqf";
```
Requires a multiplayer environment for classes with whitelists.

## personUnlocksDoor

Copy this script into the init field of an object with a single door
and change 'Spy' to the unit role that should be allowed to unlock the door.
