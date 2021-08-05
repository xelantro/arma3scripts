//in chair: this addAction ["<t color='#1122FF'>Sit in chair</t>", "sitinchair.sqf", nil, 6, true, false, "", "true", 2];
_target = _this select 0;
_caller = _this select 1;

if(isNil {_this select 3}) then { 
	//because arma
	_target disableCollisionWith _caller;
	_caller disableCollisionWith _player;
	
	//set posion
	_caller setposasl ((getposasl _target) vectorAdd [0,-0.13,0]);
	_caller setdir ((getdir _target) + 180);
	
	//random animation
	_anim = selectRandom ["HubSittingChairA_idle1","HubSittingChairA_idle2","HubSittingChairA_idle2","HubSittingChairA_idle2","HubSittingChairA_idle3","HubSittingChairA_move1"];
	[_caller, _anim] remoteExec ["switchMove"];
	[_caller, _anim] remoteExec ["playMoveNow"];
	
	//remove action
	_target removeAction (_this select 2);
	
	//stand up animation
	_caller addAction ["<t color='#1122FF'>Stand up</t>","sitinchair.sqf",_target,6];
} else {
	//remove Stand up from player
	_caller removeAction (_this select 2);
	(_this select 3) addAction ["<t color='#1122FF'>Sit in chair</t>", "sitinchair.sqf", nil, 6, true, false, "", "true", 2];
	
	//remove animation
	[_caller, ""] remoteExec ["switchMove"];
	
	//teleport in front of chair
	_caller setposasl ((getposasl (_this select 3)) vectorAdd [0,-0.6,0]);
}
