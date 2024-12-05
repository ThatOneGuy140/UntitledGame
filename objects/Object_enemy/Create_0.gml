
#region Variables
alive = true;
maxhp = 75;
minhp = 0;
hp = maxhp;
weaponitem = "none";
defaultweapon = "M16";
setweapon = false;
if(setweapon == false) { weapon = defaultweapon };

jumpdelay = 0;
movespd = 3
vsp = 0;
hsp = 0;
grv = 0.4
#endregion

with(instance_create_layer(x,y,"Randomshit",Object_enemyweapon)) //Creating weapon
{
	target = Obj_Player;
	owner = other
	other.weaponitem = self;
	weapon = other.weapon;
}

//Making a grid for the enemy to follow (Pathfinding)

grid = mp_grid_create(0,0,room_width / 64, room_height / 64,64,64) //Creating the grid(Tiles are 64x64)
mp_grid_add_instances(grid,Obj_wall,true); // Detecting obstacles in grid
path = path_add();