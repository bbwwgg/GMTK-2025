function create_debris(_x, _y){
	with instance_create_layer(_x, _y - MAP_TILE_H/2, "effects", oEffect){
		sprite_index = sHitDebris
		
		vsp = random_range(-4,0.2)
		
		vsp_change = 0.2
		
		hsp = random_range(-1.5,1.5)
		
		angle = random_range(-10,10)
		
		image_index = irandom(3)
		
		image_xscale = 0.25
		image_yscale = 0.25
		
		alpha_change = 0.01
	}
}