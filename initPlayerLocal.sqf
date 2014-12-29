	call compilefinal preprocessFileLineNumbers "oo_circularlist.sqf";

	private ["_list", "_condition"];

	_list = ["new", allunits] call OO_CIRCULARLIST;
	_condition = { if(getDammage _this > 0.99) then { false; }else{ true; }; };

	while { true } do {
		_element = ["getPrev", [_condition, objnull]] call _list;
		hint  format ["name: %1", name _element];
		sleep 1;
	};

