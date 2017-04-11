private [ "_iconed_groups", "_ticks", "_localgroup", "_grouptype", "_groupicon" ];

_iconed_groups = [];
_ticks = 0;

setGroupIconsVisible [true,false];

while { true } do {
	{
		if ((_x != group player) && ((side _x == GRLIB_side_friendly))) then {
			if ( (_x in _iconed_groups) && (
				(count units _x == 0) ||  (side _x == GRLIB_side_friendly && (((leader _x) distance (getmarkerpos GRLIB_respawn_marker) < 100) || ((leader _x) distance lhd < 500))))) then {
				clearGroupIcons _x;
				_iconed_groups = _iconed_groups - [_x];
			};

			if ( !(_x in _iconed_groups) && (
				(count units _x > 0) &&  (side _x == GRLIB_side_friendly && (((leader _x) distance (getmarkerpos GRLIB_respawn_marker) > 100) && ((leader _x) distance lhd > 500))))) then {
				clearGroupIcons _x;
				_localgroup = _x;
				_grouptype = [_localgroup] call F_getGroupType;
				_groupicon = "";
				switch (_grouptype) do {
					case "infantry": { _groupicon = KP_group_icon_f_inf };
					case "light": { _groupicon = KP_group_icon_f_motor_inf };
					case "heavy": { _groupicon = KP_group_icon_f_armor };
					case "air": { _groupicon = KP_group_icon_f_air };
					case "support": { _groupicon = KP_group_icon_f_support };
					case "static": { _groupicon = KP_group_icon_f_mortar };
					case "uav": { _groupicon = KP_group_icon_f_uav };
					default {  };
				};

				_localgroup addGroupIcon [ _groupicon, [ 0,0 ] ];

				if ( side _localgroup == GRLIB_side_friendly ) then {
					_groupiconsize = "group_0";
					_groupsize = (count (units _localgroup));
					if ( _groupsize >= 2 ) then { _groupiconsize = "group_1" };
					if ( _groupsize >= 6 ) then { _groupiconsize = "group_2" };
					if ( _groupsize >= 10 ) then { _groupiconsize = "group_3" };

					_localgroup addGroupIcon [ _groupiconsize, KP_group_size_offset_f ];
				};

				_iconed_groups pushback _x;
			};
		};
	} foreach allGroups;

	{
		_color = [];
		if ( isplayer leader _x ) then {
			_color = [0.8,0.8,0,1];
		} else {
			_color = KP_group_color_f;
		};
		_x setGroupIconParams [_color,"",1,true];
	} foreach _iconed_groups;

	_ticks = _ticks + 1;
	if ( _ticks >= 15 ) then {
		_ticks = 0;
		_iconed_groups = [];
	};

	sleep 4.7;
};
