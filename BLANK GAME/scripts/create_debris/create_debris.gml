function create_debris(_x, _y){
	with instance_create_layer(_x, _y - MAP_TILE_H/2, "effects", oEffect){
		sprite_index = sHitDebris
		
		vsp = random_range(-9,3)
		
		vsp_change = 0.6
		
		hsp = random_range(-2,2)
		
		angle = random_range(-10,10)
		
		image_index = irandom(3)
		
		image_xscale = 0.25
		image_yscale = 0.25
		
		alpha_change = 0.01
	}
}