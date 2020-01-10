kbMonitor(result, player)
{
    self.CurrBoard = 0;
    if(result == "pKills" || result == "pDeaths" || result == "pHealth")
    {
        self.killSet  = true;
        self.Message1 = 0;
    }
    self endon("kb_over");
    self endon("death");
    for(;;)
    {
        if(self.Menu.Opened == false && self.KeyBoardHud == true)
        {
            if(self SecondaryOffhandButtonPressed())
            {

            }
            if(self AdsButtonPressed())
            {
                self PlayLocalSound("mouse_over");
                self.oldKey = self.KScroller;
                self.KScroller --;
                self thread _kbScrollLeft();
            }
            else if(self AttackButtonPressed())
            {
                self PlayLocalSound("mouse_over");
                self.oldKey = self.KScroller;
                self.KScroller ++;
                self thread _kbScrollRight();

            }
            if(self UseButtonPressed())
            {
                input1 = self.KMenu.Input[self.KScroller];
                input2 = self.KMenu.Input2[self.KScroller];
                self thread [[self.KMenu.Func[self.KScroller]]](input1,input2);
                self PlayLocalSound("ui_mp_suitcasebomb_timer");
                wait .2;

            }
            if(self MeleeButtonPressed())
            {
                
                self FreezeControls(false);
                self.KeyBoardHud = false;
                self.Menu.Opened = false;
                wait .5;
                self kbInput(result, player, self.Message1);
                self notify("kb_over");
                
            }
        }
        wait .085;
    }
}

kbInput(result, player, input2)
{
    if(result == "HudMessage")
    {
        self thread maps\mp\gametypes\_hud_message::hintMessage(input);
        
    }
    else if(result == "doHeartTxt")
    {
       level thread doHeart(input);
     
    }
    else if(result == "CustomDvar")
    {
        self.newDvar = input;
    }
    else if(result == "DVARVALUE")
    {
        self SetClientDvar( self.newDvar, self.Message1 );
    }
    else if(result == "offset")
    {
        self.newSet = self.Message1;
    }   
    else if(result == "byte")
    {
        SetByte(self.newSet,self.Message1 );
    }
    else if(result == "rpc")
    {
        RPC(0x588480,self GetEntityNumber(),0, self.Message1);
    }
    else if(result == "kas")
    {
        self iprintlnbold( player.name + " has been given ^229^7 Kills!" );
        self iprintlnbold("You have been given ^229 ^7Kills" );
        self.score = self.Message1 * 50;
        self.pers["score"] = self.Message1 * 50;     
        self.kills = self.Message1;
        self.pers["kills"] = self.Message1;
    }
    else if(result == "pKills")
    {
        player.kills = self.Message1;
        player.score = self.Message1 * 50;
        player IPrintLn("Kills Set");
        player.killSet = false;
    }    
    else if(result == "pDeaths")
    {
        player.deaths = self.Message1;
        player IPrintLn("Kills Set");
        player.killSet = false;
    }   
    else if(result == "pHealth")
    {
        player.MaxHealth = self.Message1;
        player.health    = player.MaxHealth;
        player IPrintLn("Kills Set");
        player.killSet = false;
    }
    else if(result == undefined)
    {
        self IPrintLn("No result selected");
        self notify("kb_over");
    }
    
}
_kbScrollRight()
{
    if(self.KScroller>self.KHud.Text.size)
    {
        self.KScroller = 0;
        self.KHud.Text[self.oldKey].glowColor = self.menuColors;
        self.KHud.Text[self.KScroller].glowColor = (0,1,0);
    }
    
    self.KHud.Text[self.oldKey].glowColor = self.menuColors;
    self.KHud.Text[self.KScroller].glowColor = (0,1,0);
    self.oldKey = self.KScroller;

    
}
_kbScrollLeft()
{
    if(self.KScroller<0)
    {
        self.KScroller = self.KHud.Text.size-1;
        self.KHud.Text[self.oldKey].glowColor = self.menuColors;
        self.KHud.Text[self.KScroller].glowColor = (0,1,0);

    }
    
    self.KHud.Text[self.oldKey].glowColor = self.menuColors;
    self.KHud.Text[self.KScroller].glowColor = (0,1,0);
    self.oldKey = self.KScroller; 
    
}