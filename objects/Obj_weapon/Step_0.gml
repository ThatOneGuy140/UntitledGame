
#region Timers
firetimer--;
reloadtimer--;
if(recoil > 0) {recoil--};
#endregion

x = Obj_Player.x;
y = Obj_Player.y;

switch(Obj_Player.currentweapon) // This is probably not optimal code but I dont feel like using multiple switch statements in the same script.
{
	#region 1911
	case "1911":
		
		if(Obj_Player.attackkey && Obj_Player.mag1911 > 0 && reloadtimer <= 0 && firetimer <= 0) //FIring
		{
			Obj_Player.mag1911 = Obj_Player.mag1911 - 1;
			with(instance_create_layer(x,y,"Instances",Object_bullet)) //FIring bullet
			{
				shooter = Obj_Player; // Declares who shot the bullet
				type = "1911" // Weapon type
				damage = 15;
				speed = 20;
				direction = other.image_angle + random_range(1,3); // Random spread of 3 pixels
				image_angle = direction;
			}
			firetimer = 15; // 15 frame delay between shots
			recoil = 4 // 4 Pixel recoil
		}
		
		if(Obj_Player.reloadkey && reloadtimer <= 0) //Reloading
		{
			Obj_Player.mag1911 = Obj_Player.mag1911cap; // Resetting mag
			reloadtimer = 50; // 50 frame reload time 
			with(instance_create_layer(x,y,"Randomshit",Object_emptymag)) {sprite_index = Spr_M16mag }; // Spawns empty mag
		}
	
		sprite_index = Spr_1911;
	break;
	#endregion
	
	#region MP5
	case "MP5":
		if(Obj_Player.attackkey && firetimer <= 0 && reloadtimer <= 0 && Obj_Player.mp5mag > 0)
		{
			Obj_Player.mp5mag = Obj_Player.mp5mag - 1;
			recoil = 4;
			with(instance_create_layer(x,y,"Instances",Object_bullet))
			{
				shooter = Obj_Player; // Declaring who shot
				type = "MP5"; //Somewhat redundant variable
				damage = 3; // 3 Damage
				speed = 23; //23 pixel per second speed
				direction = other.image_angle + random_range(1,7); // High bullet spread of 7 pixels
				image_angle = direction;
			}
			firetimer = 3.5; // Fast firing rate 3.5 frame delay
		}
		
		if(Obj_Player.reloadkey && reloadtimer <= 0)
		{
			Obj_Player.mp5mag = Obj_Player.mp5magcap;
			reloadtimer = 90; // 90 frame reload time (A second and a half)
			with(instance_create_layer(x,y,"Instances",Object_emptymag)) { sprite_index = Spr_M16mag };
		}
		
	#endregion
	 
	 #region M16
	case "M16":
		if(Obj_Player.attackkey && firetimer <= 0 && Obj_Player.m16mag > 0 && reloadtimer <= 0) //Triggering shooting animation
			{
			Obj_Player.m16mag = Obj_Player.m16mag - 1; //Removes one bullet from mag
			sprite_index = Spr_M16firing; // Changes to firing sprite
			recoil = 7;
			
			with (instance_create_layer(x,y,"Instances",Object_bullet)) { //Creating bullet
				shooter = Obj_Player;
				type = "M16";
				damage = 10;
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
			with(instance_create_layer(x,y,"Randomshit",Object_emptymag)) { sprite_index = Spr_M16mag; image_angle = other.image_angle; }
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