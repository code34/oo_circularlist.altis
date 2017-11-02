	call compile preprocessFileLineNumbers "oo_circularlist.sqf";

	private _list = ["new", allunits] call OO_CIRCULARLIST;
	private _condition = { if(getDammage _this > 0.5) then { false; }else{ true; }; };
	private _element = [];

	while { true } do {
		_element = ["getPrev", [_condition, objnull]] call _list;
		hint  format ["try to hurt someone - %1 is fine", name _element];
		sleep 1;
	};

