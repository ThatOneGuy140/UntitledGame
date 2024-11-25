reloadtimer--;
firetimer--;

x = owner.x; //keeping position synced with objects owner
y = owner.y;

if(distance_to_object(target) <= 1024) // If the target (Player) is within 1024 pixels
{
	image_angle = point_direction(x,y,target.x,target.y); //Pointing weapon in direction of player
	if(image_angle > 90 && image_angle < 270) {image_yscale = -1;} //Making the gun face the right direction
	else { image_yscale = 1; }
	
	if(mag > 0 && reloadtimer <= 0 && firetimer <= 0) //Firing
	{
		with(instance_create_layer(x,y,"Instances",Object_bullet))
		{
			shooter = Object_enemy;
			speed = 25;
			damage = 5;
			direction = other.image_angle + random_range(1,5);
			image_angle = direction;
		}
		sprite_index = Spr_M16firing;
		firetimer = 10;
		mag -= 1;
	}
	
	if(mag <= 0) {reloadtimer = 120; mag = magcap; sprite_index = Spr_M16reload;}
	if(reloadtimer = 120)
	{
		with(instance_create_layer(x,y,"Randomshit",Object_emptymag)) { sprite_index = Spr_M16mag; image_angle = other.image_angle }
	}
	
}
