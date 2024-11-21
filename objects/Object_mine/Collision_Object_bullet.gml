
if(other.shooter == Obj_Player && detonated = false)
{
	detonated = true;
	instance_destroy(other);
}