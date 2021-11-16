// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
//ITEM DOESNT SNAP TO KENNYS IDLE POSITION
function scr_itemPosition(){
	var _x, _y, _depth;
	if(instance_exists(obj_kenny)) {
			switch obj_kenny.dir {
			case 0: { //right
				_x = obj_kenny.x+65;
				_y = obj_kenny.y-50;
				_depth = obj_kenny.depth-2;
				}; break;
			case 1: { //up
				_x = obj_kenny.x-50;
				_y = obj_kenny.y-50;
				_depth = obj_kenny.depth-2;
				}; break;
			case 2: { //left
				_x = obj_kenny.x-65;
				_y = obj_kenny.y-50;
				_depth = obj_kenny.depth-2;
				}; break;
			case 3: { //down
				_x = obj_kenny.x-50;
				_y = obj_kenny.y+75;
				_depth = obj_kenny.depth-2;
				}; break;
		}
	return [_x,_y,_depth];
	}
}