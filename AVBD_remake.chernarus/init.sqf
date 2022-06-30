enableSaving [false, false];

//Zombie aggro radius (random between min and max)
AVBD_minaggroradius=10;
AVBD_maxaggroradius=150;

//At what range from a player zombies can spawn and despawn
//Minimum's function is mostly protecting players at start
AVBD_minspawndist=200;
AVBD_maxspawndist=600;
AVBD_despawndist=AVBD_maxspawndist+100;

//Distance from victim at which a non-horde zombie gives up the chase
AVBD_chasegiveupdist=450;

//Zombie will pick a random victim within this radius from the nearest target
//Value of 1 or below is multiplier of aggro radius, 0 disables randomization
AVBD_randomvictimradius=0.333;

//Motorized vehicle aggro radius multiplier
AVBD_vehicleaggromultiplier=1;

//Unarmed aggro radius multiplier
AVBD_unarmedaggromultiplier=0.2;

//Default zombies per km^2 in grid-based generators
AVBD_defaultdensity=5;

//Minimum and maximum interval between spawning random hordes
AVBD_randomhordemininterval=180;
AVBD_randomhordemaxinterval=600;

//Minimum and maximum random horde spawning distance from player group
AVBD_randomhordeminspawndist=150;
AVBD_randomhordemaxspawndist=450;

//Minimum and maximum number of zombies in a random horde
AVBD_randomhordeminamount=1;
AVBD_randomhordemaxamount=40;

//Groups reserved for hordes - allows hordes to spawn in very crowded areas
AVBD_hordereservedgroups=80;

//Chance of zombie spawning with a lootable bandage
AVBD_zombiebandagechance=0.04;

//Debug mode - show markers for prepared positions and active zombies
AVBD_debug=true;

[1,["auldale",0,323,0.35], ["didge",0,97,0.35], ["epistel",0,65,0.35], ["gyer",0,130,0.25],["Fallout",0,207,0.35], ["bad",0,6,0.35], ["ambient_1",0,83,0.35], ["cradle",0,367,0.35],["kurshok",0,210,0.35],["pavelock",0,121,0.35],["oldquarter",0,257,0.35],["Wasteland",0,195,0.35]] execVM "cly_jukebox.sqf";

_light = [] execVM "light.sqf";

setWind [-2,2,true];