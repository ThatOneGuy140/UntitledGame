owner = "none";
target = "none";

reloading = false;
firetimer = 0;
reloadtimer = 0;
recoil = 0;

defaultweapon = "M16";
if(owner == "none") {weapon = defaultweapon;}
else { weapon = owner.weapon }; 

weaponchecked = false;

switch(weapon)
{
	case "M16":
		magcap = 30;
	break;
	
	case "1911":
		magcap = 7;
	break;
}

mag = magcap;