var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
if(pressed = true){
	
	var active = false
	counter--
if (counter == 0){
	counter = 20;
	
	active = true;
}

if (active == true && (NodeNumber < objStart.numNodes)){
switch ds_list_find_value(objStart.nodes, NodeNumber).nodeType{
case 0:
global.number +=10
break;
case 1:
global.number += 5
break;
case 2:
counter += 5
break;
case 3:
counter += 50
break;
case 4:
global.number -=10
break;
}
NodeNumber++
if (NodeNumber >= objStart.numNodes){
pressed = false	

}

}



}else{
image_index = 0	
counter = 20
NodeNumber = 0
}

if (mouse_check_button(mb_left)) {
    if (point_in_rectangle(mx, my, bbox_left, bbox_top, bbox_right, bbox_bottom)) {
		global.number = 0;
		pressed = true
		image_index = 1;
	}
}