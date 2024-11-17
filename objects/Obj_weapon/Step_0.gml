firetimer--;
reloadtimer--;
if(recoil > 0) {recoil--};

x = Obj_Player.x;
y = Obj_Player.y;

switch(Obj_Player.currentweapon) // This is probably not optimal code but I dont feel like using multiple switch statements in the same script.
{
	case "1911":
		sprite_index = Spr_1911;
	break;
	 
	 #region M16
	case "M16":
		if(Obj_Player.attackkey && firetimer <= 0 && Obj_Player.m16mag > 0 && reloadtimer <= 0) //Triggering shooting animation
			{
			Obj_Player.m16mag = Obj_Player.m16mag - 1; //Removes one bullet from mag
			sprite_index = Spr_M16firing; // Changes to firing sprite
			recoil = 5;
			
			with (instance_create_layer(x,y,"Instances",Object_bullet)) { //Creating bullet
				shooter = Obj_Player;
				speed = 25; // Moves at 25 pixels a second
				direction = other.image_angle + random_range(1,5); // Sets direction to the angle of the gun
				image_angle = direction; // Sets bullet angle to gun angle
			}
			
			firetimer = 5; // 5 frame delay for firing

			}
			
			
		else if(Obj_Player.reloadkey && reloadtimer <= 0) //Reloading
		{
			Obj_Player.m16mag = Obj_Player.m16magcap; //Godamnit I should have assigned these variables to the gun object, too late
			reloadtimer = 110;
		}
		
		else if(reloadtimer > 0) {sprite_index = Spr_M16reload;} // Checking if the player is reloading and setting the sprite accordingly
		
		else{sprite_index = Spr_M16}; // If all other possiblities are false, set to default sprite
	break;
	#endregion
}

if(image_angle > 90 && image_angle < 270) {image_yscale = -1;} //Making the gun face the right direction
else { image_yscale = 1; }

x = x - lengthdir_x(recoil,image_angle);
y = y - lengthdir_y(recoil,image_angle); 

image_angle = point_direction(x,y,mouse_x,mouse_y);