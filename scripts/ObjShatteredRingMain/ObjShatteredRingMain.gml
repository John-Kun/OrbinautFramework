function ObjShatteredRingMain()
{
	// Play animation
	animation_play(sprite_index, floor((256 * 2) / Timer), 0);
	
	// Check if it is time for ring to disappear
	if !(--Timer)
	{
		instance_destroy();
	}
	
	// Move ring
	PosX += Xsp;
	PosY += Ysp;
	Ysp  += Grv;
		
	// Collide with floor
	if Ysp > 0 and (++CollisionCheck mod 4 == 0 or Game.SMRingBehaviour)
	{
		// Collide with floor
		var FindFloor = tile_check_collision_v(PosX, PosY + 8, true, false, Player.Layer)[0];
		if  FindFloor < 0
		{
			PosY += FindFloor;
			Ysp   = min(Ysp * -0.75, -2);
		}
	}
	
	// Update position
	object_update_position(PosX, PosY);
		
	// Check for hitbox collision
	if PickupTimeout
	{
		PickupTimeout--;
	}
	else if object_check_overlap(Hitbox)
	{
		// Add 1 to ring counter
		Player.Rings++;
		
		// Play sound
		audio_sfx_play(Player.Rings mod 2 == 0 ? sfxRingLeft : sfxRingRight, false);
	
		// Create sparkle object in place of ring
		instance_create(x, y, RingSparkle);	
		instance_destroy();
	}
}