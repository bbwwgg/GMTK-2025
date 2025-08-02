var _node = -1

var mx = device_mouse_x_to_gui(0)
var my = device_mouse_y_to_gui(0)

var _click = mouse_check_button_pressed(mb_left)


float_time += 0.03

shop_float = round(sin(float_time)*9)
popouta_float = round(-cos(float_time+0.02)*6)
popoutb_float = round(cos(float_time+0.05)*8)

//Reroll
if point_in_rectangle(mx, my, popout_B_x_offset, popout_B_y_offset, 
						popout_B_x_offset + popout_b_base_width*scale, 
						popout_B_y_offset + popout_b_base_height*scale) and !rerolling{

	shake_strength = 0.8
	if _click{
		shake_strength = 35
		shake_decay = 0.8
		generate_new_shop(false)
		camera_shake(6)
		rerolling = true
	}
}

//update the y coords so it moves with the box
for(var i = 0; i < top_row_size+bottom_row_size + 1; i++){
	
	var _cur
	if i = top_row_size+bottom_row_size{
		_cur = sale_item
		
		if _cur = 0{
			continue
		}
		
		_cur.y = sale_item_y + popouta_float
	}else{
		_cur = shopList[i]
		if _cur = 0{
			continue
		}
		
		if i < top_row_size{
			_cur.y = shop_top_row_y_offset + shop_float
		}else{
			_cur.y = shop_bot_row_y_offset + shop_float
		}
	}
	
	
	if(_cur != 0){
		if point_in_rectangle(mx, my, _cur.x, _cur.y, _cur.x+base_node_width*_cur.xscale, _cur.y+base_node_width*_cur.yscale){
			
			_node = _cur
			
			if(_click){
				if global.money >= _cur.cost{
					if(add_node_to_inventory(_cur)){
						if i = top_row_size+bottom_row_size{
							sale_item = 0
						}else{
							shopList[i] = 0
						}
						global.money -= _cur.cost

						prev_node = _node
						
						//FIX THIS SO THAT THE GUI IS SHOWN !
						repeat(4){
						create_text_gui(_cur.x+base_node_width*_cur.xscale/2,_cur.y+base_node_width*_cur.yscale/2,"$",c_green,false)
						}
					}else{
						show_debug_message("No room")//No room	
					}
				}else{
					//Too poor	
				}
			}
		}
	}
}


show_debug_message(_node)
if _node = prev_node and _node != 0 and _node != -1{

	node_timer --
	if node_timer = 0{
		create_infobox(_node.x+base_node_width*_node.xscale/2 - GUI_INFOBOX_WIDTH/2,_node.y - GUI_INFOBOX_HEIGHT,_node)
	}
	
	if node_timer < 0{
		oInfobox.x = _node.x+base_node_width*_node.xscale/2 - GUI_INFOBOX_WIDTH/2
		oInfobox.y = _node.y - GUI_INFOBOX_HEIGHT
	}
}else{
	if instance_exists(oInfobox){
		if oInfobox.state = INFOBOX_STATE.ENTER{
			with oInfobox{
				switch_state(INFOBOX_STATE.EXIT)
			}
		}
	}
	prev_node = _node
	node_timer = max_node_timer
}
