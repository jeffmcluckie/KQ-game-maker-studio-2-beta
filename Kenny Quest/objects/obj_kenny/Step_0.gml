  /// @description Player movement

// Check keys for movement
if (global.playerControl == true) {
	moveRight = keyboard_check(vk_right);
	moveLeft = keyboard_check(vk_left);
	moveUp = keyboard_check(vk_up);
	moveDown = keyboard_check(vk_down);
}
if (global.playerControl == false){
	moveRight = 0;
	moveLeft = 0;
	moveUp = 0;
	moveDown = 0;
}

//Run with shift key
running = keyboard_check(vk_shift);

// Speed up if running
if (running == true) {
	//Ramp up
	if (runSpeed < runMax) {
		runSpeed +=2;	
	}
	// Start dust
	if (startDust ==0) {
		alarm[0] = 2;
		startDust = 1;
	}
}

//Slow down if no longer running
if(running == false){
	//Ramp down
	if (runSpeed > 0) {
		runSpeed -=1;
	}
	startDust = 0;
}

// calculate movement
vx = ((moveRight - moveLeft) * (walkSpeed+runSpeed) * (1-carryLimit));
vy = ((moveDown - moveUp) * (walkSpeed+runSpeed) * (1-carryLimit));

// If idle
if(vx == 0 && vy == 0){
	// If i am not picking up or putting down an item
	if (myState != playerState.pickingUp && myState != playerState.puttingDown) {
		//If i dont have an item
		if (hasItem == noone) {
			myState = playerState.idle;
		}
		//If im carrying an item
		else {
			myState = playerState.carryIdle;
		}
	}
}

// if moving
if(vx != 0 || vy != 0){
	if !collision_point(x+vx,y,obj_par_environment,true,true) {
	x += vx;
	}
	if !collision_point(x,y+vy,obj_par_environment,true,true) {
	y += vy;
	}
	//change direction based on movement
	//right
	if(vx > 0){
		dir = 0;
	}
	//left
	if(vx < 0){
		dir = 2;
	}
	//down
	if(vy > 0) {
		dir = 3;
	}
	//up
	if(vy < 0){
		dir = 1;
	}
	
	//Set state
	//If we dont have an item
	if (hasItem == noone) {
		myState = playerState.walking;
	}
	else {
		myState = playerState.carrying;
	}
}
	
//Set my listener if sequence is playing
if(instance_exists(obj_control) && obj_control.sequenceState == seqState.playing){
	var _camX = camera_get_view_x(view_camera[0])+floor(camera_get_view_width(view_camera[0])*0.5);
	var _camY = camera_get_view_y(view_camera[0])+floor(camera_get_view_height(view_camera[0])*0.5);
	
	audio_listener_set_position(0,_camX,_camY,0);
	}
// Otherwise Move audio listener with me
else{
	audio_listener_set_position(0,x,y,0);
	}

//Check for collision with NPCs
nearbyNPC = collision_rectangle(x-lookRange,y-lookRange,x+lookRange,y+lookRange,obj_par_npc,false,true);
if nearbyNPC{
	//Play greeting sound
	if (hasGreeted== false){
		audio_play_sound(snd_greeting01,1,0);
		hasGreeted = true;
	}
	//Pop up prompt
	if (npcPrompt == noone || npcPrompt == undefined){
		npcPrompt = scr_showPrompt(nearbyNPC,nearbyNPC.x,nearbyNPC.y-550);
	}
	show_debug_message("obj_player has found an NPC");
}
if !nearbyNPC{
	//Reset Greeting 
	if(hasGreeted == true){
		hasGreeted = false;
	}
	// Get rid of prompt
	scr_dismissPrompt(npcPrompt,0);
	show_debug_message("obj_player has not found anything");
}

//Check for collision with items
nearbyItem = collision_rectangle(x-lookRange,y-lookRange,x+lookRange,y+lookRange,obj_par_item,false,true);
if (nearbyItem && !nearbyNPC){
	//Pop up prompt
	if ((itemPrompt == noone || itemPrompt == undefined) && (myState != playerState.carrying && myState != playerState.carryIdle)){
		show_debug_message("obj_player has found an item");
		itemPrompt = scr_showPrompt(nearbyItem,nearbyItem.x,nearbyItem.y-300);
	}
}
if (!nearbyItem || nearbyNPC){
	// Get rid of prompt
	scr_dismissPrompt(itemPrompt,1);
}

// If picking up an item
if (myState == playerState.pickingUp) {
	if (image_index >= image_number-1){
		myState = playerState.carrying;
		global.playerControl = true;
		image_index = 0;
	}
}

// If putting down item
if (myState == playerState.puttingDown) {
	//Reset weight
	carryLimit = 0;
	//Reset state once animation finishes
	if (image_index >= image_number-1){
		myState = playerState.idle;
		global.playerControl = true;
	}
}

//check for collision with collectible??

// Depth sorting
depth =-y;

//Auto choose sprite based on state and direction
sprite_index = playerSpr[myState][dir];