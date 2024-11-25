firetimer--;

hppercent = hp / maxhp * 100
if(hp <= 0) {destroyed = true }

if(distance_to_object(Obj_Player) < distancevisiblex && firetimer <= 0 && destroyed == false)
{
	firetimer = 15;
	with(instance_create_layer(x,y,"Instances",Object_bullet))
	{
		shooter = Object_guncamera;
		speed = 25;
		damage = 10;
		direction = other.image_angle + random_range(1,3);
		image_angle = direction;
	}
}

if(firetimer > 0) { sprite_index = Spr_guncamerafiring }
else if(destroyed) { sprite_index = Spr_guncameradestroyed}
else { sprite_index = Spr_guncameraidle }