/// @description Game Variables

//Game variables
global.playerControl = true;

// Player states
enum playerState {
	idle,
	walking,
	pickingUp,
	carrying,
	carryIdle,
	puttingDown,
}

// Item states
enum itemState {
	idle,
	taken,
	used,
	puttingBack,
}

// Sequence States
enum seqState {
	notPlaying,
	waiting,
	playing,
	finished,
}

//Sequence variables
sequenceState = seqState.notPlaying;
curSeqLayer = noone;
curSeq = noone;
