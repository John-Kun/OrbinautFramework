function PlayerMovementAir()
{	
	// Rotate angle back to 360 degrees
	if Angle < 180
	{
		Angle = max(Angle - 2.8125, 0);
	}
	else
	{
		Angle = min(Angle + 2.8125, 360);
	}
	
	// Limit vertical speed
	if Ysp < -15.75
	{
		Ysp = -15.75;
	}
	
	// Exit if gliding (ignoring GlideDrop state) or climbing
	if GlideState == GlideActive or GlideState == GlideStop or ClimbState
	{
		exit;
	}
	
	// Handle air movement
	if !AirLock
	{
		if Input.Left 
		{	
			// Decelerate
			if Xsp > 0 
			{
				Xsp -= AirAcc;
			} 
			
			// Accelerate
			else if !Game.AirSpeedcap and Xsp > -TopAcc or Game.AirSpeedcap
			{
				Xsp -= AirAcc;
				if Xsp <= -TopAcc
				{
					Xsp = -TopAcc;
				}
			}
			Facing = FlipLeft;
		}
		if Input.Right 
		{	
			// Decelerate
			if Xsp < 0 
			{
				Xsp += AirAcc;
			} 
			
			// Accelerate
			else if (!Game.AirSpeedcap and Xsp < TopAcc) or Game.AirSpeedcap
			{
				Xsp += AirAcc;
				if Xsp >= TopAcc
				{
					Xsp = TopAcc;
				}
			}
			Facing = FlipRight;
		}	
	}
	
	// Apply air drag
	if Ysp < 0 and Ysp > -4 and !Hurt
	{
		Xsp -= floor(Xsp/0.125) / 256;
	}
}