function add_node_to_inventory(_node){
	
	if !instance_exists(oGameController){return false}
	
	with oGameController{
		if ds_list_size(command_node_inventory) >= max_inventory_nodes{
			show_debug_message("No more space for this!")
			return false
		}
	
	
		ds_list_add(command_node_inventory, _node)
		
		return true
	}
}