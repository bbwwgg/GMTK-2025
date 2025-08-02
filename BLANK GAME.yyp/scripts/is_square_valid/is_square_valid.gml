function is_square_valid(row, col)
{
    return (row >= 0) and (row < global.board_width) and (col >= 0) and (col < global.board_height)
}