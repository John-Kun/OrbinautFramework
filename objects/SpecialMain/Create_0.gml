/// @description
// You can write your code in this editor
	
	RoomState = 0;
	RoomTimer = 0;
	
	// Turn screen white
	fade_perform(FadeTo, FadeWhite, 0);
	
	// Are we coming back from Special Stage?
	if Game.SpecialState
	{
		// Fade out
		fade_perform(FadeFrom, FadeWhite, 1);
		
		// Play music
		audio_play_sound(ActClear, 0, false);
	}
	else
	{
		switch Game.Emeralds
		{
			/* Add redirection here */
			
			// Default redicrection
			default:
				room_goto(SpecialStage1);
			break;
		}
	}