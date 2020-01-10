startKB(result, player)
{
    self.oldNewMenu = self.Menu.CurrentMenu;
    self exitMenu();
    self FreezeControls(true);
    self.KHud     = SpawnStruct();
    self.Message1 = "";
    self.KMenu    = SpawnStruct();
    self.KMenu2   = SpawnStruct();
    self.KMenu3   = SpawnStruct();
    
    self kbStruct();
    self thread kbMonitor(result, player);
    self thread keyboardHud();
    wait .5;
    self thread doKBText();
    self thread kbDestroyWatch();
    self.KScroller   = 0;
    self.oldKey      = 0;
    self.KeyBoardHud = true;
}
kbDestroyWatch()
{
    self waittill("kb_over" || "death");
    self kbDestroy();
}
kbDestroy()
{
        self.Hud.KBackground destroy();
        self.Hud.KTop destroy();
        self.Hud.KBot destroy();
        self.Hud.Message destroy();
        self.Hud.MessageBack destroy();
        self.Hud.KToper destroy();
        self.Hud.Message2 destroy();
        self thread destroyKB1();
}
destroyKB1()
{
    for(i=0;i<self.KHud.Text.size;i++)
    {
        self.KHud.Text[i] destroy();
    }
}
keyboardHud()
{//createRectangle(align,relative,x,y,width,height,color,alpha,sorting,shadero)
    self.Hud.KBackground = createRectangle2("CENTER","CENTER",0,0,1,1,(0,0,0),.5,0,"white");
    self.Hud.KBackground elemManage(.7,undefined,undefined,.7,350,220);//elemManage(time,x,y,a,w,h,txt)
    self.Hud.KBot = createRectangle2("CENTER", "CENTER", 0, 110, 0, 4, self.menuColors, 1, 1, "white");
    self.Hud.KBot elemManage(.7,undefined,undefined,1,350,4);
    self.Hud.KToper = createRectangle2("CENTER", "CENTER", 0, -120, 0, 20, (0,0,0), 1, 1, "white");
    self.Hud.KToper elemManage(.7,undefined,undefined,.7,350,20);
    self.Hud.Message2 = createText2("default",1,"CENTER","CENTER",0,-120,5,(1,1,1),1,(0,0,1),1,"Scroll Right^3 [{+attack}]^2|^7Scroll Left^3 [{+speed_throw}]^2|^7Select^3 [{+activate}]^2|^7Close ^3[{+melee}]^2|^7Skip a Row ^3[{+smoke}]");
    self.Hud.KTop     = createRectangle2("CENTER", "CENTER", 0, -110, 0, 4, self.menuColors, 1, 2, "white");
    self.Hud.KTop elemManage(.7,undefined,undefined,1,350,4);
    self.Hud.Message     = createText("objective",1.5,"CENTER","CENTER",0,-80,5,(1,1,1),1,(0,0,1),1,"Awaiting Input");
    if(self.killSet == true)
    {
        self.Hud.Message _setText("Add numbers together.");
    }
    self.Hud.MessageBack = createRectangle2("CENTER", "CENTER", 0, -80, 0, 28, (.2,.2,.2), 1, 1, "white");
    self.Hud.MessageBack elemManage(.7,undefined,undefined,1,340,28);
}
doKBText()
{
    for(i=0;i<self.KMenu.Text.size;i++)
    {
        if(i <= 9)
        {
            self.KHud.Text[i] = createText("objective",2,"center","center",-110 + (24*i),-30,i,(1,1,1),1,self.menuColors,1,toUpper(self.KMenu.Text[i]));
            self.KHud.Text[i].foreground = true;
        }
        else if(i <= 17)
        {
            self.KHud.Text[i] = createText("objective",2,"center","center",-330 + (24*i),0,i,(1,1,1),1,self.menuColors,1,toUpper(self.KMenu.Text[i]));
            self.KHud.Text[i].foreground = true;
        }       
        else if(i == 18)
        {
            self.KHud.Text[i] = createText2("objective",2,"center","center",-330 + (24*i),0,i,(1,1,1),1,self.menuColors,1,toUpper(self.KMenu.Text[i]));
            self.KHud.Text[i].foreground = true;
        }
        else if(i <= 25)
        {
            self.KHud.Text[i] = createText2("objective",2,"center","center",-530 + (24*i),30,i,(1,1,1),1,self.menuColors,1,toUpper(self.KMenu.Text[i]));
            self.KHud.Text[i].foreground = true;
        }
        else if(i <= 26)
        {
            self.KHud.Text[i] = createText2("objective",2,"center","center",-630 + (24*i),60,i,(1,1,1),1,self.menuColors,1,toUpper(self.KMenu.Text[i]));
            self.KHud.Text[i].foreground = true;
        }
        else if(i <= 38)
        {
            self.KHud.Text[i] = createText2("objective",2,"center","center",-790 + (24*i),90,i,(1,1,1),1,self.menuColors,1,self.KMenu.Text[i]);
            self.KHud.Text[i].foreground = true;
        }
        
    }
}

doLetter(letter, inpu2)
{
    if(IsDefined(inpu2) && IsDefined(self.newDvar))
    {
        self IPrintLn(letter + " ^2added to value");
        self.Message1 = self.Message1 + letter;
        self.Hud.Message SetText("" + toUpper(self.Message1));
    }
    if(self.killSet == true)
    {
        self IPrintLn(letter + " ^2added to value");
        self.Message1 = self.Message1 + inpu2;
        self.Hud.Message SetText(self.Message1);
    }
    else
    {
        self IPrintLn(letter + " ^2added to string");
        self.Message1 = self.Message1 + letter;
        self.Hud.Message SetText("" + toUpper(self.Message1));
    }
}