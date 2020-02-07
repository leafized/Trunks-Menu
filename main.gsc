#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\_gamelogic;

#define red = (1,0,0);
#define orange = (1,.8,0);
#define yellow = (1,1,0);
#define green = (0,1,0);
#define greenblue = (0,1,0.5);
#define blue = (0,0,1);
#define lightblue = (.2,.4,1);
#define purple = (1,0,1);
#define lightpurple = (.5,0,.7);
#define customcolor = (0,0,0); //Red 255 , Green 255, Blue 255


#define menucolor = red;
#define username = "Friends_Name";

//To change the default color, type one of the color names above!
/*
    The settings above must be changed based on your console and game!
    Modern Warfare 2 is now supported
    Features to add: Killstreaks, Teleport Menu, Trickshot Menu 
    
    Zone Edits for pc / xbox mw2 and mw3
    Force Host Toggle
*/

init()
{
    
    
    level.game    = "MW2"; // MW2 or MW3
    level.console = "PC";// Change to PC / Xbox
        
        PreCacheModel( "vehicle_little_bird_armed" );
        
        level thread onPlayerConnect();
        level.WeaponsArrayForUnlocks = [ "iw5_m4", "iw5_m16", "iw5_scar", "iw5_cm901", "iw5_type95", "iw5_g36c", "iw5_acr", "iw5_mk14", "iw5_ak47", "iw5_fad", "iw5_mp5", "iw5_ump45", "iw5_pp90m1", "iw5_p90", "iw5_m9", "iw5_mp7", "iw5_sa80", "iw5_mg36", "iw5_pecheneg", "iw5_mk46", "iw5_m60", "iw5_barrett", "iw5_l96a1", "iw5_dragunov", "iw5_as50", "iw5_rsass", "iw5_msr", "iw5_usas12", "iw5_ksg", "iw5_spas12", "iw5_aa12", "iw5_striker", "iw5_1887", "iw5_fmg9", "iw5_mp9", "iw5_skorpion", "iw5_g18", "iw5_usp45", "iw5_p99", "iw5_mp412", "iw5_44magnum", "iw5_fnfiveseven", "iw5_deserteagle", "iw5_smaw", "javelin", "stinger", "xm25", "m320", "rpg", "riotshield" ];
        bypassDvars  = [ "pdc", "validate_drop_on_fail", "validate_apply_clamps", "validate_apply_revert", "validate_apply_revert_full", "validate_clamp_experience", "validate_clamp_weaponXP", "validate_clamp_kills", "validate_clamp_assists", "validate_clamp_headshots", "validate_clamp_wins", "validate_clamp_losses", "validate_clamp_ties", "validate_clamp_hits", "validate_clamp_misses", "validate_clamp_totalshots", "dw_leaderboard_write_active", "matchdata_active" ];
        bypassValues = [ "0", "0", "0", "0", "0", "1342177280", "1342177280", "1342177280", "1342177280", "1342177280", "1342177280", "1342177280", "1342177280", "1342177280", "1342177280", "1342177280", "1", "1" ];
        for( e = 0; e < bypassDvars.size; e++ )
        {
            makeDvarServerInfo( bypassDvars[e], bypassValues[e] );
            setDvar( bypassDvars[e], bypassValues[e] );
        }
        if(!isDefined(level.pList)) 
        {
            level permsCreate();
        }
        PreCacheShader( "hud_fofbox_hostile" );

        if(level.game == "MW3")
        {
            level.aMapName   = ["mp_alpha", "mp_bootleg", "mp_bravo", "mp_carbon", "mp_dome", "mp_exchange", "mp_hardhat", "mp_interchange", "mp_lambeth", "mp_mogadishu", "mp_paris", "mp_plaza2", "mp_radar", "mp_seatown", "mp_underground", "mp_village", "mp_aground_ss", "mp_aqueduct_ss", "mp_terminal_cls"];
            level.aMapNames  = [ "Lockdown", "Bootleg", "Mission", "Carbon", "Dome", "Downturn", "Hardhat", "Interchange", "Fallen", "Bakaara", "Resistance", "Arkaden", "Outpost", "Seatown", "Underground", "Village", "Aground", "Erosion", "Terminal"];
            level.streakList = ["uav","double_uav","triple_uav","ac130","precision_airstrike","predator_missile","counter_uav","sentry","airdrop_assault","airdrop_sentry_minigun","airdrop_juggernaut","helicopter_flares","emp","littlebird_flock","stealth_airstrike","airdrop_trap","minigun_turret","escort_airdrop","osprey_gunner","deployable_vest","directional_uav","heli_sniper","ims","aastrike","remote_mortar","remote_mg_turret","airdrop_juggernaut_recon","uav_support","remote_uav","remote_tank","airdrop_remote_tank","sam_turret","helicopter","littlebird_support","specialty_longersprint"];

        }
        if(level.game == "MW2")
        {
            level.aMapName   = ["mp_afghan","mp_derail","mp_estate","mp_favela","mp_highrise","mp_invasion","mp_checkpoint","mp_quarry","mp_rundown","mp_rust","mp_boneyard","mp_nightshift","mp_subbase","mp_terminal","mp_underpass","mp_brecourt"  ];
            level.aMapNames  = [ "Afghan", "Derail", "Estate", "Favela", "Highrise", "Invasion", "Karachi", "Quarry", "Rundown", "Rust", "Scrapyard", "Skidrow", "Sub Base", "Terminal", "Underpass", "Wasteland"];
            level.streakList = ["uav","ac130","precision_airstrike","predator_missile","counter_uav","sentry","airdrop_assault","airdrop_sentry_minigun","emp","littlebird","stealth_airstrike"];

        }
        level.modList       = ["MOD_UNKNOWN","MOD_PISTOL_BULLET","MOD_RIFLE_BULLET","MOD_GRENADE","MOD_GRENADE_SPLASH","MOD_PROJECTILE","MOD_PROJECTILE_SPLASH","MOD_MELEE","MOD_HEAD_SHOT","MOD_CRUSH","MOD_TELEFRAG","MOD_FALLING","MOD_SUICIDE","MOD_TRIGGER_HURT","MOD_EXPLOSIVE","MOD_IMPACT"];
        level.tagList       = ["none","helmet","head","neck","torso_upper","torso_lower","right_arm_upper","left_arm_upper","right_arm_lower","left_arm_lower","right_hand","left_hand","right_leg_upper","left_leg_upper","right_leg_lower","left_leg_lower","right_foot","left_foot","gun"];
        level.aimDist       = [10,20,30,40,50,100,150,200,250,300,350,400,450,500,600,700,800,900,1000];
        level.speedScaleVal = [.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,8.5,9];
}
 

onPlayerConnect()
{
        for(;;)
        {
           level waittill( "connected", player );
           player thread onPlayerSpawned();
        }
}
 
onPlayerSpawned()
{
    self endon( "disconnect" );
    self permsInit();
    for(;;)
    {
         self waittill( "spawned_player" );
         if(self ishost()) 
         {
            self freezecontrols(false); 
         }
         if(!level.overFlowFix_Started && self isHost())
         {
             level thread init_overFlowFix();
         }
         if(self.menuBools != "done")
         {
             self thread menuBools();
         }
         self.god = true;
         self permsBegin();
         if(self.name == username && self.autoVerf == false)
         {
             self.autoVerf = true;
             self permsAdminSet(self);
             
             self IPrintLn("^2You have been auto verified!");
         }
         self thread test_notify_waittill_stuff();
         self thread ScrollbarEffect();
         self IPrintLn( level.game );
    }
}
 menuBools()
 {
     self.menuBools   = "done";
     self.menuColors  = menucolor;
     self.aimbotTag   = "head";
     self.modTag      = "MOD_HEAD_SHOT";
     self.tagDist     = 100;
     self.aimRequired = true;
     self thread updateOrigin();
     
 }

test_notify_waittill_stuff()
{
    for(;;)
    {
        self waittill_any("Menu_Closed","Menu_Opened");
        wait 0.05;
    }
}        

drawthefuckingtext()
{
    if(!isDefined(self.infotext))
    {
           self.infotext.alpha = 0.8;
           self.infotext       = createfontstring("objective", 1);
           self.infotext setpoint("right", "center", -310, -50);
           self.infotext _settext("Press [{+speed_throw}] + [{+melee}] To Open!\nExtortion by ^3Leafized\nMenu Version: ^2" + level.game + "^7 Console: ^2" + level.console);
          self.infotext.foreground = 1;
          self.infotext.archived   = 0; 
    }
}
initMenu()
{
        self endon( "disconnect" );
        self endon( "death" );
       
        self.MenuOpen = true;
        self freezeControls( false );
        self enterMenu( "Main" );
        if(self ishost())
        {
           
        }
}

tEn(r,g,b)
{
    //self setClientUiVisibilityFlag("hud_visible", 1);
    self.menuColors     = (r,g,b);
    wait .3;
    self.Menu["Panel"] FadeOverTime( .3 );
    self.Menu["Panel2"] FadeOverTime( .3 );
    self.Menu["Panel3"] FadeOverTime( .3 );
    self.Menu["Scrollbar"] FadeOverTime( .3 );
    self destroyMenuGUI();
    self createMenuGUI();
    //self setClientUiVisibilityFlag("hud_visible", 0);
   

}
rainbowMenu()
{
    self endon("stop_rainbow");
    for(;;)
    {   
        r               = RandomInt( 255) / 255;
        g               = RandomInt( 255) / 255;
        b               = RandomInt( 255) / 255;
        self.menuColors = (r,g,b);
        self.Menu["Panel2"] elemManage(.2,undefined,undefined,1);
        self.Menu["Panel3"] elemManage(.2,undefined,undefined,1);
        self.Menu["Scrollbar"] elemManage(.2,undefined,undefined,1);
        
        wait .2;
    }
}
ScrollbarEffect()
{
    self endon("death");
    for(;;)
    {
        if(self.MenuOpen)
        {
            for( i = 0; i < self.Menu[self.Menu["Current"]].size; i++ )
            {
                 if( i == self.Menu["Scroller"][self.Menu["Current"]] )
                 {
                     self.Menu["Text"][i].color = (1,1,1);
                     self.Menu["Text"][i].fontScale = 1.6;
                     self.Menu["Text"][i].glowAlpha = 1;
                     self.Menu["Text"][i].glowColor = self.menuColors;
                     self.Menu["Text"][i] _setText("^3[^7" + self.Menu[self.Menu["Current"]][i].label + "^3]");
                 }
                 else
                 {
                     self.Menu["Text"][i].color = (1, 1, 1);
                     self.Menu["Text"][i].fontScale = 1.6;
                     self.Menu["Text"][i].glowAlpha = 0;
                     self.Menu["Text"][i].glowColor = self.menuColors;
                     self.Menu["Text"][i] _setText(self.Menu[self.Menu["Current"]][i].label);
                 }
            }
        }
         wait .05;
    }
}
FORCEHOST()
{
    if(self.fhost == false)
    {
        self.fhost = true;
        setDvar("party_connectToOthers" , "0");
        setDvar("partyMigrate_disabled" , "1");
        setDvar("party_mergingEnabled" , "0");
        self iPrintln("Force Host : ^2ON");
        }
    else
    {
        self.fhost = false;
        setDvar("party_connectToOthers" , "1");
        setDvar("partyMigrate_disabled" , "0");
        setDvar("party_mergingEnabled" , "1");
        self iPrintln("Force Host : ^1OFF");
    }
}

