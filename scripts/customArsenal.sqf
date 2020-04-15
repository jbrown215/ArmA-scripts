_target = _this select 0;


_loadoutNames = ["Rifleman", "Rifleman CLS", "Grenadier", "Team/Squad Leader", "Medic", "Autorifleman", "Crewman", "UH60 Pilot", "AH64 Pilot"];

{
  _target addAction [format ["Equip %1 Loadout", _x], "equipLoadout.sqf", [_x], 10, true, true, "", "true", 4.5, false, "", ""];
} forEach _loadoutNames;