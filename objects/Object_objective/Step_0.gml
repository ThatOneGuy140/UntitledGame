
switch(objective)
{
	case "collide":
		if(place_meeting(x,y,Obj_Player)) { room_goto_next(); }
	break;
}