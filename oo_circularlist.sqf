	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2014-2018 Nicolas BOITEUX

	CLASS OO_CIRCULARLIST
	
	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.
	
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.
	
	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>. 
	*/

	#include "oop.h"

	CLASS("OO_CIRCULARLIST")
		PRIVATE VARIABLE("scalar","index");
		PRIVATE VARIABLE("array","list");

		PUBLIC FUNCTION("","constructor") {
			DEBUG(#, "OO_CIRCULARLIST::constructor")
			MEMBER("index", 0);
			MEMBER("list", []);
		};

		PUBLIC FUNCTION("","toArray") {
			MEMBER("list", nil);
		};

		PUBLIC FUNCTION("","count") {
			DEBUG(#, "OO_CIRCULARLIST::count")
			count MEMBER("list", nil);
		};

		PUBLIC FUNCTION("ANY","add") {
			DEBUG(#, "OO_CIRCULARLIST::add")
			MEMBER("list", nil) pushBack _this;
		};

		PUBLIC FUNCTION("ANY","addFirst") {
			DEBUG(#, "OO_CIRCULARLIST::addFirst")
			private _array = [_this];
			_array append MEMBER("list", nil);
			MEMBER("list", _array);
		};

		PUBLIC FUNCTION("ANY","addLast") {
			DEBUG(#, "OO_CIRCULARLIST::addLast")
			MEMBER("list", nil) pushBack _this;
		};

		PUBLIC FUNCTION("","delFirst") {
			DEBUG(#, "OO_CIRCULARLIST::delFirst")
			MEMBER("list",nil) deleteAt 0;
		};

		PUBLIC FUNCTION("","delLast") {
			DEBUG(#, "OO_CIRCULARLIST::delLast")
			MEMBER("list",nil) deleteAt (MEMBER("count", nil) -1);
		};

		PUBLIC FUNCTION("array","reset") {
			DEBUG(#, "OO_CIRCULARLIST::reset")
			MEMBER("index", 0);
			MEMBER("list", []);
		};

		PUBLIC FUNCTION("","getFirst") {
			DEBUG(#, "OO_CIRCULARLIST::getFirst")
			MEMBER("list", nil) select 0;
		};

		PUBLIC FUNCTION("","getLast") {
			DEBUG(#, "OO_CIRCULARLIST::getLast")
			MEMBER("list", nil) select (MEMBER("count", nil) -1);
		};		

		PUBLIC FUNCTION("","getPrev") {
			DEBUG(#, "OO_CIRCULARLIST::getPrev")
			private _index = MEMBER("index", nil) - 1;
			if (_index < 0) then { _index = MEMBER("count", nil) -1;};
			MEMBER("index", _index);
			MEMBER("list", nil) select _index;
		};

		PUBLIC FUNCTION("","getNext") {	
			DEBUG(#, "OO_CIRCULARLIST::getPrev")
			private _index = MEMBER("index", nil) + 1;
			if(_index > (MEMBER("count", nil) -1)) then { _index = 0;};
			MEMBER("index", _index);
			MEMBER("list", nil) select _index;
		};

		PUBLIC FUNCTION("","deconstructor") {
			DEBUG(#, "OO_CIRCULARLIST::deconstructor") 
			DELETE_VARIABLE("index");
			DELETE_VARIABLE("list");
		};
	ENDCLASS;