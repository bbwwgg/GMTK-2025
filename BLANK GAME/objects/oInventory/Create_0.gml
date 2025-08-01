command_node_database()
show_debug_message("oInventory" + string(global.numberCounter))
nodes_list = ds_list_create()
for(var i = 0; i < array_length(global.command_node_DB); i++){
	var node = global.command_node_DB[i];
	if (node.amount > 0){
		ds_list_add(nodes_list, node)
	}

}
selectedItem = 0;
loop = true;
currentPage = 0;// current page, self explanatory, add 2
global.mouse_clicked_handled = false;
remainder = ds_list_size(nodes_list)%3;
height = ((ds_list_size(nodes_list)-remainder)/3)+1;//pages
width = 3;
pages = string(currentPage) + "/" + string(height);
digitX =  (x+55) - (string_width(pages)*3);
grid = array_create(height)
for (var i = 0; i < height; i++){
	if (i = height - 1){
	grid[i] = array_create(remainder);
	}else{
    grid[i] = array_create(width);
	}
}