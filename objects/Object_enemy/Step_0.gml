
hppercent = hp / maxhp * 100 

if(hp <= minhp) {instance_destroy(self)}

vsp += grv;

if(place_meeting(x,y+1,Obj_wall)) { vsp = 0; }
if(place_meeting(x+1,y,Obj_wall)) {hsp = 0; }

y += vsp;
x += hsp;