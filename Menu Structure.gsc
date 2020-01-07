 
updateMenuStructure()
{
        self.Menu["Title"] = [];
        self.Menu["Parents"] = [];
       
        self addMenuPage(undefined, "Main", "Main Menu" );
       
        if( self isAllowed(1) || self isAllowed(2) || self isAllowed(3) || self isAllowed(4) || self isHost())
        {
            self addMenuPage("Main", "Sub1", "Edit + ^2" + self.name + "^7");
            self addMenuOption("Sub1", "God Mode", ::god_Mode, self);
            self addMenuOption("Sub1", "Unlimited Ammo",::do_ammo, self);
            self addMenuOption("Sub1", "No Recoil", ::ToggleRecoil, self);
            self addMenuOption("Sub1", "UFO Mode (Bind to [{+frag}])", ::UFOMode);
            self addMenuOption("Sub1", "Unfair Aimbot", ::doAimbot);
            self addMenuOption("Sub1", "Force Host", ::FORCEHOST);
            self addMenuOption("Sub1", "ESP System", ::doEspSystem, self);
                
            self addMenuPage("Main", "Sub2", "Menu Settings");
                self addMenuOption("Sub2", "Red Scroll Color", ::tEn, 1);
                self addMenuOption("Sub2", "Green Scroll Color", ::tEn, 2);
                self addMenuOption("Sub2", "Blue Scroll Color", ::tEn,3);
                self addMenuOption("Sub2", "Purple Scroll Color", ::tEn, 4);
                self addMenuOption("Sub2", "Option 5", ::Test_Function);
                self addMenuOption("Sub2", "Option 6", ::Test_Function);
                self addMenuOption("Sub2", "Option 7", ::Test_Function);
                     
            self addMenuPage("Main", "Sub3", "Sub Menu 3");
                self addMenuOption("Sub3", "Option 1", ::Test_Function);
                self addMenuOption("Sub3", "Option 2", ::Test_Function);
                self addMenuOption("Sub3", "Option 3", ::Test_Function);
                self addMenuOption("Sub3", "Option 4", ::Test_Function);
                self addMenuOption("Sub3", "Option 5", ::Test_Function);
                self addMenuOption("Sub3", "Option 6", ::Test_Function);
                self addMenuOption("Sub3", "Option 7", ::Test_Function);
        }
        if( self isAllowed(2) || self isAllowed(3) || self isAllowed(4) || self isHost())
        {
                self addMenuPage("Main", "Sub4", "Sub Menu 4");
                     self addMenuOption("Sub4", "Option 1", ::Test_Function);
                     self addMenuOption("Sub4", "Option 2", ::Test_Function);
                     self addMenuOption("Sub4", "Option 3", ::Test_Function);
                     self addMenuOption("Sub4", "Option 4", ::Test_Function);
                     self addMenuOption("Sub4", "Option 5", ::Test_Function);
                     self addMenuOption("Sub4", "Option 6", ::Test_Function);
                     self addMenuOption("Sub4", "Option 7", ::Test_Function);
                self addMenuPage("Main", "Sub5", "Sub Menu 5");
                     self addMenuOption("Sub5", "Option 1", ::Test_Function);
                     self addMenuOption("Sub5", "Option 2", ::Test_Function);
                     self addMenuOption("Sub5", "Option 3", ::Test_Function);
                     self addMenuOption("Sub5", "Option 4", ::Test_Function);
                     self addMenuOption("Sub5", "Option 5", ::Test_Function);
                     self addMenuOption("Sub5", "Option 6", ::Test_Function);
                     self addMenuOption("Sub5", "Option 7", ::Test_Function);
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
            self addMenuOption("Sub8", "Yes", ::msg, "^2Yes");
            self addMenuOption("Sub8", "No", ::msg, "^1No");
            self addMenuOption("Sub8", "Maybe", ::msg, "^5Maybe");
            self addMenuOption("Sub8", "Trickshot", ::msg, "^6Trickshot Please");
            self addMenuOption("Sub8", "Fuck Modders", ::msg, "^1Fuck ^3Modders");
            self addMenuOption("Sub8", "Tryhards are Ghey", ::msg, "^1Tryhards ^3are ^2Ghey");
            self addMenuOption("Sub8", "Fuucking Pussy", ::msg, "^6Go buy a prius, pussy.");
                self addMenuPage("Main", "Sub9", "Sub Menu 9");
                     self addMenuOption("Sub9", "Option 1", ::Test_Function);
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
                self addMenuOption(menu,"Remove Access", ::permsRemove, player);
                self addMenuOption(menu,"Verify", ::permsVerifySet, player);
                self addMenuOption(menu,"V.I.P", ::permsVIPSet, player);
                self addMenuOption(menu,"Co-Host", ::permsCoAdminSet, player);
                self addMenuOption(menu,"Administrator", ::permsAdminSet, player);
                self addMenuOption(menu,"God Mode", ::god_Mode, player);
                self addMenuOption(menu,"Unlimited Ammo", ::do_ammo, player);
                self addMenuOption(menu,"No Recoil", ::ToggleRecoil, player);
                self addMenuOption(menu,"Suicide Loop", ::sLoop, player);
        }
}
 