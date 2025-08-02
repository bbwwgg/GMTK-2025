function create_infobox(_x,_y,_node){
	
	
	var _scale = GUI_INFOBOX_WIDTH / sprite_get_width(sInfobox)
	
	var _db_entry = command_node_DB[_node.ID]
	
	_x = clamp(_x,0,VIEW_WIDTH-GUI_INFOBOX_WIDTH)
	_y = clamp(_y,0,VIEW_HEIGHT-GUI_INFOBOX_HEIGHT)
	
	
	with instance_create_layer(_x,_y,"GUI",oInfobox){
		
		name = "[fa_center]"
		
		if struct_exists(_db_entry,"name"){
			name += _db_entry.name
		}else{
			name += "name"
		}
		
				
		if struct_exists(_db_entry,"description"){
			description = _db_entry.description
		}else{
			description = "No description"
		}
		
		name = scribble(name)
		description = scribble(description)
	
		name.scale_to_box((INFOBOX_NAME_WIDTH)*_scale,(INFOBOX_NAME_HEIGHT)*_scale,true)
		description.fit_to_box((INFOBOX_NAME_WIDTH)*_scale,(INFOBOX_NAME_HEIGHT)*_scale)
	
		image_index = _db_entry.rarity
	}
		
}