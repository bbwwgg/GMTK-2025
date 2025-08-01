function get_cardinal_direction(_src, _dst){
    var row_diff = _dst[0] - _src[0]
    var col_diff = _dst[1] - _src[1]
    
    if row_diff == 0 and col_diff > 0{
        return 0  // Right
	}else if row_diff < 0 and col_diff == 0{
        return 3  // Up
	}else if row_diff == 0 and col_diff < 0{
        return 2  // Left
	}else if row_diff > 0 and col_diff == 0{
        return 1  // Down
	}else{
        return noone  // Not a straight cardinal move
	}
}