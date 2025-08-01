function ScreenToTileX(_screenX, _screenY){
	
	return clamp(round(((_screenX - 2 -global.camera_margin_width - (global.board_height * (MAP_TILE_W * 0.5))) / (MAP_TILE_W * 0.5) + ((_screenY + 2 -global.camera_margin_height) / (MAP_TILE_H * 0.5) - 1)) * 0.5),  0, global.board_width - 1)
}

function ScreenToTileY(_screenX, _screenY){
	//TODO fix the fact that u can click a small amount over the tile before it swaps (would be fixed by accounting for the bottom of the tile)
	return clamp(ceil((_screenY + 2 - global.camera_margin_height) / MAP_TILE_H - 1 - (_screenX - 2 - global.camera_margin_width - 0.5 * global.board_height * MAP_TILE_W) / MAP_TILE_W), 0, global.board_height - 1)
}


