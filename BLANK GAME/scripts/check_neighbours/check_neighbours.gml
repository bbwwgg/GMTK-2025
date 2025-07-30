function check_neighbours(_baseX,_baseY,_board, include_walls = true, _diagonal = true, _search = 1) {
         
    var _count = 0; // This will keep track of how many neighbours are solid
	var _dir = [[1,0], [-1,0], [0,1], [0,-1]]
	
	if _diagonal array_push(_dir, [1,1], [-1,1], [-1,-1], [1,-1])
	
	var _len = array_length(_dir)
	
    for (var _cur_dir=0; _cur_dir < _len; _cur_dir++) { 
		var xx = _baseX+_dir[_cur_dir][0]; // Get the x position of the neighbour cell
        var yy = _baseY+_dir[_cur_dir][1]; // Get the y position of the neighbour cell
		if !is_square_valid(xx,yy){
			//Act as if the edges of the map are solid
			if include_walls _count++;
		}
        else 
		{
            var _neighbour = _board[# xx, yy];
			if (_neighbour == _search) {
				_count++; // Add to the solid count
			}
		}
    }
    
    return _count; // Finally, return the SOLID count
}