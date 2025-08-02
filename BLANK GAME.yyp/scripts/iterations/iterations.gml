function iterations(_old_board,_create_limit,_destroy_limit, _include_walls = true, _target = 1, remove_old = true) {
    ///@func iterations(_old_board,_create_limit,_destroy_limit);
    ///@param   _old_map        The map as it currently stands
    ///@param   _create_limit   The neighbour count that will turn an EMPTY cell SOLID
    ///@param   _destroy_limit  The neighbour count that will turn a SOLID cell EMPTY
	
    var _w = ds_grid_width(_old_board)
	var _h = ds_grid_height(_old_board)
    var _new_map = ds_grid_create(_w, _h);
	
    for (var xx=0;xx<_w;xx++) {
        for (var yy=0;yy<_h;yy++) {
            var _count = check_neighbours(xx,yy,_old_board,_include_walls, true, _target); 
            if (_old_board[# xx, yy] = _target) { 
                if (_count < _destroy_limit) {
                    _new_map[# xx, yy] = 0; 
                }
                else { 
                    _new_map[# xx, yy] = _target;
                }
            }
            else {
                if (_count > _create_limit) { 
                    _new_map[# xx, yy] = _target;
                }
                else { // Otherwise
                    _new_map[# xx, yy] = 0;
                }
            }
        }
    }
	
	ds_grid_destroy(_old_board)
	
    return _new_map;
}
