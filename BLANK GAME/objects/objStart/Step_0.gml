numNodes = ds_list_size(nodes)
// Mouse position in GUI space

if(instance_exists(objNode)){
if ( global.selected_node != noone  ){
if(collision_rectangle(bbox_left, bbox_top, bbox_right+(105*numNodes), bbox_bottom, global.selected_node, false, false)){
	
	if (global.selected_node.added = false){
		//adds to the start function
		ds_list_add(nodes, global.selected_node)
		global.selected_node.added = true;
	}
	var pos = ds_list_find_index(nodes, global.selected_node)
	global.selected_node.x = x +(105 + 105*pos)
	global.selected_node.y = y
	
}
if(!collision_rectangle(bbox_left, bbox_top, bbox_right+(105*numNodes), bbox_bottom,  global.selected_node, false, false) &&  global.selected_node.added = true){
 global.selected_node.added = false
var pos = ds_list_find_index(objStart.nodes,  global.selected_node)
for (var i = numNodes - 1; i >= pos; i--) {
	ds_list_find_value(nodes, i).added = false
    ds_list_delete(nodes, i);
}
}
}
}