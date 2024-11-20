if(other.shooter = Obj_Player) //Checks if colliding bullet is owned by the player
{
	hp -= other.damage; //Reducing the health depending on the bullets damage
	instance_destroy(other); //Destroying the bullet
}