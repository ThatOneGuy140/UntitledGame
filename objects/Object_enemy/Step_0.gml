jumpdelay--;

//Finding the player
var xgoal = Obj_Player.x;
var ygoal = Obj_Player.y;

if(point_distance(x,y, xgoal,ygoal) > 64) //Changing path if neededd
{
	if(path_exists(path)) path_clear_points(path); //Removing the path if conditions are met

	//Finding a new path
	if(mp_grid_path(grid,path,x,y,xgoal,ygoal,true)) //Making new path
	{
		path_position = 0;
	}
}

//Following the path
if(path_exists(path))
{
	path_position += 0.5 //Change this if needed for speed
	var nextx = path_get_x(path, path_position);
	var nexty = path_get_y(path,path_position);
	
	//Moving
	//Basically checking if the next planned x position is less or greater than the current x position and moving accordingly
	if(nextx > x) hsp =3; // Right
	else if(nextx < x) hsp = -3 // Left
	else hsp = 0;
	
	//Gravity and jumping
	vsp += grv;
	if(place_meeting(x,y+1,Obj_wall)) //Vertical collision
	{
		vsp = 0; 
		if(nexty < y && jumpdelay <= 0) {
			vsp = -10;  //Jumping if needed
			jumpdelay = 120;
		}
	}
	
	if(!place_meeting(x,y+vsp,Obj_wall))
	{
		y += vsp;
	} else {
		while(!place_meeting(x,y+sign(vsp), Obj_wall))
		{
			y += sign(vsp); // FIxing collision
		}
		vsp = 0;
	}
	
	//Horizontal movement and collision
	if(!place_meeting(x+hsp,y,Obj_wall))
	{
		x += hsp; //Applying speed
	} else
	{
		while(!place_meeting(x+sign(hsp),y,Obj_wall))
		{
			x += sign(hsp);
		}
		hsp = 0;
	}


}


hppercent = hp / maxhp * 100 

if(hp <= minhp) {
	Obj_Player.killcount += 1;
	instance_destroy(self);
	instance_destroy(weaponitem);
	
	}  //Destroying self and assigned weapon once hp <= 0
