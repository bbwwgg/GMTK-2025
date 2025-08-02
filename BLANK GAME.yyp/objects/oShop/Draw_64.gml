draw_text(10,10, global.money)
//draws the shop menus

draw_sprite_ext(spr_mainShop, 0, x_offset, y_offset + shop_float,scale,scale,0,c_white,1)
draw_sprite_ext(spr_PopupA, 0, popout_A_x_offset, popout_A_y_offset+popouta_float,scale,scale,0,c_white,1)

if rerolling{
draw_sprite_ext(spr_pupupB, 0, popout_B_x_offset+shake_offset_x, popout_B_y_offset+popoutb_float+shake_offset_y,scale,scale,0,c_white,1)
}else{
	draw_sprite_ext(spr_pupupB, 0, popout_B_x_offset, popout_B_y_offset+popoutb_float,scale,scale,0,c_white,1)
}

//Dice
draw_sprite_ext(sDice, 0,dice_x+shake_offset_x, dice_y+shake_offset_y+popoutb_float,scale,scale,0,c_white,1)
//Dice vars
if (shake_strength > 0.01) {
	shake_offset_x = random_range(-shake_strength, shake_strength);
	shake_offset_y = random_range(-shake_strength, shake_strength);
	
	// Apply decay
	shake_strength *= shake_decay;
} else {
	rerolling = false
	shake_offset_x = 0;
	shake_offset_y = 0;
}


for(var i = 0; i < top_row_size+bottom_row_size; i++){
	if(shopList[i] != 0){
		shopList[i].draw()
		draw_text(shopList[i].x,shopList[i].y+30, shopList[i].cost)
	}
}

if sale_item != 0{
	sale_item.draw()	
}
