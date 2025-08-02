

if ds_exists(entity_map,ds_type_grid){
	ds_grid_destroy(entity_map)
}

if ds_exists(command_node_inventory,ds_type_list){
ds_list_destroy(command_node_inventory)
}
