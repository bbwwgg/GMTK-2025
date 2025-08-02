enum TRANSITION_STATE{
	ENTER,
	EXIT
}

state = TRANSITION_STATE.EXIT


spr = sBoxTransition
sprw = sprite_get_width(spr)
sprh = sprite_get_height(spr)

xmax = VIEW_WIDTH div sprw
ymax = VIEW_HEIGHT div sprh

imax = sprite_get_number(spr)



sub_image_index_inc = sprite_get_speed(spr)/45
sub_image_index = 0

room_to = room_combat

