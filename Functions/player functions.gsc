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