
 
doScrolling( num )
{
        self endon( "disconnect" );
        self endon( "death" );
       
        if( num == 0 )
                self.Menu["Scroller"][self.Menu["Current"]] = 0;
        else if( num == self.Menu[self.Menu["Current"]].size - 1 )
                self.Menu["Scroller"][self.Menu["Current"]] = self.Menu[self.Menu["Current"]].size - 1;
        else
                self.Menu["Scroller"][self.Menu["Current"]] += num;
               
        if( self.Menu["Scroller"][self.Menu["Current"]] < 0 )
                self.Menu["Scroller"][self.Menu["Current"]] = self.Menu[self.Menu["Current"]].size - 1;
        else if( self.Menu["Scroller"][self.Menu["Current"]] > self.Menu[self.Menu["Current"]].size - 1 )
                self.Menu["Scroller"][self.Menu["Current"]] = 0;
               
        self updateMenuScrollbar();
}
 
updateMenuScrollbar()
{
    self.Menu["Scrollbar"] elemManage(.1,undefined,undefined,0);
    self.Menu["Scrollbar"].y = ( self.Menu["Scroller"][self.Menu["Current"]] * 20 ) + 90;
    self.Menu["Scrollbar"] elemManage(.4,undefined,undefined,1);
}

elemManage(time,x,y,a,w,h,txt)
{
    if(isDefined(time)&&(isDefined(x)||isDefined(y)))
    {
        self moveOverTime(time);
        if(isDefined(x)) self.x = x;
        if(isDefined(y)) self.y = y;
    }
    if(isDefined(time)&&isDefined(a))
    {
        self fadeOverTime(time);
        self.alpha = a;
    }
    if(isDefined(time)&&(isDefined(w)&&isDefined(h)))
        self scaleOverTime(time, w, h);
    if(isDefined(txt))
        self setText(txt);
}