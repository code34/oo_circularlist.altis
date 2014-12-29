	call compilefinal preprocessFileLineNumbers "oo_circularlist.sqf";

	private ["_list", "_condition"];

	sleep 3;

	_list = ["new", [tata]] call OO_CIRCULARLIST;

	while { true } do {
		_condition = {
			if(getDammage _this > 0.99) then {
				false;
			}else{
				true;
			};
		};
		_element = ["getPrev", [_condition, objnull]] call _list;
		if!(isnil "_element") then {
			hint  format ["name: %1", name _element];
		};
		sleep 1;
	};

