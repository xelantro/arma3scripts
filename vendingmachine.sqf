//in vending machine: this addAction ["<t color='#1122FF'>Soda</t>", "vendingmachine.sqf", nil, 6, true, true, "", "true", 5];
_anim = "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon"; // AmovPercMstpSnonWnonDnon_AcinPknlMwlkSnonWnonDb_1
//[_this select 1, _anim] remoteExec ["switchMove"];
[_this select 1, _anim] remoteExec ["playMoveNow"];
sleep 0.8;
_can = createVehicle [selectRandom ["Land_Can_V1_F","Land_Can_V2_F","Land_Can_V3_F"],(getposatl (_this select 0)) vectorAdd [-cos(getdir(_this select 0)-90),sin(getdir (_this select 0)-90), 1], [], 0.01, "CAN_COLLIDE"];
sleep 20;
deleteVehicle _can;
