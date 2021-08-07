["AmmoboxInit",[_this,true]] call BIS_fnc_arsenal;
if(isClass(configfile >> "CfgPatches" >> "ace_arsenal")) then {
	[_this, player, true] call ace_arsenal_fnc_openBox;
};
if(isClass(configfile >> "CfgPatches" >> "ace_medical")) then {
	_this addAction ["Heal" , {player call ACE_medical_treatment_fnc_fullHealLocal}];
} else {
	_this addAction ["Heal" , {player setDamage 0}];
};
