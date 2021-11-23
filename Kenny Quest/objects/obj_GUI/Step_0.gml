/// @description Clock
_milliSec += 1;
if(_milliSec % 60 == 0){
	if(_sec == 60) {
		_min +=1;
		_sec =0;
	}
	else{
		_sec +=1;
	}
}

