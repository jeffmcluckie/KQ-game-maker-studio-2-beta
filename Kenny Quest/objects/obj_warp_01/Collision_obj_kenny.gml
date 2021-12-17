/// @description collision w warp

//room_goto(roomTo);
//obj_kenny.x = xPosition;
//obj_kenny.y = yPosition;

warp = instance_create_depth(x, y, depth - 1000, obj_warpController)
warp.newX = xPosition;
warp.newY = yPosition;
warp.newRoom = roomTo;
obj_GUI.numberOfCollectibles = 0;

if(audio_is_playing(snd_townBGM) == true || audio_is_playing(snd_headlines) == true){
			audio_stop_sound(snd_townBGM);
			audio_stop_sound(snd_headlines);
			audio_stop_sound(snd_fountain);
			audio_play_sound(snd_islandboy,1,1);
			}
			
if(audio_is_playing(snd_islandboy) == true){
			audio_stop_sound(snd_islandboy);
			//play different song
			}