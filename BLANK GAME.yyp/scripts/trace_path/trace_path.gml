//Trace the path from source to destination
function trace_path(cell_details, dest){
    var path = []
    var row = dest[0]
    var col = dest[1]
 
    // Trace the path from destination to source using parent cells
    while !(cell_details[row][col].parent[0] == row and cell_details[row][col].parent[1] == col){
        path[array_length(path)] = [row, col]
        var temp_row = cell_details[row][col].parent[0]
        var temp_col = cell_details[row][col].parent[1]
        row = temp_row
        col = temp_col
	}
 
    // Add the source cell to the path
    path[array_length(path)] = [row, col]
    // Reverse the path to get the path from source to destination
    path = array_reverse(path)
	
    // Print the path
    for(var i = 0; i < array_length(path); i ++){
        show_debug_message(path[i])
	}
	
	return path;
}