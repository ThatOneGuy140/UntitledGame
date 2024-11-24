
//Finding the player
var xgoal = Obj_Player.x;
var ygoal = Obj_Player.y;

if(point_distance(x,y, xgoal,ygoal) > 64) //Changing path if player is a tile away
{
	if(path_exists(path)) path_clear_points(path); //Removing the path if conditions are met

	//Finding a new path
	if(mp_grid_path(grid,path,x,y,xgoal,ygoal,true))
	{
		path_start(path,3,path_action_stop,false);
	}

}





hppercent = hp / maxhp * 100 

if(hp <= minhp) {instance_destroy(self)}

vsp += grv;

if(place_meeting(x,y+1,Obj_wall)) { vsp = 0; }
if(place_meeting(x+1,y,Obj_wall)) {hsp = 0; }

y += vsp;
x += hsp;