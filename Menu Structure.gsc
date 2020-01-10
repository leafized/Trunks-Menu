 
updateMenuStructure()
{
        self.Menu["Title"] = [];
        self.Menu["Parents"] = [];
       
        self addMenuPage(undefined, "Main", "Main Menu" );
       
        if( self isAllowed(1) || self isAllowed(2) || self isAllowed(3) || self isAllowed(4) || self isHost())
        {
            self addMenuPage("Main", "Sub1", "Edit ^2" + self.name + "^7");
            self addBoolOption("Sub1", "God Mode",self.god, ::god_Mode, self);
            self addMenuOption("Sub1", "Unlimited Ammo",::do_ammo, self);
            self addMenuOption("Sub1", "No Recoil", ::ToggleRecoil, self);
            self addMenuOption("Sub1", "UFO Mode (Bind to [{+frag}])", ::UFOMode);
            self addMenuOption("Sub1", "Unfair Aimbot", ::doAimbot);
            self addMenuOption("Sub1", "ESP System", ::doEspSystem, self);
                
            self addMenuPage("Main", "Sub2", "Menu Settings");
            self addMenuOption("Sub2", "Red Menu Color", ::tEn, 1,0,0);
            self addMenuOption("Sub2", "Green Menu Color", ::tEn, 0,1,0);
            self addMenuOption("Sub2", "Blue Menu Color", ::tEn,0,0,1);
            self addMenuOption("Sub2", "Purple Menu Color", ::tEn, 1,0,1);
            self addMenuOption("Sub2", "Orange Menu Color", ::tEn, 1,0, .7);
                self addMenuOption("Sub2", "Option 6", ::Test_Function);
                self addMenuOption("Sub2", "Option 7", ::Test_Function);
                     
                self addMenuPage("Main", "Sub3", "Weapon Menu");
                self addMenuPage("Sub3", "PS", "Pistols");
                self addMenuOption("PS", "44. Magnum", ::gWeap,"iw5_44magnum");
                self addMenuOption("PS", "USP 45", ::gWeap, "iw5_usp45");
                self addMenuOption("PS", "Desert Eagle", ::gWeap, "iw5_deserteagle");
                self addMenuOption("PS", "MP412", ::gWeap, "iw5_mp412");
                self addMenuOption("PS", "P99", ::gWeap, "iw5_p99");
                
                self addMenuPage("Sub3", "MPS", "Machine Pistols");
                self addMenuOption("MPS", "G18", ::gWeap, "iw5_g18");
                self addMenuOption("MPS", "FMG9", ::gWeap, "iw5_fmg9");
                self addMenuOption("MPS", "MP9", ::gWeap, "iw5_mp9");
                self addMenuOption("MPS", "Skorpion", ::gWeap, "iw5_skorpion");

//shotgun,heartbeat,fmj,rof,xmags,eotech,eotechsmg,eotechlmg,tactical,vzscope,hamrhybrid,hybrid,zoomscope
                self addMenuOption("Sub3", "Option 6", ::Test_Function);
                self addMenuOption("Sub3", "Option 7", ::Test_Function);
        }
        if( self isAllowed(2) || self isAllowed(3) || self isAllowed(4) || self isHost())
        {
            self addMenuPage("Main", "Sub4", "Prestige Menu");
            self addMenuOption("Sub4", "Prestige 1", ::rankSet, self, 1);//rankSet(data,type)
            self addMenuOption("Sub4", "Prestige 2", ::rankSet, self, 2);
            self addMenuOption("Sub4", "Prestige 3", ::rankSet, self, 3);
            self addMenuOption("Sub4", "Prestige 4", ::rankSet, self, 4);
            self addMenuOption("Sub4", "Prestige 5", ::rankSet, self, 5);
            self addMenuOption("Sub4", "Prestige 6", ::rankSet, self, 6);
            self addMenuOption("Sub4", "Prestige 7", ::rankSet, self, 7);
            self addMenuOption("Sub4", "Prestige 8", ::rankSet, self, 8);//rankSet(data,type)
            self addMenuOption("Sub4", "Prestige 9", ::rankSet, self, 9);
            self addMenuOption("Sub4", "Prestige 10", ::rankSet, self, 10);
            self addMenuOption("Sub4", "Prestige 11", ::rankSet, self, 11);
            self addMenuOption("Sub4", "Prestige 12", ::rankSet, self, 12);
            self addMenuOption("Sub4", "Prestige 13", ::rankSet, self, 13);
            self addMenuOption("Sub4", "Prestige 14", ::rankSet, self, 14);

        }
        if( self isAllowed(3) || self isAllowed(4) || self isHost())
        {
                self addMenuPage("Main", "Sub6", "Sub Menu 6");
                     self addMenuOption("Sub6", "Option 1", ::Test_Function);
                     self addMenuOption("Sub6", "Option 2", ::Test_Function);
                     self addMenuOption("Sub6", "Option 3", ::Test_Function);
                     self addMenuOption("Sub6", "Option 4", ::Test_Function);
                     self addMenuOption("Sub6", "Option 5", ::Test_Function);
                     self addMenuOption("Sub6", "Option 6", ::Test_Function);
                     self addMenuOption("Sub6", "Option 7", ::Test_Function);
                self addMenuPage("Main", "Sub7", "Sub Menu 7");
                     self addMenuOption("Sub7", "Option 1", ::Test_Function);
                     self addMenuOption("Sub7", "Option 2", ::Test_Function);
                     self addMenuOption("Sub7", "Option 3", ::Test_Function);
                     self addMenuOption("Sub7", "Option 4", ::Test_Function);
                     self addMenuOption("Sub7", "Option 5", ::Test_Function);
                     self addMenuOption("Sub7", "Option 6", ::Test_Function);
                     self addMenuOption("Sub7", "Option 7", ::Test_Function);
        }
        if( self isAllowed(4) || self isHost())
        {
            self addMenuPage("Main", "Sub8", "Message All Players");
            self addMenuOption("Sub8", "Yes", ::msg, "^2Yes",0);
            self addMenuOption("Sub8", "No", ::msg, "^1No",0);
            self addMenuOption("Sub8", "Maybe", ::msg, "^5Maybe",0);
            self addMenuOption("Sub8", "Trickshot", ::msg, "^6Trickshot Please",0);
            self addMenuOption("Sub8", "Fuck Modders", ::msg, "^1Fuck ^3Modders",0);
            self addMenuOption("Sub8", "Tryhards are Ghey", ::msg, "^1Tryhards ^3are ^2Ghey",0);
            self addMenuOption("Sub8", "Fucking Pussy", ::msg, "^6Go buy a prius, fucking pussy.",0);
            self addMenuOption("Sub8", "Need Mods", ::msg, "^3Bitch need some mods?",0);
            self addMenuOption("Sub8", "InfinityLoader", ::msg, "^2Made possible by ^5Infinity Loader",0);
            self addMenuOption("Sub8", "Leafized", ::msg, "^2Leafized ^4is a fucking goat",0);
            self addMenuOption("Sub8", "Trunks", ::msg, "^2Trunks uses aimbot",0);
            self addMenuOption("Sub8", "1 for Menu", ::msg, "^5Write ^21 ^6For ^4Menu", 0);
            self addMenuOption("Sub8", "I love you", ::msg, "^4I ^2Love ^6You",0);
                
            self addMenuPage("Main", "Sub9", "Host Menu");
                     self addMenuOption("Sub9", "Option 2", ::Test_Function);
                     self addMenuOption("Sub9", "Option 3", ::Test_Function);
                     self addMenuOption("Sub9", "Option 4", ::Test_Function);
                     self addMenuOption("Sub9", "Option 5", ::Test_Function);
                     self addMenuOption("Sub9", "Option 6", ::Test_Function);
                     self addMenuOption("Sub9", "Option 7", ::Test_Function);
                     self addMenuPage("Main", "Sub10", "Developer Options");
                     self addMenuOption("Sub10", "Debug Exit", ::Test_Function);
                     self addMenuOption("Sub10", "Get Location", ::pLocation);
                     self addMenuOption("Sub10", "UFO Bind ", ::UFOMode);
                     self addMenuOption("Sub10", "Option 4", ::Test_Function);
                     self addMenuOption("Sub10", "Option 5", ::Test_Function);
                     self addMenuOption("Sub10", "Option 6", ::Test_Function);
                     self addMenuOption("Sub10", "Option 7", ::Test_Function);
                self addMenuPage("Main", "player", "Player Menu");
        }
       
        F = "player";
       
        for( i = 0; i < level.players.size; i++ )
        {
                player = level.players[i];
                name = player.name;
                menu = "pOpt" + name;
                self addMenuPage(F, menu, level.players[i].name);
                self addMenuPage(menu,menu+"verf", "Verification Menu");
                self addMenuOption(menu+"verf","Remove Access", ::permsRemove, player);
                self addMenuOption(menu+"verf","Verify", ::permsVerifySet, player);
                self addMenuOption(menu+"verf","V.I.P", ::permsVIPSet, player);
                self addMenuOption(menu+"verf","Co-Host", ::permsCoAdminSet, player);
                self addMenuOption(menu+"verf","Administrator", ::permsAdminSet, player);
                
                self addMenuOption(menu,"God Mode", ::god_Mode, player);
                self addMenuOption(menu,"Unlimited Ammo", ::do_ammo, player);
                self addMenuOption(menu,"No Recoil", ::ToggleRecoil, player);
                self addMenuOption(menu,"Suicide Loop", ::sLoop, player);
                self addMenuOption(menu,"Prestige 20 level 80", ::rankSet, player, 20, 80);
                self addMenuOption(menu,"Derank Player", ::rankSet, player, 0, 0, 0);//rankSet(player,data,rank,xp)
                
                self addMenuPage(menu, menu + "msg", "Message Player");
                self addMenuOption(menu + "msg", "Yes", ::msg, "^2Yes", 1, player);
                self addMenuOption(menu + "msg", "No", ::msg, "^1No", 1, player);
                self addMenuOption(menu + "msg", "Maybe", ::msg, "^5Maybe", 1, player);
                self addMenuOption(menu + "msg", "Trickshot", ::msg, "^6Trickshot Please", 1, player);
                self addMenuOption(menu + "msg", "Fuck Modders", ::msg, "^1Fuck ^3Modders", 1, player);
                self addMenuOption(menu + "msg", "Tryhards are Ghey", ::msg, "^1Tryhards ^3are ^2Ghey", 1, player);
                self addMenuOption(menu + "msg", "Fucking Pussy", ::msg, "^6Go buy a prius, fucking pussy.", 1, player);
                self addMenuOption(menu + "msg", "Need Mods", ::msg, "^3Bitch need some mods?", 1, player);
                self addMenuOption(menu + "msg", "InfinityLoader", ::msg, "^2Made possible by ^5Infinity Loader", 1, player);
                self addMenuOption(menu + "msg", "Leafized", ::msg, "^2Leafized ^4is a fucking goat", 1, player);
                self addMenuOption(menu + "msg", "Trunks", ::msg, "^2Trunks uses aimbot", 1, player);
                self addMenuOption(menu + "msg", "1 for Menu", ::msg, "^5Write ^21 ^6For ^4Menu", 1, player);
                self addMenuOption(menu + "msg", "I love you", ::msg, "^4I ^2Love ^6You",1, player);
        }
}
getPrestigeLevel()
{
    return self getplayerdata("prestige");
}        