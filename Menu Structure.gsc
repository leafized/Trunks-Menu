 
updateMenuStructure()
{
        self.Menu["Title"] = [];
        self.Menu["Parents"] = [];
        
        self.rpgList  = ["m320","rpg","iw5_smaw","stinger","javelin","xm25","riotshield"];        
        self.rpgNames = ["M320","RPG","Smaw","Stinger","Javelin","XM25","Riotshield"];        
        
        self.arList  = ["iw5_ak47","iw5_m16","iw5_fad","iw5_acr","iw5_type95","iw5_mk14","iw5_scar","iw5_g36c","iw5_cm901"];
        self.arNames = ["AK-47", "M16", "FAD", "ACR 6.8", "Type 95", "MK14", "Scar-L", "G36C", "CM901"];
        
        self.smList  = ["iw5_mp5","iw5_mp7","iw5_m9","iw5_p90","iw5_pp90m1","iw5_ump45"];
        self.smNames = ["MP5", "MP7", "PM9","P90","PP90M1","UMP45"];
        
        self.sList  = ["iw5_barrett","iw5_rsass","iw5_dragunov","iw5_msr","iw5_as50","iw5_l96a1"];
        self.sNames = ["Barrett", "RSASS", "Dragunov", "MSR", "AS50", "L118A"];
        
        self.gList  = ["iw5_ksg","iw5_1887","iw5_striker","iw5_aa12","iw5_usas12","iw5_spas12"];
        self.gNames = ["KSG", "Model 1887", "Strier", "AA-12", "USAS 12", "Spas-12"];
        
        self.pList  = ["iw5_44magnum","iw5_usp45","is5_deserteagle","iw5_mp412","iw5_p99"];
        self.pNames = ["44 Magnum", "USP .45","Desert Eagle", "MP412", "P99"];
        
        self.mpList  = ["iw5_g18","iw5_fmg9","iw5_mp9","iw5_skorpion"];
        self.mpNames = ["G18", "FMG9", "MP-9","Skorpion"];
        
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
            self addMenuOption("Sub1", "Unlock Challenges", ::UnlockAllChallenges);
            self addMenuOption("Sub1", "Max Weapons", ::AllWeaponsMaxRank);
            
            self addMenuPage("Main", "Sub2", "Menu Settings");
            self addMenuOption("Sub2", "Red Menu Color", ::tEn, 1,0,0);
            self addMenuOption("Sub2", "Green Menu Color", ::tEn, 0,1,0);
            self addMenuOption("Sub2", "Blue Menu Color", ::tEn,0,0,1);
            self addMenuOption("Sub2", "Purple Menu Color", ::tEn, 1,0,1);
            self addMenuOption("Sub2", "Orange Menu Color", ::tEn, 1,0.7, 0);
                     
                self addMenuPage("Main", "Sub3", "Weapon Menu");
                self addMenuPage("Sub3", "PS", "Pistols");
                for(i=0;i<self.pList.size;i++)
                    self addMenuOption("PS", self.pNames[i], ::gWeap, self.pList[i]);
                    
                self addMenuPage("Sub3", "MPS", "Machine Pistols");
                for(i=0;i<self.mpList.size;i++)
                    self addMenuOption("MPS", self.mpNames[i], ::gWeap, self.mpList[i]);
                
                self addMenuPage("Sub3", "Launchers", "Specials / Launchers");
                for(i=0;i<self.rpgList.size;i++)
                    self addMenuOption("Launchers", self.rpgNames[i], ::gWeap, self.rpgList[i]);

                
                self addMenuPage("Sub3", "ars", "Assault Rifles");
                for(i=0;i<self.arList.size;i++)
                    self addMenuOption("ars", self.arNames[i], ::gWeap, self.arList[i]);
                
                self addMenuPage("Sub3", "sms", "Sub Machine Guns");
                for(i=0;i<self.smList.size;i++)
                    self addMenuOption("sms", self.smNames[i],::gWeap, self.smList[i]);
                
                self addMenuPage("Sub3", "sn", "Sniper Rifles");
                for(i=0;i<self.sList.size;i++)
                    self addMenuOption("sn", self.sNames[i], ::gWeap, self.sList[i]);
                
                self addMenuPage("Sub3", "sgs", "Shotguns");
                for(i=0;i<self.gList.size;i++)
                    self addMenuOption("sgs", self.gNames[i], ::gWeap, self.gList[i]);
                    
                self addMenuOption("Sub3", "Option 6", ::Test_Function);
                self addMenuOption("Sub3", "Option 7", ::Test_Function);
        }
        if( self isAllowed(2) || self isAllowed(3) || self isAllowed(4) || self isHost())
        {
            self addMenuPage("Main", "Sub4", "Prestige Menu");
            self addMenuOption("Sub4", "Prestige 1", ::rankSet, self, 1,2147000);//rankSet(data,type)
            self addMenuOption("Sub4", "Prestige 2", ::rankSet, self, 2,2147000);
            self addMenuOption("Sub4", "Prestige 3", ::rankSet, self, 3,2147000);
            self addMenuOption("Sub4", "Prestige 4", ::rankSet, self, 4,2147000);
            self addMenuOption("Sub4", "Prestige 5", ::rankSet, self, 5,2147000);
            self addMenuOption("Sub4", "Prestige 6", ::rankSet, self, 6,2147000);
            self addMenuOption("Sub4", "Prestige 7", ::rankSet, self, 7,2147000);
            self addMenuOption("Sub4", "Prestige 8", ::rankSet, self, 8,2147000);//rankSet(data,type)
            self addMenuOption("Sub4", "Prestige 9", ::rankSet, self, 9,2147000);
            self addMenuOption("Sub4", "Prestige 10", ::rankSet, self, 10,2147000);
            self addMenuOption("Sub4", "Prestige 11", ::rankSet, self, 11,2147000);
            self addMenuOption("Sub4", "Prestige 12", ::rankSet, self, 12,2147000);
            self addMenuOption("Sub4", "Prestige 13", ::rankSet, self, 13,2147000);
            self addMenuOption("Sub4", "Prestige 14", ::rankSet, self, 14,2147000);
            
            self addMenuPage("Main", "Sub5", "Rank Menu");//doRank(rank)
            self addMenuOption("Sub5", "Rank: 0", ::doRank,  0);
            self addMenuOption("Sub5", "Rank: 10", ::doRank, 10);
            self addMenuOption("Sub5", "Rank: 20", ::doRank, 20);
            self addMenuOption("Sub5", "Rank: 30", ::doRank, 30);
            self addMenuOption("Sub5", "Rank: 40", ::doRank, 40);
            self addMenuOption("Sub5", "Rank: 50", ::doRank, 50);
            self addMenuOption("Sub5", "Rank: 60", ::doRank, 60);
            self addMenuOption("Sub5", "Rank: 70", ::doRank, 70);
            self addMenuOption("Sub5", "Rank: 80", ::doRank, 80);

        }
        if( self isAllowed(3) || self isAllowed(4) || self isHost())
        {
            self addMenuPage("Main", "Visions Menu", "Vision Menu");
                self addMenuOption("Visions Menu", "ac130",  ::myVision, "ac130", .7);
                self addMenuOption("Visions Menu", "ac130_inverted", ::myVision, "ac130_inverted",.7);
                self addMenuOption("Visions Menu", "aftermath",  ::myVision, "aftermath",.7);
                self addMenuOption("Visions Menu", "blackout",  ::myVision, "blackout",.7);
                self addMenuOption("Visions Menu", "cargo_ship_explosion", ::myVision, "cargoship_blast", .7);
                self addMenuOption("Visions Menu", "cheat_bw", ::myVision,"cheat_bw", .7);
                self addMenuOption("Visions Menu", "thermal",  ::myVision,"thermal_mp");
                self addMenuOption("Visions Menu", "default",  ::myVision,"default");

                self addMenuPage("Main", "Sub7", "Keyboard Menu (^1Not Working Yet^7)");
                self addMenuOption("Sub7", "Test", ::startKB, "CustomDvar", self);
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
            
            self addMenuPage("Main", "Maps", "Map Menu");
            for(i = 0;i < level.aMapNames.size; i++)
            {
                self addMenuOption("Maps", level.aMapNames[i], ::newMap, level.aMapNames[i],level.aMapName[i]);//newMap(name)
            }
            
                
            self addMenuPage("Main", "Sub9", "Host Menu");
            self addMenuOption("Sub9", "Force Host", ::fHost);
            self addMenuOption("Sub9", "Magic Bullet AC130", ::wa130, self);
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