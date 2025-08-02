command_node_database()
top_row_size = 3
bottom_row_size = 6

prev_node = 0
max_node_timer = 10
node_timer = max_node_timer

float_time = irandom_range(-10,20)
shop_float = 0
popouta_float = 0
popoutb_float = 0

shop_base_width = sprite_get_width(spr_mainShop) //+ (sprite_get_width(spr_PopupA)+ sprite_get_width(spr_pupupB))/2
shop_base_height = sprite_get_height(spr_mainShop)

base_node_width = sprite_get_width(sNode)
base_node_height = sprite_get_height(sNode)


popout_a_base_width = sprite_get_width(spr_PopupA) 
popout_a_base_height = sprite_get_width(spr_pupupB) 
popout_b_base_width = sprite_get_width(spr_PopupA) 
popout_b_base_height = sprite_get_width(spr_pupupB) 


scale = GUI_SHOP_WIDTH/shop_base_width

x_offset = (VIEW_WIDTH - GUI_SHOP_WIDTH) /2
y_offset = (VIEW_HEIGHT-shop_base_height*scale) / 2

popout_A_x_offset = x_offset-(popout_a_base_width*0.25) *scale
popout_A_y_offset = y_offset-(popout_a_base_height*0.1) *scale

popout_B_x_offset = x_offset+(shop_base_width*scale)-(popout_b_base_width*0.8) *scale  
popout_B_y_offset = y_offset+(popout_a_base_height*0.25*scale) 

base_top_row_width = 331 *scale //mesure from sprite
base_bot_row_width = 530 *scale





top_node_scale = (base_top_row_width/(top_row_size+2))/base_node_width//Change this number to increase the sep
top_node_sep = (base_top_row_width-(base_node_width*top_node_scale)*top_row_size) / (top_row_size+1)

bot_node_scale = (base_bot_row_width/(bottom_row_size+2))/base_node_width//Change this number to increase the sep
bot_node_sep = (base_bot_row_width-(base_node_width*bot_node_scale)*bottom_row_size) / (bottom_row_size+1)


shop_bot_row_y_offset = y_offset+402*scale - base_node_height*bot_node_scale
shop_bot_row_x_offset = x_offset+134*scale

shop_top_row_y_offset = y_offset+300*scale - base_node_height*top_node_scale
shop_top_row_x_offset = x_offset+230*scale


sale_item_x = popout_A_x_offset+(230 - base_node_width/2)*scale
sale_item_y = popout_A_y_offset+(190 - base_node_height/2)*scale


rerolling = false

dice_x = popout_B_x_offset+(150 - sprite_get_width(sDice) /2)*scale
dice_y = popout_B_y_offset+(170 - sprite_get_width(sDice) /2)*scale
shake_strength = 0
shake_offset_x = 0
shake_offset_y = 0
shake_decay = 0.7


shopList = array_create(top_row_size+bottom_row_size)
generate_new_shop()

function generate_new_shop(_include_sale_item = true){
	for(var index = 0; index < top_row_size; index++){
		shopList[index]=(create_shop_node(
		shop_top_row_x_offset+top_node_sep*(index+1) + (base_node_width*top_node_scale) * index,
		shop_top_row_y_offset+shop_float,top_node_scale, top_node_scale))
	}

	for(var index = 0; index < bottom_row_size; index++){
		shopList[top_row_size+ index]=(create_shop_node(
		shop_bot_row_x_offset+bot_node_sep*(index+1) + (base_node_width*bot_node_scale) * index,
		shop_bot_row_y_offset+shop_float,bot_node_scale, bot_node_scale))
	}

	if _include_sale_item{
		sale_item = (create_shop_node(sale_item_x,sale_item_y, scale, scale))
	}
}