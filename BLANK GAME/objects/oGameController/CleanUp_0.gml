/*for(var i = 0; i < array_length(step_command); i ++){
	if !is_undefined(step_command){
		ds_priority_destroy(step_command[i])
	}
}
*/
if ds_exists(entity_map,ds_type_grid){
	ds_grid_destroy(entity_map)
}