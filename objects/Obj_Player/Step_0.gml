#region TImers
hittimer--;
#endregion

// Pee is stored in the balls

#region Keyboard Input
moveleft = keyboard_check(ord("A")) || keyboard_check(vk_left);
moveright = keyboard_check(ord("D")) || keyboard_check(vk_right);
jump = keyboard_check(vk_space);
debug  = keyboard_check(vk_shift);
itemselect1 = keyboard_check(ord("1"));
itemselect2 = keyboard_check(ord("2"));
itemselect3 = keyboard_check(ord("3"));
attackkey = keyboard_check(ord("E")) || mouse_check_button(1);
reloadkey = keyboard_check(ord("R"));
pausekey = keyboard_check(vk_escape);
#endregion

#region Movement
var move = moveright - moveleft; // Outputs 1, 0 , Or -1 depending on what is being pressed.
hsp = move * spd; // Applying speed
//Jumping
if(place_meeting(x,y+1,Obj_wall &&  jump)) { vsp -= jumpheight};

//Horizontal collision
if (place_meeting(x+hsp,y,Obj_wall)) { hsp = 0;}

//Gravity
vsp += grv;

//Verticle collision
if (place_meeting(x,y+vsp,Obj_wall)) { vsp = 0;}


x += hsp;  //Leave this at the bottom of movement code 
y += vsp;

#endregion

#region Health System

lasthp = hp;

if(debug && hp > 0) {hp -= 2}; 
hppercent = hp / maxhp * 100  //See "Draw" event

if(hp < maxhp && hittimer <= 0)
{
	hp += regenrate *2;
}


if(hp > maxhp) { hp = maxhp};

if(hp <= 0) { room_restart() };
#endregion

#region Weapons

//Equipping weapons
if(itemselect1){ currentweapon = "1911"};
if(itemselect2){ currentweapon = "MP5"};
if(itemselect3){ currentweapon = "M16"};


#endregion

//Pausing

if(pausedelay <= 0 && pausekey)
{
	pausedelay = 60;
}