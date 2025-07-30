/// @description Render the game
var tileData, screenX, screenY, tileIndex, tileZ, tileEntity, effect;
var _selected = oPlayerController.current_selection	



//Render the ground
for (var tX = 0; tX < global.board_width; tX++)
{
	for (var tY = 0; tY < global.board_height; tY++)
	{

		if  is_array(_selected){
			if array_equals(_selected,[tX,tY]){
				continue
			}
		}
		
		//Can optimize
		tileData = global.map[# tX, tY];
		screenX = TileToScreenX(tX, tY);
		screenY = TileToScreenY(tX, tY);
		
		tileIndex = tileData[TILE.SPRITE]
		tileZ = tileData[TILE.Z]
		tileEntity = tileData[TILE.ENTITYS]
		effect = tileData[TILE.HIGHLIGHT_EFFECT]
		if (tileIndex != 0){
			//tileZ += -1.6*sin(time/35 + tX)
			
			draw_sprite(sFloorTile, tileIndex - 1, screenX, screenY + tileZ)
		}
		if effect != -1{
			draw_sprite(sFloorPath, 0, screenX, screenY - 4)	
		}

	}
}



if  is_array(_selected){
	
	tX = _selected[0]
	tY = _selected[1]
	
	tileData = global.map[# tX, tY];
	screenX = TileToScreenX(tX, tY);
	screenY = TileToScreenY(tX, tY);
		
	tileIndex = tileData[TILE.SPRITE]
	tileZ = tileData[TILE.Z]
	

}

time ++