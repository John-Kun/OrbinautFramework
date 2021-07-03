function GameFrameworkSetup()
{
	// Dev mode. Enables some debug shortcuts and features, disable it on your game release
	Game.DevMode = true;
	
	// Default game state (in case we load right into stage avoiding menu)
	Game.Character = CharSonic;
	Game.Score	   = 0;
	Game.Lives	   = 3;
	Game.Continues = 0;
	Game.Emeralds  = 0;
	
	// Window settings
	Game.WindowFullscreen = false;
	Game.ResolutionWidth  = 400;
	Game.ResolutionHeight = 224;
	Game.WindowSize		  = 3;
	
	// Audio settings
	Game.MusicVolume = 0;
	Game.SoundVolume = 0.3;
	
	// Control settings (keyboard)
	Game.KeyboardControl = [vk_up, vk_down, vk_left, vk_right, ord("Z"), ord("X"), ord("C"), vk_space, vk_enter];
	
	// Originals differences
	Game.SpindashEnabled        = true;  // Enables S2 Spindash
	Game.DropdashEnabled        = false; // Enables Mania Dropdash
	Game.PeeloutEnabled         = true;  // Enables SCD Super Peel Out
	Game.GroundSpeedcap	        = false; // Enables ground speedcap
	Game.AirSpeedcap	        = false; // Enables air speedcap
	Game.RolljumpControl        = false; // Unlocks directional contorls if you jump after rolling
	Game.ExtendedCamera			= false; // Enables camera to shift to the side of your direction movement
	Game.StrongerSlopeGravity   = true;  // In S3 slope gravity and slope detach method were re-written to work better. True - Sonic 3+ method.
	Game.LooseCrouch		    = false; // In S&K, you can start crouching when you are moving slowly. True - SK method.
	Game.ConstantRollPhysics    = false; // In SK, rolling physics are the same for everyone. True - SK method
	Game.SpeedFloorClip	        = true;  // In S2 and later, the max distance you're allowed to clip to a floor is based on your speed. True = S2+ method
	Game.ExtensiveWallCollision	= true;  // In SK, you can collide with the walls on cardinal angles as well (90, 180, 270) instead of just in angle range of 270->360->90
	Game.StageTransitions		= true;  // In S3 stage transitions were introduced. True = S3+-like transitions (not a direct copy).
	Game.BalancingCrouch		= false; // In S3 and later you're allowed to crouch when balancing. True = S3+ method
	Game.BuffedWaterBarrier     = false; // In Sonic Mania, water barrier halves your xsp instead of setting it to 0
	
	// Orbinaut improvements
	Game.ImprovedTileCollision = true;  // Fixes several tile collision flaws
	Game.ImprovedObjCollision  = true;  // Fixes wacky hitboxes and fickle object collision
	Game.SmoothRotation	       = true;  // Use smooth rotation
	Game.RichPresenceSupport   = false; // Enable Rich Presence
	Game.RingsPreciseCollision = true;  // Make rings check for collision every frame instead of every 4
	Game.RingsNoBoundDespawn   = true;  // Make rings despawn as soon as they leave the screen
	Game.RingsAllSideCollision = false; // Make rings collide with walls and ceiling instead of just floor
	Game.NoRollSpeedLimit	   = false; // Disables xsp limitation when rolling. May cause collision glitches on higher speeds
	Game.FlyingCancel	       = true;  // Allows you to cancel flying as Tails
}