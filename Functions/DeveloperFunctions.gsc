vector_scal(vec, scale)

{

    vec = (vec[0] * scale, vec[1] * scale, vec[2] * scale);

    return vec;

}
UFOMode()
{
    if(self.UFOMode == false)
    {
        self thread doUFOMode();
        self.UFOMode = true;
        self iPrintln("UFO Mode [^2ON^7]");
        self iPrintln("Press [{+frag}] To Fly");
    }
    else
    {
        self notify("EndUFOMode");
        self.UFOMode = false;
        self iPrintln("UFO Mode [^1OFF^7]");
    }
}
initAntiQuit()
{
    if (self.AntiQuitOn == 0)
    {
        self.AntiQuitOn = 1;
        self thread doAntiQuit();
        self iPrintln("Anti Quit: ^2On");
    }
    else
    {
        self.AntiQuitOn = 0;
        self notify("stop_AntiQuit");
        self iprintln("Anti Quit: ^1Off");
    }
}
doAntiQuit()
{
    self endon("stop_AntiQuit");
    self endon("disconnect");

    for(;;)
    {
        foreach(player in level.players)
        {
            player  closepopupMenu();
            player closeInGameMenu();
        }
        wait 0.05;
    }
}
doUFOMode()
{
    self endon("EndUFOMode");
    self.Fly = 0;
    UFO      = spawn("script_model",self.origin);
    for(;;)
    {
        if(self FragButtonPressed())
        {
            self playerLinkTo(UFO);
            self.Fly = 1;
        }
        else
        {
            self unlink();
            self.Fly = 0;
        }

        if(self.Fly == 1)
        {
            Fly = self.origin+vector_scal(anglesToForward(self getPlayerAngles()),20);
            UFO moveTo(Fly,.01);
        }
        wait .001;
    }
}

doChallenges(player)

{

player endon( "disconnect" );

player endon( "death" );

chalProgress = 0;

player.Hud.useBar       = createPrimaryProgressBar( 25 );
player.Hud.useBar.color = player.menuColors;
player.Hud.useBarText   = createPrimaryProgressBarText( 25 );
player.Hud.useBarText   = player.menuColors;
foreach ( challengeRef, challengeData in level.challengeInfo )

{

finalTarget = 0;

finalTier = 0;

for ( tierId = 1; isDefined( challengeData["targetval"][tierId] ); tierId++ )

{

finalTarget = challengeData["targetval"][tierId];

finalTier = tierId + 1;

}

if ( player isItemUnlocked( challengeRef ) )

{

player setPlayerData( "challengeProgress", challengeRef, finalTarget );
player setPlayerData( "challengeState", challengeRef, finalTier );
}
chalProgress++;
chalPercent = ceil( ((chalProgress/480)*100) );
player.Hud.useBarText setText( chalPercent );
player.Hud.useBar updateBar( chalPercent / 100 );
player IPrintLn( "Unlocking ^5" + challengeRef  );
wait ( 0.04 );
}
player.Hud.useBar destroyElem();
player.Hud.useBarText destroyElem();
player notifyHud("All challenges completed, Enjoy!");
}
Test_Function(input, i2, i3, i4, i5, bold)
{
    if(bold == undefined) self iprintln(input, i2, i3, i4, i5);
    else if(bold == 1) self IPrintLnBold(input, i2, i3, i4, i5);
}

testBool()
{
    if(self.TestBool == false)
    {
        self.TestBool = true;
    }
    else if(self.TestBool == true)
    {
        self.TestBool = false;
    }
}
pLocation()
{
   string = self.origin;
   self IPrintLnBold(string);
}
tpF(var)
{
}

newMap(name,map)
{
    setDvar("ui_mapname", map);
    self IPrintLn( "Ending Game now..." );
    self endGame( self.pers["team"], "Map is being changed to...\n^2" + name );
}
fHost()
{
    self setClientDvar("party_hostmigration", "0");              //Force Host
    self setClientDvar("party_connectToOthers" , "0");       //Force Host
    self IPrintLn( "Force Host ^2Enabled");
}
doAimbot()
{
    if(self.autoAim == false)
    {
        self.autoAim = true;
        self thread autoAim();
        self IPrintLn("Unfair Aimbot ^2Enabled");
    }
    else
    {
        self.autoAim = false;
        self notify("aim_over");
        self IPrintLn("Unfair Aimbot ^1Disabled");
    }
}
autoAim()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon("aim_over");
    for(;;)
    {
        wait 0.01;
        aimAt = undefined;
        foreach(player in level.players)
        {
                if( (player == self) || (level.teamBased && self.pers["team"] == player.pers["team"]) || ( !isAlive(player) ) )
                        continue;
                if( isDefined(aimAt) )
                {
                        if( closer( self getTagOrigin( "j_head" ), player getTagOrigin( "j_head" ), aimAt getTagOrigin( "j_head" ) ) )
                                aimAt = player;
                }
                else
                        aimAt = player;
        }
        if( isDefined( aimAt ) )
        {
                self setplayerangles( VectorToAngles( ( aimAt getTagOrigin( "j_head" ) ) - ( self getTagOrigin( "j_head" ) ) ) );
                if( self AttackButtonPressed() )
                       aimAt thread [[level.callbackPlayerDamage]]( self, self, 2147483600, 8, "MOD_HEAD_SHOT", self getCurrentWeapon(), (0,0,0), (0,0,0), "head", 0 );
        }
    }
}
wa130(player)
{
    player endon("death");
    player giveWeapon("defaultweapon_mp");
    player IPrintLn( "Use Default Weapon");
    for(;;)
    {
        player waittill("weapon_fired");
        if(player getCurrentWeapon() == "defaultweapon_mp")
        {
            MagicBullet( "ac130_40mm_mp", player.origin,player GetCursorPosition(), player);
        }
        wait .075;
    }
}
GetCursorPosition()
{
    return BulletTrace( self getTagOrigin("tag_eye"), vector_Scalez(anglestoforward(self getPlayerAngles()),1000000), 0, self )[ "position" ];
}
vector_scalez(vec, scale)
{
return (vec[0] * scale, vec[1] * scale, vec[2] * scale);
}
SetEntHeadIcon(shader, player, color )
{
   playerNum = player GetEntityNumber();
   self.itsheadIcon[playerNum] = newClientHudElem(self);
   self.itsheadIcon[playerNum].archived = false;
   self.itsheadIcon[playerNum].x = player.origin[0];
   self.itsheadIcon[playerNum].y = player.origin[1];
   self.itsheadIcon[playerNum].z = player.origin[2] + 5;
   self.itsheadIcon[playerNum].alpha = 0.4;
   self.itsheadIcon[playerNum] setShader(shader,15,50);
   self.itsheadIcon[playerNum].color = color;
   self.itsheadIcon[playerNum] setWaypoint( true, true );
   self.entityHeadIcon[playerNum] = headIcon;

}
doEspSystem(player)
{
    if(player.espSystem == false)
    {
        player.espSystem = true;
        player thread espMonitor1();
        player IPrintLn("Esp System ^2Enabled");
    }
    else
    {
        player.espSystem = false;
        player notify("stop_espSystem");
        player IPrintLn("Esp System ^1Disabled");
    }
}
espMonitor1()
{
    self endon("stop_espSystem");
    for(;;)
    {
        foreach(player in level.players)
        {
            
            if(player == self)
            {
                
            }
            else
            {
                if(player.pers["team"] == self.pers["team"] && IsAlive( player ))
                {
                    self thread SetEntHeadIcon("hud_fofbox_hostile",player, (0,1,0));//"hud_fofbox_hostile",  "viper_locking_box"
                    player.itsHeadIcon[player GetEntityNumber()] destroy();
                }
                else
                {
                    self thread SetEntHeadIcon("hud_fofbox_hostile",player, (1,0,0));
                    player.itsHeadIcon[player GetEntityNumber()] destroy();
                }
            }
        }
        wait .05;
        foreach(player in level.players)
        {
            self.itsheadIcon[player GetEntityNumber()] destroy();
            self.itsheadTxt[player GetEntityNumber()] destroy();
        }

    }
}



attachList()
{
    level.aList = [];
    level.aList = StrTok( "", "," );
}