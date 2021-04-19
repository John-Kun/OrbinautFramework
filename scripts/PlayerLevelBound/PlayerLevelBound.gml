function PlayerLevelBound()
{
	// Keep the player inside of stage boundaries using our next position
	if floor(PosX + Xsp) < Stage.LeftBoundary + 16 
	{
		PosX	 = Stage.LeftBoundary + 16;
		Xsp      = 0;
		Inertia  = 0;
	}
	if floor(PosX + Xsp) > Stage.RightBoundary - 24 
	{
		PosX	 = Stage.RightBoundary - 24;
		Xsp      = 0;
		Inertia  = 0;
	}
	
	// Kill player
	if !Death
	{
		if Screen.MaxRenderY > Stage.BottomBoundary  and floor(PosY) > Screen.MaxRenderY
		or Screen.MaxRenderY <= Stage.BottomBoundary and floor(PosY) > Stage.BottomBoundary
		{
			// Reset flags
			Grounded	  = false;
			OnObject	  = false;
			Rolling		  = false;
			Jumping		  = false;
			FlyingState	  = false;
			GlidingState  = false;
			ClimbingState = false;
			
			// Disable collision and camera
			Screen.CameraEnabled = false;
			AllowCollision		 = false;
			
			// Draw player above everything
			DrawOrder = 0;
			
			// Perform movement
			Inertia = 0;
			Xsp	    = 0;
			Ysp	    = -7;
			Grv	    = 0.21875;
			
			// Play sound
			audio_sfx_play(sfxDeath, false, true);
			
			// Set animation
			Animation = AnimDeath;
			
			// Enter death script
			Death = true;
		}
	}
}