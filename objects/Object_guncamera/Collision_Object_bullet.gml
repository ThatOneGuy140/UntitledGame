
if(other.shooter = Obj_Player && destroyed == false)
{
	hp -= other.damage;
	instance_destroy(other);
}