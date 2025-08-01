function create_node(_x,_y, _id, _shape = 0){
	//exit clause
	if !instance_exists(oGameController) {return}
	var _raw_node_data;
	with oGameController{
		_raw_node_data = command_node_DB[_id]
	}
	
	var _node =  new node(_id)
	
	_node.ID = _id
	_node.sprite = _raw_node_data.sprite
	_node.shape = _shape
	_node.color = c_white
	_node.image_index = _shape
	
	return _node
}

function randomize_new_node(){
	//Rarities
	var _roll = irandom(100)
	
	
	
}
