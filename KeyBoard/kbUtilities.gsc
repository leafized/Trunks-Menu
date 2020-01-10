/*
*    Infinity Loader :: Created By AgreedBog381 && SyGnUs Legends
*
*    Project : Phsycosis v2
*    Author : 
*    Game : MW2
*    Description : 
*    Date : 12/6/2019 3:25:50 AM
*
*/

illegalCharacter(letter)
{
    ill = "*{}!^/-_$&@#()";
    for(a=0;a < ill.size;a++)
        if(letter == ill[a])
            return true;
    return false;
}