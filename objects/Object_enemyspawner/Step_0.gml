spawndelay--;

distancecheck = distance_to_object(Object_enemy) > 720;

if(spawndelay <= 0 && distancecheck){
	with(instance_create_layer(x,y,"Instances",Object_enemy))
	{
		maxhp = 75;
		setweapon = true;
		weapon = "1911";
	}
	spawndelay = 600;
}