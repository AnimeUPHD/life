#include <macro.h>
/*
	Bryan "Tonic" Boardwine
	
	Description:
	Withdraws money from the players account
*/
private["_val"];
_val = parseNumber(ctrlText 2702);
if(_val > 999999) exitWith {hint localize "STR_ATM_WithdrawMax";};
if(_val < 0) exitwith {};
if(!([str(_val)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_val > BANK) exitWith {hint localize "STR_ATM_NotEnoughFunds"};
if(_val < 100 && BANK > 20000000) exitWith {hint localize "STR_ATM_WithdrawMin"}; //Temp fix for something.


//log transfers
[[format ["1|%1 has withdrawn %2$ from his bankaccount.",player getVariable["realname",name player],[_val] call life_fnc_numberText]],"Arma3Log",false,false] call life_fnc_MP;

ADD(CASH,_val);
SUB(BANK,_val);
hint format [localize "STR_ATM_WithdrawSuccess",[_val] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;