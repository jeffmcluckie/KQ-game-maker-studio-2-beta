/// @description HUD for player with timer, health, collectibles

draw_sprite(spr_reds,-1,50,70);
draw_set_font(font_textbox);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text_transformed(_xxCounter,_yyCounter,":" + string(numberOfCollectibles),2,2,0);


if (_min==0 && _sec==0) // if text equals 00:00
{ 
   //This indicates the time is  00:00.
   draw_text_transformed(_xx,_yy,string("0") + string(_min) + string(":") + string(_sec) + string("0"),2,2,0);

}
else if (_min>=10) // if text is greater than 10 _min
{
   if (_sec>=10) // if _sec equals or is greater than 10
   {
       draw_text_transformed(_xx,_yy,string(_min) + string(":") + string(_sec),2,2,0);
   }
   else if (_sec<=9)  // if sec is less than 9.
   {
       draw_text_transformed(_xx,_yy,string(_min) + string(":0") + string(_sec),2,2,0); 
   }
     
}
else if (_min<10) // if min is less than 10.
{
   if (_sec>=10) // if sec is greater than 10.
   {
       draw_text_transformed(_xx,_yy,string("0") + string(_min) + string(":") + string(_sec),2,2,0);
   }
   else if (_sec<=9) // if sec is less than 9.
   {
       draw_text_transformed(_xx,_yy,string("0") + string(_min) + string(":0") + string(_sec),2,2,0); 
   }
}
