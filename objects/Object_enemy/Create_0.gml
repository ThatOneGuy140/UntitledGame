
#region Variables
alive = true;
maxhp = 75;
minhp = 0;
hp = maxhp;

movespd = 3
vsp = 0;
hsp = 0;
grv = 0.4
#endregion

//Making a grid for the enemy to follow (Pathfinding)

grid = mp_grid_create(0,0,room_width / 64, room_height / 64,64,64) //Creating the grid(Tiles are 64x64)
mp_grid_add_instances(grid,Obj_wall,true); // Detecting obstacles in grid
path = path_add();