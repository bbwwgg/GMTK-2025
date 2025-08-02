function is_square_unblocked(row, col)
{
	return ((global.map[# row, col][TILE.SPRITE] != 0 and global.map[# row, col][TILE.OBJECT] == noone )) 
}