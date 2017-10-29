	call compilefinal preprocessFileLineNumbers "oo_circularlist.sqf";

	private ["_list", "_condition"];

	_list = ["new", allunits] call OO_CIRCULARLIST;
	_condition = { if(getDammage _this > 0.5) then { false; }else{ true; }; };

	while { true } do {
		_element = ["getPrev", [_condition, objnull]] call _list;
		hint  format ["try to hurt someone - %1 is fine", name _element];
		sleep 1;
	};

