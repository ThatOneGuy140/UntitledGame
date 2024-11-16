firetimer--;

x = Obj_Player.x;
y = Obj_Player.y;

switch(Obj_Player.currentweapon)
{
	case "1911":
		sprite_index = Spr_1911;
	break;
	 
	case "M16":
		if(Obj_Player.attackkey && firetimer <= 0) {
			firetimer = 15;
			sprite_index = Spr_M16firing;
			Obj_Player.m16mag =- 1;
			} 
		else{sprite_index = Spr_M16};
	break;
}

image_angle = point_direction(x,y,mouse_x,mouse_y);