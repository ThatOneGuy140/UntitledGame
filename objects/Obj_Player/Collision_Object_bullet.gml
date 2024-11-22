if(other.shooter != Obj_Player)
{
	hp -= other.damage;
	instance_destroy(other);
}