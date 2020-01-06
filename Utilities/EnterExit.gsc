 
enterMenu( menu )
{
        self endon( "disconnect" );
        self endon( "death" );
       
        self.Menu["Current"] = menu;
       
        self notify( "Menu_Opened" );
        self destroyMenuText();
        self destroyMenuGUI();
       
        if( !isDefined( self.Menu["Scroller"][self.Menu["Current"]] ) )
                self.Menu["Scroller"][self.Menu["Current"]] = 0;
        else
                self.Menu["Scroller"][self.Menu["Current"]] = self.Menu["Scroller"][self.Menu["Current"]];
       
        self thread updateMenuStructure();
        self thread createMenuText();
        self thread createMenuGUI();
}
    
    exitMenu()
{
        self.MenuOpen = false;
        self notify("Menu_Closed");
        self destroyMenuText();
        self destroyMenuGUI();
        self freezecontrols(false);
        if(self ishost())
        { 
           
        }
      
}