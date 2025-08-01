function generate_board(_biome, _width, _height){
		
	var base_board = ds_grid_create(_width, _height);
	var layers = [] //LAYER 0 MUST ALWAYS BE THE BASE TO BUILD OFF
	var mean_required = 0.7
	
	while true{
		show_debug_message("Compiling board")
		switch _biome{
			case -1:
				layers[0] = ds_grid_create(_width, _height)
				ds_grid_add_region(layers[0],0,0,_width,_height,1)
			break
			case 1: 
				//Gross
				layers[0] = RunCellularAutomata(_width,_height,65,5,4,10, 1, true)
				layers[1] = RunCellularAutomata(_width,_height,45,4,3,12, 2, false)
				mean_required = 0.7
			break
			case 2: 
				//Ice
				layers[0] = RunCellularAutomata(_width,_height,65,6,4,10, 1, false)
				layers[1] = RunCellularAutomata(_width,_height,45,2,6,5, 3, false)
				mean_required = 0.27
			break
			case 3: 
				//Fire
				layers[0] = RunCellularAutomata(_width,_height,65,4,5,10, 1, true)
				layers[1] =  RunCellularAutomata(_width,_height,7,1,1,3, 4, false)
				mean_required = 0.8
			break
			case 4: 
				//CHAOS
				layers[0] = RunCellularAutomata(_width,_height,75,4,4,10, 1, false)
				layers[1] = RunCellularAutomata(_width,_height,45,4,3,12, 2, false)
				layers[2] = RunCellularAutomata(_width,_height,45,2,6,5, 3, false)
				layers[3] = RunCellularAutomata(_width,_height,5,1,1,3, 4, false)
				mean_required = 0.8
			break
			default:
				//base
				layers[0] = RunCellularAutomata(_width,_height,75,4,3,10, 1, false)
				mean_required = 0.8
			break
		}
		
		
		//if ds_grid_get_mean(layers[0],0,0,_width,_height) >= mean_required{
			break	
		//}
		
		show_debug_message("Recompiling")
	}
	
	show_debug_message("DONE!")
	// Add the layers together
	var layer_count = array_length(layers)

	for (var tX = 0; tX < _width; tX++)
	{
		for (var tY = 0; tY < _height; tY++)
		{
			//var tileMapData = tilemap_get(tileMap, tX, tY)
			var tileMapData = layers[0][# tX, tY]
			//Format: [sprite, z]
			var thisTile = []
			if tileMapData != 0{ 
				
				for(var i = layer_count-1; i > 0; i --){
					var _cur_tile = layers[i][# tX, tY]
					if _cur_tile != 0{
						tileMapData = _cur_tile
						break	
					}
				}
			}
			
			thisTile[TILE.SPRITE] = tileMapData
			thisTile[TILE.HIGHLIGHT_EFFECT] = -1
			thisTile[TILE.Z] = 0
			
			
			//TODO add genteration entities and objects
			thisTile[TILE.ENTITY] = noone	
			thisTile[TILE.OBJECT] = noone
			base_board[# tX, tY] = thisTile;
		}	
	}
	
	
	for(i = 0; i < layer_count; i ++){
		ds_grid_destroy(layers[i])	
	}
	
	return base_board
}
