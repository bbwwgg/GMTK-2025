enum INFOBOX_STATE{
	ENTER,
	EXIT
}

function switch_state(_state){
	if _state != state{
	state = _state
	time = 0
	}
}

state = -1
switch_state(INFOBOX_STATE.ENTER)

name = scribble("[fa_center]Name")

description = ""

time = 0
time_to = 15



image_speed = 0

image_xscale = GUI_INFOBOX_WIDTH / sprite_get_width(sInfobox)
image_yscale = image_xscale


name.scale_to_box((INFOBOX_NAME_WIDTH)*image_xscale,(INFOBOX_NAME_HEIGHT)*image_yscale,true)
name.fit_to_box((INFOBOX_NAME_WIDTH)*image_xscale,(INFOBOX_NAME_HEIGHT)*image_yscale,true)
