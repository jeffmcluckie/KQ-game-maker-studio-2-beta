/// @description Deal with music and more

//Play music based on room
switch room{
	case rm_gameMainL1: {
		audio_play_sound(snd_townBGM,1,1);
		audio_play_sound(snd_townAmbience,1,1);
	}; break;
}

//Mark Sequences Layer
if (layer_exists("Cutscenes")) {
	curSeqLayer = "Cutscenes";
}
else {
	curSeqLayer = "Instances";
}
