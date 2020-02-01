
flyCopter(models)
{
    self endon( "disconnect" );
    self endon( "death" );
    if( getDvar( "mapname") == "")
    {
        self iPrintLnBold( "^1You cannot spawn the helicopter on this Map!" );
    }
    else
    {
        s = 40;
        wait .5;
        self.BH delete();
        self.myWeap    = self getCurrentWeapon();
        self.InVehicle = false;
        self.BH        = spawnHelicopter(self, self.origin+(240,0,160.75), self.angles, "pavelow_mp", models);
        self.BH.angles = ( 0, 0, 0 );

        My_Physics     = ( ( self.BH.origin ) + ( ( anglesToForward( self.BH.angles ) * ( 150 ) ) + ( 0, 0, 20 ) ) );
        Trace          = bulletTrace( My_Physics, ( ( My_Physics ) - ( 0, 0, 20 ) ), false, self.BH )[ "position" ];
        wait 2;
        self thread flyMonitor();
    }

}  

flyMonitor()
{
    self endon("destroyed_heli");
    for(;;)
    {
    if( Distance( self.origin, self.BH.origin ) < 180 && self.InVehicle == false )
    {
        self setLowerMessage( "destroy", "Press ^3[{+usereload}]^7 to fly Helicopter", undefined, 50 );
    }
    if( Distance( self.origin, self.BH.origin ) < 180 && self useButtonPressed() && self.InVehicle == false )//NOTE: I don't think UseButtonPressed() will work on PC
    {
        self.InVehicle = true;
        self setClientDvar( "cg_thirdperson", 1 );
        self setClientDvar( "cg_thirdpersonrange", 600 );
        self SetModel( "com_copypaper");
        self HideAllParts();
        self thread god_Mode(self);
        self clearLowerMessage("destroy");
        self playerLinkTo( self.BH );
        self setOrigin( self.BH.origin );
        self setPlayerAngles( self.BH.angles + ( 0, 0, 0 ) );
        wait 0.2;
    }
    if( Distance(self.origin, self.BH.origin) > 100)
    {
        self clearLowerMessage("destroy");
    }
    if( self meleeButtonPressed() && self.InVehicle == true )
    {
        self.BH delete();
        self.BH vehicle_setspeedimmediate(0);
        self destroyHud();
        self.InVehicle = false;
        self show();
        self thread god_Mode(self);
        self giveWeapon( self.myWeap, 0, false );
        self switchToWeapon( self.myWeap );
        self unlink( self.BH );
        self setClientDvar( "cg_thirdperson", 0 ); 
        self ShowAllParts();
        wait 0.2;
        self notify("destroyed_heli");
    }
    if(self AttackButtonPressed() && self.InVehicle == true)
    {
        self MagicBullet( "ac130_105mm_mp", self.BH.origin, self GetCursorPosition(), self);
    }
    if( self AdsButtonPressed() && self.InVehicle == true )
    {
        self.BH Vehicle_SetSpeed(50, 25);
        self.BH setVehGoalPos( self.origin + (AnglesToForward(self getPlayerAngles()) * 1) );
    }
    else if(!self AdsButtonPressed() && self.InVehicle == true)
    {
        self.BH Vehicle_SetSpeed(0, 50);
        self.BH setVehGoalPos( self.BH.origin );
    }
    wait .05;
    }
}