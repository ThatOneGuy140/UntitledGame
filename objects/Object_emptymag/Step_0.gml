despawn--;

vsp = grv;

if (place_meeting(x,y+vsp,Obj_wall)) { vsp = 0;}

y += vsp;

if(despawn <= 0) {instance_destroy();}