despawn--;

vsp = grv;

if (place_meeting(x,y+vsp,Obj_wall)) { vsp = 0;}

y += vsp;

if(despawn <= 0) {instance_destroy();}

if(image_angle > 90 && image_angle < 270) {image_yscale = -1;} 
else { image_yscale = 1; }