/// @description Render the game
var tileData, screenX, screenY, tileIndex, tileZ, tileEntity, effect;

//Render the ground
for (var tX = 0; tX < global.board_width; tX++)
{
	for (var tY = 0; tY < global.board_height; tY++)
	{

	
		//Can optimize
		tileData = global.map[# tX, tY];
		screenX = TileToScreenX(tX, tY);
		screenY = TileToScreenY(tX, tY);
		
		tileIndex = tileData[TILE.SPRITE]
		tileZ = tileData[TILE.Z]
		tileEntity = tileData[TILE.ENTITY]
		effect = tileData[TILE.HIGHLIGHT_EFFECT]
		if (tileIndex != 0){
			//tileZ += -1.6*sin(time/35 + tX)
			
			draw_sprite(sFloorTile, tileIndex - 1, screenX, screenY + tileZ)
		}

	}
}


time ++