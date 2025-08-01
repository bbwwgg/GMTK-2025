image_angle += angle

x += hsp
y += vsp

image_alpha -= alpha_change
hsp += hsp_change
vsp += vsp_change

if image_alpha <= 0{
	instance_destroy()
}

depth = -999