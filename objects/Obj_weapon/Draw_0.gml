draw_self();

switch(Obj_Player.currentweapon)
{
	case "1911":
	draw_text(x+35,y+10,Obj_Player.mag1911);
	break;
	
	case "M16":
	draw_text(x+35,y+10,Obj_Player.m16mag);
	break;
	
	case "MP5":
	draw_text(x+35,y+10,Obj_Player.mp5mag);
	break;
}