function TileToScreenX(_tX, _tY){
	return ((_tX - _tY) * (MAP_TILE_W * 0.5)) + (global.board_height * (MAP_TILE_W * 0.5)) + global.camera_margin_width 
}

function TileToScreenY(_tX, _tY){
	return ((_tX + _tY + 1) * (MAP_TILE_H * 0.5)) + global.camera_margin_height
}