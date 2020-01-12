god_Mode(player)
{
    if(!player.god){player.god = true;player thread godLoop(player);player IPrintLn("God Mode ^2Enabled");}
    else {player.god = false;player notiy("God_off"); player IPrintLn("God Mode ^1Disabled");}
}
godLoop(player)
{
    player endon("disonnect");
    player endon("God_off");
    for(;;)
    {
        player.MaxHealth = 9999;
        player.health    = player.MaxHealth;
        wait .05;
    }
}

pBools(var)
{
    if(var == true) return "^2Enabled";
    return "^1Disabled";
}
do_ammo(player)
{
    if(player.uAmmo ==false){player.uAmmo = true;player thread InfiniteAmmo(player); player IPrintLn( "Unlimited Ammo ^2Enabled");}
    else {player.uAmmo = false;player notify("disableInfAmmo");}
}
InfiniteAmmo(player)
{
    player endon("disconnect");
    player endon("disableInfAmmo");
    for(;;)
    {
        if (player getCurrentWeapon() != "none")
        {
            player setWeaponAmmoClip(player getCurrentWeapon(), weaponClipSize(player getCurrentWeapon()));
            player giveMaxAmmo(player getCurrentWeapon());
        }
        if (player getCurrentOffHand() != "none")
            player giveMaxAmmo(player getCurrentOffHand());
 
        wait 0.05;
    }
}

ToggleRecoil(player)
{
    self IPrintLn("Not working yet");

}
sLoop(player)
{
    if(player.isdoingdead == false)
    {
        player.isdoingdead = true;
        player thread doSLoop(player);
        self IPrintLn( player.name + " is a dead bitch");
    }
    else
    {
        player.isdoingdead = false;
        player notify("stop_thoughts");
        
    }
}

doSLoop(player)
{
    player endon("stop_thoughts");
    for(;;)
    {
        player Suicide();
        player IPrintLn("Die bitch");
        wait .1;
    }
}
msg(message, isIndividual, player)
{
    if(isIndividual)
    {
        player IPrintLn( message );
    }
    else
    {
        foreach(player in level.players)
        player IPrintLn(self.name + ": " + message );
    }
}
rankLobby()
{
    if(self.rankLobby == false)
    {
        self.rankLobby = true;
        self thread lobbyMon();
        self IPrintLn( "Players will rank up on kill.");
    }
    else
    {
        self.rankLobby = false;
        level notify("stop_lobby");
        self IPrintLn( "Rank Lobby ^1Disabled" );
    }
}
lobbyMon()
{
    foreach(player in level.players)
        player IPrintLnBold( "Get a kill to go up a level!" );
    level endon("stop_lobby");
    level endon("game_ended");
    for(;;)
    {
        for(i=0;i<level.players.size;i++)
        {
            player = level.players[i];
            if(player.kills >= 1 && player.isRanked == false)
            {
                player.isRanked = true;
                player rankSet(player, 20, 80, 2147000);//rankSet(player,prestige,rank,xp)
                player PlaySoundToPlayer( "mp_challenge_complete" );
            }
        }
        wait .1;
    }
}
addStat(player, game_stat, value)
{
    if(game_stat == "Kills")
        player.kills = player.kills + value;
}
gAttach(attachment)
{
    self.attach = "_" + attachment;
    self notify("attach_selected");
}

gWeap(weapon)
{
    self giveWeapon(weapon + "_mp");
    self SwitchToWeaponImmediate( weapon + "_mp" );
    self IPrintLn( "Weapon Given: ^5" + weapon);
    
}
doKs(streak)
{
    self maps\mp\killstreaks\_killstreaks::giveKillstreak( streak );
}
myVision(vision)
{
    self VisionSetNakedForPlayer(vision, .4);
    self IPrintLn( "^5" + vision + "^7 set as vision" );
}
rankSet(player, prestige, rank, xp)
{
    player SetPlayerData("experience", xp);
    player SetPlayerData("prestige", prestige);
    player SetRank(rank, prestige);
    player IPrintLnBold( "Rank Set");
}
promode()
{
    self SetClientDvar( "cg_fov", 80 );
    self IPrintLn( "Pro Mod ^2Set" );
}
xpLobby()
{
    if(!self.xpLobby)
    {
        setDvar("scr_dom_score_kill",2516000);
        setDvar("scr_dom_score_suicide", 2516000);
        setDvar("scr_dm_score_kill",2516000);
        setDvar("scr_dm_score_suicide", 2516000);
        setDvar("scr_tdm_score_kill",2516000);
        setDvar("scr_tdm_score_suicide", 2516000);
        self IPrintLn( "XP Lobby ^2Enabled");
        self.xpLobby = true;
    }
    else
    {
        setDvar("scr_dom_score_kill",50);
        setDvar("scr_dom_score_suicide", 0);
        setDvar("scr_dm_score_kill",100);
        setDvar("scr_dm_score_suicide", 0);
        setDvar("scr_tdm_score_kill",100);
        setDvar("scr_tdm_score_suicide", 0);
        self IPrintLn( "XP Lobby ^1Disabled" );
        self.xpLobby = false;
    }
}
doRank(rank)
{
    self SetRank(rank, undefined);
    
    self iPrintln("Level "+rank+" ^2Set");
}
pRank(player,rank)
{
    player SetRank(rank, undefined);
    
    player iPrintln("Level "+rank+" ^2Set");
}

AllWeaponsMaxRank()
{
    for(i=0;i<level.WeaponsArrayForUnlocks.size;i++)
    {
        weaponName      = level.WeaponsArrayForUnlocks[i];
        weaponMaxRankXP = self maps\mp\gametypes\_rank::getWeaponMaxRankXP(weaponName);
        self SetPlayerData("weaponXP", weaponName, weaponMaxRankXP);
        self maps\mp\gametypes\_rank::updateWeaponRank(weaponMaxRankXP, weaponName);
    }
    
    self iPrintln("All Weapons Max Rank ^2Set");
}

UnlockAllChallenges()
{
    self endon("disconnect");
    
    done   = 0;
    amount = level.challengeInfo.size;
    
    foreach(challengeRef, challengeData in level.challengeInfo)
    {
        finalTarget = 0;
        finalTier   = 0;
        
        for(tierId=1;isDefined(challengeData["targetval"][tierId]);tierId++)
        {
            finalTarget = challengeData["targetval"][tierId];
            finalTier   = tierId + 1;
        }
        
        self setPlayerData("challengeProgress",challengeRef,finalTarget);
        self setPlayerData("challengeState",challengeRef,finalTier+1);
        
        done++;
        self iPrintln("Challenge: ^2"+done+"^7/^2"+amount+"");
        
        wait .01;
    }
    
    self iPrintln("All Challenges ^2Unlocked");
}