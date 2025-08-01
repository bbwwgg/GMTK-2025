
function get_ease_data(_ease_type, _current_time, _start_pos, _dist, _time_to_dest){
	///@desc given a ease type, return the next value in the ease type
	//
	var _value;
	
	switch(_ease_type){
		case MOVE_TYPE.LINEAR: _value = ease_linear(_current_time, _start_pos, _dist, _time_to_dest) break
		case MOVE_TYPE.EASE_IN: _value = ease_in(_current_time, _start_pos, _dist, _time_to_dest) break
		case MOVE_TYPE.EASE_IN_OUT: _value = ease_in_out(_current_time, _start_pos, _dist, _time_to_dest) break
		case MOVE_TYPE.EASE_OUT: _value = ease_out(_current_time, _start_pos, _dist, _time_to_dest) break
		case MOVE_TYPE.EASE_OUT_ELASTIC: _value = ease_out_elastic(_current_time, _start_pos, _dist, _time_to_dest) break
	}
	
	return _value
}