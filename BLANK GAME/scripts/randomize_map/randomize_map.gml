function randomize_map(_board,_spawn_chance, _object, _width, _height, xOffset = 0, yOffset = 0) {

    for (var xx=xOffset;xx<_width;xx++) {
        for (var yy=yOffset;yy<_height;yy++) {
            var _roll = random(100); 
            if (_roll <= _spawn_chance) { 
                _board[# xx, yy] = _object; 
            }
        }
    }
}
