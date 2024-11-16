firetimer--;

x = Obj_Player.x;
y = Obj_Player.y;

switch(Obj_Player.currentweapon) // This is probably not optimal code but I dont feel like using multiple switch statements in the same script.
{
	case "1911":
		sprite_index = Spr_1911;
	break;
	 
	case "M16":
		if(Obj_Player.attackkey && firetimer <= 0 && Obj_Player.m16mag > 0) //Triggering shooting animation
			{
			Obj_Player.m16mag = Obj_Player.m16mag - 1; //Removes one bullet from mag
			sprite_index = Spr_M16firing;
			firetimer = 5; // 5 frame delay for firing
			}
		else{sprite_index = Spr_M16};
	break;
}

image_angle = point_direction(x,y,mouse_x,mouse_y);