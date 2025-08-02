function tile_empty(_col, _row){
	return global.map[# _col, _row][TILE.ENTITY] = noone and global.map[# _col, _row][TILE.OBJECT] = noone and global.map[# _col, _row][TILE.SPRITE] != 0
}