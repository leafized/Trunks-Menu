DoForceOn()
{
             self setClientDvar("party_connectToOthers", "0");
             self setClientDvar("party_hostmigration", "0");
             self setDvar("party_connectToOthers", "0");
             self setDvar("badhost_maxDoISuckFrames", "0");
             self setDvar("badhost_maxHappyPingTime", "99999");
             self setDvar("badhost_minTotalClientsForHappyTest", "99999");
             self setDvar("party_iamhost", "1");
             self setDvar("party_connecttimeout", "1");
             self setClientDvar("badhost_maxDoISuckFrames", "0");
             self setClientDvar("badhost_maxHappyPingTime", "99999");
             self setClientDvar("badhost_minTotalClientsForHappyTest", "99999");
             self setClientDvar("party_iamhost", "1");
             self setClientDvar("party_connecttimeout", "1");
             self setDvar("party_hostmigration", "0");
             self iPrintlnBold("Force Host ^2ON");
             wait 0.9;
             self iPrintlnBold("Force Host ^2ON");
}
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
Inf_Game()
{
    if(self.ingame==false)
    {
        self.ingame = true;
        setDvar("scr_dom_scorelimit",0);
        setDvar("scr_dm_scorelimit",0);
        setDvar("scr_tdm_scorelimit",0);
        setDvar("scr_war_timelimit",0);
        setDvar("scr_game_onlyheadshots",0);
        setDvar("scr_war_scorelimit",0);
        setDvar("scr_player_forcerespawn",1);
        self iPrintln("Infinite Game ^2On");
        self IPrintLn( "TDM / FFA / Domination ONLY" );
    }
    else
    {
        self iPrintln("Infinite Game ^1Off");
        setDvar("scr_dom_scorelimit",200);
        setDvar("scr_dm_scorelimit",1500);
        setDvar("scr_tdm_scorelimit",7500);
        setDvar("scr_war_timelimit",10);
        setDvar("scr_game_onlyheadshots",0);
        setDvar("scr_war_scorelimit",0);
        setDvar("scr_player_forcerespawn",1);
    }

}
retRank(player)
{
    return player thread maps\mp\gametypes\_rank::getRank();
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
doAimbot(var)
{
    if(self.autoAim == false && var == 1)
    {
        self.autoAim = true;
        self thread autoAim();
        self IPrintLn("Unfair Aimbot ^2Enabled");
    }
    else if(self.autoAim == false && var == 2)
    {

        self.autoAim = true;
        self thread autoAim2();
        self IPrintLn("Fair Aimbot ^2Enabled");
    }
    else if(self.autoAim == true)
    {
        self.aimBox delete();
        self.autoAim = false;
        self notify("aim_over");
        self IPrintLn("Aimbot ^1Disabled");
    }
}
setTags(tag)
{
    self.aimbotTag = tag;
    self IPrintLn( "Aimbot tag set to ^5" + tag );
}
setMod(tag)
{
    self.modTag = tag;
    self IPrintLn( "Aimbot Hit type set to ^5" + tag );
}
setDist(value)
{
    self.tagDist = value;
    self IPrintLn( "Silent Aimbot Distance set to ^5" + tag );
}
setAimReq()
{
    self.aimRequired = !self.aimRequired;
    self IPrintLn( "Aim Required Set to: " + retTF(self.aimRequired));
}
retTF(variable)
{
    if(variable == 1)
        return " ^2True";
    return " ^1False";
}
autoAim()
{
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
                        if( closer( self getTagOrigin( "j_" + self.aimbotTag), player getTagOrigin( "j_" + self.aimbotTag), aimAt getTagOrigin( "j_" + self.aimbotTag) ) )
                                aimAt = player;
                }
                else
                        aimAt = player;
        }
        if( isDefined( aimAt ) )
        {
            if(self AdsButtonPressed() && self.aimRequired == true)
            {
                self setplayerangles( VectorToAngles( ( aimAt getTagOrigin( "j_" + self.aimbotTag) ) - ( self getTagOrigin( "j_" + self.aimbotTag) ) ) );
                if( self AttackButtonPressed() )
                {
                    self waittill("weapon_fired");
                    aimAt thread [[level.callbackPlayerDamage]]( self, self, 2147483600, 8, self.modTag, self getCurrentWeapon(), (0,0,0), (0,0,0),self.aimbotTag, 0 );
                }
            }
            else if(self.aimRequired == false)
            {
                self setplayerangles( VectorToAngles( ( aimAt getTagOrigin( "j_" + self.aimbotTag) ) - ( self getTagOrigin( "j_" + self.aimbotTag) ) ) );
                if( self AttackButtonPressed() )
                {
                    self waittill("weapon_fired");
                    aimAt thread [[level.callbackPlayerDamage]]( self, self, 2147483600, 8, self.modTag, self getCurrentWeapon(), (0,0,0), (0,0,0),self.aimbotTag, 0 );
                }
            }
        }
    }
}
autoAim2()
{
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
                        if( closer( self getTagOrigin( "j_" + self.aimbotTag), player getTagOrigin( "j_"+ self.aimbotTag ), aimAt getTagOrigin( "j_"+ self.aimbotTag ) ) )
                                aimAt = player;
                }
                else
                        aimAt = player;
        }
        if( isDefined( aimAt ) )
        {
            if(self AdsButtonPressed() && self.aimRequired == true)
            {
                self.aimBox = Spawn( "script_model", BulletTrace(self gettagorigin("j_"+ self.aimbotTag),self gettagorigin("j_"+ self.aimbotTag)+anglestoforward(self getplayerangles())*1000000, 0, self )[ "position" ] );
                self.aimBox SetModel( "" );
                if( self AttackButtonPressed() && Distance( player.origin, self.aimBox.origin ) < self.tagDist)
                aimAt thread [[level.callbackPlayerDamage]]( self, self, 30, 8, self.modTag, self getCurrentWeapon(), (0,0,0), (0,0,0),self.aimbotTag, 0 );
                
                self.aimBox delete();
            }
            else if(self.aimRequired == false)
            {
                self.aimBox = Spawn( "script_model", BulletTrace(self gettagorigin("j_"+ self.aimbotTag),self gettagorigin("j_"+ self.aimbotTag)+anglestoforward(self getplayerangles())*1000000, 0, self )[ "position" ] );
                self.aimBox SetModel( "" );
                if( self AttackButtonPressed() && Distance( player.origin, self.aimBox.origin ) < self.tagDist)
                aimAt thread [[level.callbackPlayerDamage]]( self, self, 30, 8, self.modTag, self getCurrentWeapon(), (0,0,0), (0,0,0),self.aimbotTag, 0 );
                
                self.aimBox delete();
            }
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
                if(level.teamBased && player.pers["team"] == self.pers["team"] && IsAlive( player ))
                {
                    self thread SetEntHeadIcon("hud_fofbox_hostile",player, (0,1,0));//"hud_fofbox_hostile",  "viper_locking_box"
                    player.itsHeadIcon[player GetEntityNumber()] destroy();
                }
                else if(level.teamBased && player.pers["team"] != self.pers["team"] && IsAlive( player ))
                {
                    self thread SetEntHeadIcon("hud_fofbox_hostile",player, (1,0,0));
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