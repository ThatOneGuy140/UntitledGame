spawndelay--;

distancecheck = distance_to_object(Object_enemy) > 256;

if(spawndelay <= 0 && distancecheck){
	with(instance_create_layer(x,y,"Instances",Object_enemy))
	{
		hp = 75;
	}
	spawndelay = 600;
}