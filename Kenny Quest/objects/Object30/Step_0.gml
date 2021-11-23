/// @description Pick up collectible

if(place_meeting(x,y,obj_kenny)){
	obj_GUI.numberOfCollectibles += 1;
	audio_play_sound(snd_coughing,1,0);
	instance_destroy(self);
}
