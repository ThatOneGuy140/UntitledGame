firetimer--;

if(distance_to_object(Obj_Player) < distancevisiblex && firetimer <= 0)
{
	firetimer = 15;
	with(instance_create_layer(x,y,"Instances",Object_bullet))
	{
		shooter = Object_guncamera;
		speed = 25;
		damage = 10;
		direction = other.image_angle;
		image_angle = direction;
	}
}