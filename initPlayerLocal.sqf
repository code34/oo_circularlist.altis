	call compile preprocessFileLineNumbers "oo_circularlist.sqf";
	call compile preprocessFileLineNumbers "oo_unittest.sqf";

	sleep 2;

	private _list = "new" call OO_CIRCULARLIST;
	private _unittest = "new" call OO_UNITTEST;

	private _array = [marie, bernard, bianka, polo, jim];
	{ ["add", _x] call _list; } forEach _array;

	["assert_equal", [_list, "count", count _array, nil]] call _unittest;
	
	["addFirst", toto] call _list;
	["assert_equal", [_list, "getFirst", toto, nil]] call _unittest;
	
	["addLast", john] call _list;
	["assert_equal", [_list, "getLast", john, nil]] call _unittest;

	"delFirst" call _list;
	["assert_not_equal", [_list, "getFirst", toto, nil]] call _unittest;

	"delLast" call _list;
	["assert_not_equal", [_list, "getLast", john, nil]] call _unittest;

	["assert_equal", [_list, "getPrev", jim, nil]] call _unittest;
	["assert_equal", [_list, "getPrev", polo, nil]] call _unittest;
	["assert_equal", [_list, "getPrev", bianka, nil]] call _unittest;
	["assert_equal", [_list, "getPrev", bernard, nil]] call _unittest;
	["assert_equal", [_list, "getPrev", marie, nil]] call _unittest;
	["assert_equal", [_list, "getPrev", jim, nil]] call _unittest;
	
	["assert_equal", [_list, "getNext", marie, nil]] call _unittest;
	["assert_equal", [_list, "getNext", bernard, nil]] call _unittest;
	["assert_equal", [_list, "getNext", bianka, nil]] call _unittest;
	["assert_equal", [_list, "getNext", polo, nil]] call _unittest;
	["assert_equal", [_list, "getNext", jim, nil]] call _unittest;
	["assert_equal", [_list, "getNext", marie, nil]] call _unittest;
	
	"dump" call _unittest;