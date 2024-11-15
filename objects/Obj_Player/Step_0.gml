// Checking keyboard input 
moveleft = keyboard_check(ord("A"));
moveright = keyboard_check(ord("D"));
jump = keyboard_check(vk_space);
debug  = keyboard_check(vk_shift);
itemselect1 = keyboard_check(ord("1"));
itemselect2 = keyboard_check(ord("2"));
itemselect3 = keyboard_check(ord("3"));

// Movement
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

//Health System
if(debug && hp > 0) {hp -= 2}; 
hppercent = hp / maxhp * 100  //See "Draw" event

if(hp < maxhp) // Regen is faster depending on amount of health
{
	
	if(hp < maxhp / 4){
		hp += regenrate * 2;
	}
	
	if(hp < maxhp / 3){
		hp += regenrate * 1.5;
	}
	
	if(hp < maxhp / 2){
		hp += regenrate * 1.25;
	}
	
	if(hp < maxhp) {
		hp += regenrate;
	}
	
}

if(hp > maxhp) { hp = maxhp};

if(hp <= 0) { room_restart() };

//Weapon equip

if(itemselect1){ currentweapon = "1911"};
if(itemselect2){ currentweapon = "MP5"};
if(itemselect3){ currentweapon = "M16"};
