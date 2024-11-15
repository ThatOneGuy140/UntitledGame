draw_self();
if(hp < maxhp){
	draw_healthbar(x-50,y-75,x+50,y-60, hppercent ,c_black,c_red,c_lime,0, true, true);
}