/// @description Test sequence

//Set Sequence to center of camera view
var _camX = camera_get_view_x(view_camera[0])+floor(camera_get_view_width(view_camera[0])*0.5);
var _camY = camera_get_view_y(view_camera[0])+floor(camera_get_view_height(view_camera[0])*0.5);

//Create sequence on the proper layer
if !(layer_sequence_exists(curSeqLayer,seq_chris_hotdog)){
	if (layer_exists(curSeqLayer)) {
		layer_sequence_create(curSeqLayer,_camX,_camY,seq_chris_hotdog);
		// Make sure Cutscenes layer is above the action
		layer_depth(curSeqLayer,-10000);
	}
}