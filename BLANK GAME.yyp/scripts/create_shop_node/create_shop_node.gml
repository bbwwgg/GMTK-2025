function create_shop_node(_x,_y,_xscale, _yscale, _shape = 0){
	//exit clause
	if !instance_exists(oShop) {return}
	
	var _id = get_random_command_node_id()
	
	var _raw_node_data;
	with oShop{
		_raw_node_data = command_node_DB[_id]
	}
	show_debug_message("created node")
	var _node =  new node(_id)
	_node.x = _x
	_node.y = _y
	_node.xTo = _x
	_node.yTo = _y
	_node.xFrom = _x
	_node.yFrom = _y
	_node.cost = global.prices[_raw_node_data.rarity][0]
	_node.image_xscale = _xscale
	_node.xscale = _xscale
	_node.image_yscale = _yscale
	_node.yscale = _xscale
	_node.ID = _id
	_node.sprite = _raw_node_data.sprite
	_node.shape = _shape
	_node.color = c_white
	_node.image_index = _shape
	
	return _node
}

/// @function get_random_command_node_id()
/// @desc Rolls a random number and selects a command ID based on rarity weights.
function get_random_command_node_id() {
    var roll = irandom(99); // 0 to 99
    var target_rarity;
    
    if (roll < 10) {
        target_rarity = RARITY.LEGENDARY;
    } else if (roll < 20) {
        target_rarity = RARITY.RARE;
    } else if (roll < 50) {
        target_rarity = RARITY.UNCOMMON;
    } else {
        target_rarity = RARITY.COMMON;
    }

    // Collect all IDs of the chosen rarity
    var matching_ids = [];
    for (var i = 0; i < array_length(command_node_DB); i++) {
        if (command_node_DB[i].rarity == target_rarity) and command_node_DB[i].can_appear_in_shops{
            array_push(matching_ids, i);
        }
    }
    
    // Return a random ID from that rarity
    if (array_length(matching_ids) > 0) {
        return matching_ids[irandom(array_length(matching_ids) - 1)];
    }
    
    return 0; // No matching rarity found
}