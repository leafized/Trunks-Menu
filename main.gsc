
//All MP files are supported, if something doesnt work, let us know!
#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

init()
{
        level thread onPlayerConnect();

        if(!isDefined(level.pList)) 
        {
            level permsCreate();
        }
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
         self thread test_notify_waittill_stuff();
    }
}
 menuBools()
 {
     self.menuBools  = "done";
     self.menuColors = (0,1,0);
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
           self.infotext.alpha = 0.8;
           self.infotext       = self createfontstring("objective", 1);
          self.infotext setpoint("right", "center", 310, 0);
          self.infotext settext("Press [{+speed_throw}] + [{+melee}] To Open!");
          self.infotext.glowColor  = (0,1,0);
          self.infotext.glowAlpha  = .4;
          self.infotext.foreground = 1;
          self.infotext.archived   = 0; 
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

    self exitMenu();
    self VisionSetNakedForPlayer("default",0.5);
    //self setClientUiVisibilityFlag("hud_visible", 1);
    self.Menu["infoboard"] elemFade(.3,0.4);
    self.infotext.alpha = 1;
    self.menuColors     = (r,g,b);
    wait .3;
        self initMenu();
    //self setClientUiVisibilityFlag("hud_visible", 0);
    self.Menu["infoboard"] elemFade(.3,0);                      
    self.infotext.alpha = 0;
   

}
ScrollbarEffect()
{
    for( i = 0; i < self.Menu[self.Menu["Current"]].size; i++ )
    {
         self.Menu["Text"][i].color = (1, 1, 1);
         self.Menu["Text"][i].fontScale = 1.6;
         self.Menu["Text"][i].glowAlpha = 0;
         self.Menu["Text"][i].glowColor = (1, 1, 1);
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

