
createMenuGUI()
{
    self.Menu["Panel"] = [];
    self.Menu["Scrollbar"] = [];
    
    self.Menu["Panel"] = self createRectangle( "CENTER", "CENTER", 0, 0, "white", 250, 1000, (0, 0, 0), 0.7, 0 );
     self thread destroyOnAny(self, self.Menu["Panel"], "Menu_Opened", "Menu_Closed" );

     self.Menu["Panel2"] = self createRectangle( "CENTER", "CENTER", 125, 0, "white", 2, 1000, self.menuColors, 1, 2 );
     self thread destroyOnAny(self, self.Menu["Panel2"], "Menu_Opened", "Menu_Closed" );

     self.Menu["Panel3"] = self createRectangle( "CENTER", "CENTER", -125, 0, "white", 2, 1000, self.menuColors, 1, 3 );
     self thread destroyOnAny(self, self.Menu["Panel3"], "Menu_Opened", "Menu_Closed" );
   
     self.Menu["Scrollbar"] = self createRectangle( "CENTER", "TOP", 0, ( self.Menu["Scroller"][self.Menu["Current"]] * 20 ) + 110, "white", 250, 18, self.menuColors, 1, 1 );
    self thread destroyOnAny(self, self.Menu["Scrollbar"], "Menu_Opened", "Menu_Closed" );
}






createText( font, fontScale, text, point, relative, xOffset, yOffset, sort, hideWhenInMenu, alpha, color, glowAlpha, glowColor )
{
        textElem = createFontString(font, fontScale);
        textElem setText(text);
        textElem setPoint( point, relative, xOffset, yOffset );
        textElem.sort = sort;
        textElem.hideWhenInMenu = hideWhenInMenu;
        textElem.alpha = alpha;
        textElem.color = color;
        textElem.glowAlpha = glowAlpha;
        textElem.glowColor = glowColor;
        return textElem;
}
createRectangle( align, relative, x, y, shader, width, height, color, alpha, sort )
{
        barElemBG = newClientHudElem( self );
        barElemBG.elemType = "bar";
        if ( !level.splitScreen )
        {
                barElemBG.x = -2;
                barElemBG.y = -2;
        }
        barElemBG.width = width;
        barElemBG.height = height;
        barElemBG.align = align;
        barElemBG.relative = relative;
        barElemBG.xOffset = 0;
        barElemBG.yOffset = 0;
        barElemBG.children = [];
        barElemBG.sort = sort;
        barElemBG.color = color;
        barElemBG.alpha = alpha;
        barElemBG setParent( level.uiParent );
        barElemBG setShader( shader, width , height );
        barElemBG.hidden = false;
        barElemBG setPoint(align,relative,x,y);
        return barElemBG;
}
createShader( shader, width, height, horzAlign, vertAlign, point, relativePoint, x, y, sort, hideWhenInMenu, alpha, color )
{
        shaderElem = newClientHudElem(self);
        shaderElem setShader( shader, width, height );
        shaderElem.horzAlign = horzAlign;
        shaderElem.vertAlign = vertAlign;
        shaderElem.alignY = point;
        shaderElem.alignX = relativePoint;
        shaderElem.x = x;
        shaderElem.y = y;
        shaderElem.sort = sort;
        shaderElem.hideWhenInMenu = hideWhenInMenu;
        if(isDefined(alpha)) shaderElem.alpha = alpha;
        else shaderElem.alpha = 1;
        shaderElem.color = color;
        return shaderElem;
}
 
destroyOnDeathOrUpdate(client)
{
        client endon("disconnect");
        client waittill_any("death","Update","Menu_Is_Closed");
        self destroy();
}
 
destroyOnAny(client, elem, a = "", b = "")
{
    client waittill_any("death",a,b);
    elem destroy();
}
 
elemFade(time, newAlpha)
{
        self fadeOverTime(time);
        self.alpha = newAlpha;
}
 

 
createMenuText()
{
        self endon( "disconnect" );
        self endon( "death" );
       
        self.Menu["Text"] = [];
        self.Title["Text"] = [];
        self.Info["Text"] = [];
       
        for( i = 0; i < self.Menu[self.Menu["Current"]].size; i++ )
        {
            string = ( self.Menu[self.Menu["Current"]][i].label ); 

            self.Menu["Text"][i] = self createText( "default", 1.8, string, "CENTER", "TOP", 0, 110 + ( i * 20 ), 10000, true, 1, ( 1, 1, 1 ) );
                self.Menu["Text"][i] moveOverTime( 0.1 );
                self.Menu["Text"][i].x = 0;
                self.Menu["Text"][i].archived = false;
        }
            self.Title["Text1"] = self createText( "default", 2, "Trunks Menu", "CENTER", "TOP", 0, 30, 10000, true, 1, ( 1,1,1 ), 0, ( 1,1,1));
            self.Title["Text2"] = self createText( "default", 1.2, "by Leafized", "CENTER", "TOP", 0, 50, 10000, true, 1, ( 1,1,0 ), 0, ( 1,1, 0));
            self.Title["Text"] = self createText( "default", 1.8, self.Menu["Title"][self.Menu["Current"]], "CENTER", "TOP", 0, 70, 10000, true, 1, ( 1,1,1), 0, ( 1,1,1));
}
    
destroyMenuText()
{
    if(isDefined(self.Menu["Text"]))
    {
        foreach(text in self.Menu["Text"])
        {
            text destroy();
        }
    }
    if(isDefined(self.Title["Text"]))
    {
        self.Title["Text"] destroy();
        self.Title["Text2"] destroy();
        self.Title["Text1"] destroy();
    }
}


destroyMenuGUI()
{
    if(isDefined(self.Menu["Panel"]))
    {
        self.Menu["Panel"] destroy();
        self.Menu["Panel2"] destroy();
        self.Menu["Panel3"] destroy();
    }
    if(isDefined(self.Menu["Scrollbar"]))
    {
        self.Menu["Scrollbar"] destroy();
    }
}
 
addMenuPage( parent, child, label, title )
{
    if( !isDefined( title ) )
            title = label;
    else
            title = title;
    
    arrSize = self.Menu[parent].size;
    
    self.Menu[parent][arrSize] = spawnStruct();
    self.Menu[parent][arrSize].response = "SubMenu";
    self.Menu[parent][arrSize].label = label;
    self.Menu["Title"][child] = title;
    self.Menu[parent][arrSize].child = child;
    self.Menu[parent][arrSize ].bool = false;
    
    self.Menu[child] = [];
    
    self.Menu["Parents"][child] = parent;
    self.Menu[parent][arrSize].action = ::enterMenu;
    self.Menu[parent][arrSize].arg = child;
    self.Menu["Scroller"][self.Menu["Current"]][child] = 0;
}

addMenuOption( menu, label, action, arg, arg2, arg3, arg4, arg5, arg6, response, response2 )
{
    arrSize = self.Menu[menu].size;
    
    self.Menu[menu][arrSize] = spawnStruct();
    self.Menu[menu][arrSize].label = label;
    self.Menu[menu][arrSize].action = action;
    self.Menu[menu][arrSize].arg = arg;
    self.Menu[menu][arrSize].arg2 = arg2;
    self.Menu[menu][arrSize].arg3 = arg3;
    self.Menu[menu][arrSize].arg4 = arg4;
    self.Menu[menu][arrSize].arg5 = arg5;
    self.Menu[menu][arrSize].arg6 = arg6;
    self.Menu[menu][arrSize ].bool = false;
    
    if( !isDefined( response ) )
            self.Menu[menu][arrSize].response = "Action";
    else
            self.Menu[menu][arrSize].response = response;
}

addBoolOption( menu, label, bool, action, arg, arg2, arg3, arg4, arg5, arg6, response, response2 )
{
    arrSize = self.Menu[menu].size;
    
    self.Menu[menu][arrSize] = spawnStruct();
    self.Menu[menu][arrSize].label = label;
    self.Menu[menu][arrSize].action = action;
    self.Menu[menu][arrSize].arg = arg;
    self.Menu[menu][arrSize].arg2 = arg2;
    self.Menu[menu][arrSize].arg3 = arg3;
    self.Menu[menu][arrSize].arg4 = arg4;
    self.Menu[menu][arrSize].arg5 = arg5;
    self.Menu[menu][arrSize].arg6 = arg6;
    
    
    if( !isDefined( response ) )
            self.Menu[menu][arrSize].response = "Action";
    else
            self.Menu[menu][arrSize].response = response;
            
    if(bool == true)
    self.Menu[menu][arrSize].bool = true;
    else
    self.Menu[menu][arrSize].bool = false;
}