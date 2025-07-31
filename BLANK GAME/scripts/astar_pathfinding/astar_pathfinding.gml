// Implement the A* search algorithm
function a_star_search(src, dest, find_closest_path = false){

	
	
    // Check if the source and destination are valid
    if !is_square_valid(src[0], src[1]) or !is_square_valid(dest[0], dest[1]){
        show_debug_message("Source or destination is invalid")
        return noone
	}
	
	if is_at_destination(src[0], src[1], dest){
		show_debug_message("At destination")
		return noone
	}
 
    // Check if the source and destination are unblocked
    if !is_square_unblocked(src[0], src[1]){
        show_debug_message("Source is blocked")
        return noone
	}
	
	if  !find_closest_path and !is_square_unblocked(dest[0], dest[1]){
        show_debug_message("Destination is blocked")
        return noone		
	}
	

    // Initialize the closed list (visited cells)
	var closed_list = []
	var cell_details = []
	for(var i = 0; i < global.board_width; i ++){
		for(var j = 0; j < global.board_height; j ++){
			closed_list[i,j] = false
			cell_details[i,j] =	{
				parent : [0,0],  //Parent cell's row index
		        f : 999, //Total cost of the cell (g + h)
		        g : 999,  //Cost from start to this cell
		        h : 0  //Heuristic cost from this cell to destination
			} 
		}
	}
    


	
    // Initialize the start cell details
    var i = src[0]
    var j = src[1]
    cell_details[i][j].f = 0
    cell_details[i][j].g = 0
    cell_details[i][j].h = 999
    cell_details[i][j].parent = [i, j]
 
    // Initialize the open list (cells to be visited) with the start cell
    var open_list = ds_priority_create();
	ds_priority_add(open_list, [i, j], 0.0)
 
    // Initialize the flag for whether destination is found
    var found_dest = false
 
	// For finding the closest path
	var closest_h_node = src
 
    // Main loop of A* search algorithm
    while !ds_priority_empty(open_list){

        // Pop the cell with the smallest f value from the open list
        var p = ds_priority_delete_min(open_list)
		
        // Mark the cell as visited
        i = p[0]
        j = p[1]
		
        closed_list[i,j] = true
		
        // For each direction, check the successors
        var directions = [[0, 1], [0, -1], [1, 0], [-1, 0]/*, [1, 1], [1, -1], [-1, 1], [-1, -1]*/]
		for(var dir = 0; dir < array_length(directions); dir++){
            var new_i = i + directions[dir][0]
            var new_j = j + directions[dir][1]
			
            // If the successor is valid, unblocked, and not visited
            if is_square_valid(new_i, new_j) and is_square_unblocked(new_i, new_j) and !closed_list[new_i][new_j]{
                // If the successor is the destination
                if is_at_destination(new_i, new_j, dest){
                    // Set the parent of the destination cell
                    cell_details[new_i][new_j].parent = [i, j]
                    show_debug_message("The destination cell is found")
                    // Trace and print the path from source to destination
                    var editedPath = trace_path(cell_details, dest)
                    found_dest = true
					ds_priority_destroy(open_list)
                    return editedPath
				}else{
                    // Calculate the new f, g, and h values
					var _cost = 1
					if dir >= 4{
						_cost = sqrt(2)
					}
                    var g_new = cell_details[i][j].g + 1/*global.map[# i, j][TILE.MOVEMENT_COST]*/ + _cost
                    var h_new = calculate_h_value(new_i, new_j, dest)
                    var f_new = g_new + h_new
					
					if find_closest_path{
						if cell_details[closest_h_node[0],closest_h_node[1]].h >= h_new{
							closest_h_node = [new_i,new_j]
						}
					}
					
                    // If the cell is not in the open list or the new f value is smaller
                    if cell_details[new_i][new_j].f == 999 or cell_details[new_i][new_j].f > f_new{
                        // Add the cell to the open list
						ds_priority_add(open_list, [new_i, new_j], f_new)
                        // Update the cell details
                        cell_details[new_i][new_j].f = f_new
                        cell_details[new_i][new_j].g = g_new
                        cell_details[new_i][new_j].h = h_new
                        cell_details[new_i][new_j].parent = [i,j]
					}
				}
			}
		}
	}

	ds_priority_destroy(open_list)
    // If the destination is not found after visiting all cells
    if !found_dest{
		show_debug_message("Failed to find the destination cell")
		
		if find_closest_path{
			return trace_path(cell_details, closest_h_node)
		}
		
		return noone
	}
	
}