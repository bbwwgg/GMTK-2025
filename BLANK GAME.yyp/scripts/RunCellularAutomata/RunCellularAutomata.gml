function RunCellularAutomata(_map_width,_map_height,_spawn_chance,_create_limit,_destroy_limit,_iterations, _tile_id = 1, _include_walls = true) {
    ///@func    RunCellularAutomata(_map_width,_map_height,_spawn_chance,_create_limit,_destroy_limit,_iterations, tile_id, walls);
    ///@param   _map_width      The width of the map
    ///@param   _map_height     The height of the map
    ///@param   _spawn_chance   The chance a cell is turned SOLID
    ///@param   _create_limit   The neighbour count that will turn an EMPTY cell SOLID
    ///@param   _destroy_limit  The neighbour count that will turn a SOLID cell EMPTY
    ///@param   _iterations     The number of iterations we want to perform on the map

	var _ca_map = ds_grid_create(_map_width, _map_height)
    randomize_map(_ca_map,_spawn_chance, _tile_id,_map_width,_map_height);
    
    repeat(_iterations) {
        _ca_map = iterations(_ca_map,_create_limit,_destroy_limit,_include_walls,_tile_id);
    }
     
    return _ca_map;
     
}