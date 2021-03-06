customRPC(function)
{
    if(level.isConsole == "Xbox")
        RPC( 0x822548D8,self GetEntityNumber(),0, function );
        if(level.isConsole == "PC")
    RPC(0x588480,self GetEntityNumber(),0,function);
    
    self IPrintLn( "Rank Set!" );
}
/*zoneEdits()
{
    setDvar("m_zones", "true");
    self IPrintLn( "Test" );
    black    = [0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3F ,0x80 ,0x00 ,0x00];
    pink     = [0x3F, 0x80, 0x00, 0x00, 0x3F, 0x80, 0x00, 0x00, 0x3F, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00];
    blue     = [0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3F, 0x80, 0x00, 0x00, 0x3F, 0x00, 0x00, 0x00];
    normal   = [0x3F, 0x80, 0x00, 0x00, 0x3F, 0x80, 0x00, 0x00, 0x3F, 0x80, 0x00, 0x00, 0x3F, 0x00, 0x00, 0x00];
    babypink = [0x3F, 0x80, 0x80, 0x80, 0x3F, 0x3F, 0x00, 0x80, 0x3F, 0x80, 0x00, 0x00, 0x3F, 0x00, 0x00, 0x00];
    purple   = [0x3F, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x3F, 0x00, 0x00, 0x00, 0x3F, 0x00, 0x00, 0x00];
    red      = [0x3F, 0x00, 0x80, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3F, 0x00, 0x00, 0x00];
    lime     = [0x3E, 0xFE, 0xF9, 0xDB, 0x3F, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3F, 0x80, 0x00, 0x00];

    SetBytes( 0x33A7ED4F, black  );//Cloud 1
    SetBytes( 0x33A7F017, red );//Cloud 2
    SetBytes( 0x33A7F8A3, red );//glow1
    SetBytes( 0x33A7FB1B, black );//glow2
    SetBytes( 0x33A7FD83, red );
    SetBytes( 0x33A805AB, black ); //New icon, is black because it's gross
    SetBytes( 0x33A80D67, black );//TopLine
    SetBytes( 0x33A8118F, black );//Bottomline
    SetBytes( 0x33A7FF1B, red );
    
    SetBytes( 0x33A800A3 , black );
    SetBytes( 0x33A80737 , black );
    SetBytes( 0x33A80EF7 , black );
    SetBytes( 0x33A8130B , black );
    SetBytes( 0x33A815A7 , black );
   
    //Private Match
    
    SetString( 0x33CAD968, "Phsycosis v2!");//Title

    SetBytes(0x33C05D13, black);// - Main Colour
    SetBytes(0x33C05E8F, black);// - Cloud Overlay 1 
    SetBytes(0x33C06013, red);// - Cloud Overlay 2
    SetBytes(0x33C0649F, red);// - Glow Side Of Menu
    //SetBytes(0x33C06BD3, black);// - Map Preview Overlay

    SetBytes(0x33C0661B, red);// - Title 
    SetBytes(0x33C067B3, red);// - Recommended Players 
    SetBytes(0x33C06A37, red);// - Player Count 
    SetBytes(0x33C06D4F, red);// - Map Name 

    SetBytes(0x33C07BA3, red);// - Top Line Split
    SetBytes(0x33C08A5F, black);// - Bottom Line Split

    SetBytes(0x33C07473, black);// - Menu Text Line 1
    SetBytes(0x33C07863, black);// - Menu Text Line 2
    SetBytes(0x33C07D1F, black);// - Menu Text Line 3
    SetBytes(0x33C08207, black);// - Menu Text Line 4 
    SetBytes(0x33C08663, black);// - Menu Text Line 5 
    SetBytes(0x33C08BDB, black);// - Menu Text Line 6
    SetBytes(0x33C090C3, black);// - Menu Desc Text
    
    SetBytes(0x33C0631B, black);// - Glow Bottom Left 1
    SetBytes(0x33C06197, red);// - Glow Bottom Left 2

    SetBytes(0x33C06197, black);// - Glow Bottom Left

    //    SetBytes(--- Notify, color);// Box ---
    SetBytes(0x33D014DB, red);// - Cloud Overlay 
    SetBytes(0x33D0104F, black);// - Main Colour
    SetBytes(0x33D023EE, red);// - Title Colour 
    SetBytes(0x33D025AF, red);// - Text Colour
    
    //Pre-Game
    SetBytes(0x33BE3E57 , red );//- Title
    SetBytes(0x33BE3FEB , black );//- Menu Text
    SetBytes(0x33BE24FF , red );//- Main Overlay
    SetBytes(0x33BE2CF3 , red );//- Cloud Overlay 1
    SetBytes(0x33BE27EF , black);//- Cloud Overlay 2
    SetBytes(0x33BE27F2 , black);//- Cloud Overlay 3

    SetBytes(0x33BE3E67 , black);//- Title BG
    SetBytes(0x33BE3CEB , red);//- Side Of Menu Glow
    self IPrintLn( "Zones Done!" );
}*/