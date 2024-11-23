if(other.shooter != Obj_Player) // Damaging the player.
{
	hp -= other.damage;
	instance_destroy(other); //Destroying the bullet
}