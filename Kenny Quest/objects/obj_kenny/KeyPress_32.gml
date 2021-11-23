   /// @description Textbox test
 
 var _text;
 
//If player has control
 if(global.playerControl == true) {
	 //If near NPC
	 if (nearbyNPC) {
		 //If NPC is still available
		 if (nearbyNPC.myState == npcState.normal){
			//If player does not have item
			if (hasItem == noone || hasItem == undefined) {
				_text = nearbyNPC.myText;
				if (!instance_exists(obj_textbox)) {
					iii = instance_create_depth(nearbyNPC.x,nearbyNPC.y-550,-10000,obj_textbox);
					iii.textToShow = _text;
					}
				}
			//If player has item (and it still exists)
			if (hasItem != noone && instance_exists(hasItem)){
				//If player has correct item
				if (hasItem.object_index == nearbyNPC.myItem){
					_text = nearbyNPC.itemTextHappy;
					obj_GUI.numberOfCollectibles += 1;
					audio_play_sound(snd_npc_complete,1,0);
					// Check if we should remove item, mark NPC
					alarm[1] = 10;
				}
				// Or if player has incorrect item
				else {
					_text = nearbyNPC.itemTextSad;
				}
				//Create textbox
				if (!instance_exists(obj_textbox)){
					iii = instance_create_depth(nearbyNPC.x,nearbyNPC.y-400,-10000,obj_textbox);
					iii.textToShow = _text;
					}
				}
			}
			// If NPC is done
			if(nearbyNPC.myState == npcState.done){
				_text = nearbyNPC.itemTextDone;
				if(!instance_exists(obj_textbox)){
					iii = instance_create_depth(nearbyNPC.x,nearbyNPC.y-400,-10000,obj_textbox);
					iii.textToShow = _text;
				}
			}
	 }
	 
	
	//If near item
	if(nearbyItem && !nearbyNPC) {
		//If player doesn't have item
		if (hasItem == noone || hasItem == undefined) {
			global.playerControl = false;
			myState = playerState.pickingUp;
			image_index = 0;
			hasItem = nearbyItem;
			//Take into account weight of the item we are picking up
			carryLimit = hasItem.itemWeight * 0.1;
			// Change state of item we are picking up
			with (hasItem) {
				myState = itemState.taken;
				}
			//Play pickup sound
			audio_play_sound(snd_itemPickup,1,0);
			}

		}
		
	//If not near an NPC or another item
	if (!nearbyItem && !nearbyNPC) {
		//Put down an item
		if (hasItem != noone) {
			myState = playerState.puttingDown;
			image_index = 0;
			global.playerControl = false;
			// Change state of item we were carrying
			with (hasItem) {
				putDownY = obj_kenny.y+5;
				myState = itemState.puttingBack;
			}
			//Play put down sound
			audio_play_sound(snd_itemPutDown,1,0);
			//Reset item
			hasItem = noone;
		}
	} 
 }
 
 //If Kevin is done to change music
		if(obj_npc_kevin.myState == npcState.done && audio_is_playing(snd_headlines) == false && audio_is_playing(snd_islandboy) == false){
			audio_stop_sound(snd_townBGM);
			audio_play_sound(snd_headlines,1,1);
			}
			
//If Kenny has 20 reds for Chelsea
		if(obj_GUI.numberOfCollectibles >= 20){
			obj_npc_chelsea.myState = npcState.done;
			instance_destroy(Object40);
		}

