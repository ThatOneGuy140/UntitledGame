spawndelay--;

if(spawndelay <= 0){
	with(instance_create_layer(x,y,"Instances",Object_enemy))
	{
		hp = 75;
		weapon = "1911";
	}
	spawndelay = 600;
}