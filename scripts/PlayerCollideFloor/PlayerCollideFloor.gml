function PlayerCollideFloor()
{	
	// Do not collide if we're not allowed to
	if !AllowCollision exit;
	
	// Do not collide with floor when on object
	if OnObject exit;
	
	// Collide with one of four floor sides based on floor angle range
	switch round(Angle/90) % 4
	{
		case RangeFloor:
		{	
			// Get floor distances
			var dLeft  = tile_get_data_v(floor(PosX - xRadius), floor(PosY + yRadius), Layer, true, "data_distance", false);
			var dRight = tile_get_data_v(floor(PosX + xRadius), floor(PosY + yRadius), Layer, true, "data_distance", false);
			
			// Calculate collision tolerance
			CollisionDistance = Game.SpeedFloorClip ? min(4 + abs(floor(Xsp)), 14) : 14;
			
			// Collide using closest distance
			var Distance = dLeft <= dRight ? dLeft : dRight;
			if  Distance > CollisionDistance
			{
				Grounded = false;
			}
			else if Distance > -14
			{
				PosY += Distance;
			}
		}
		break;
		case RangeRWall:
		{	
			// Get floor distances
			var dLeft  = tile_get_data_h(floor(PosX + yRadius), floor(PosY + xRadius), Layer, true, "data_distance", false);
			var dRight = tile_get_data_h(floor(PosX + yRadius), floor(PosY - xRadius), Layer, true, "data_distance", false);
			
			// Calculate collision tolerance
			CollisionDistance = Game.SpeedFloorClip ? min(4 + abs(floor(Ysp)), 14) : 14;

			// Collide using closest distance
			var Distance = dLeft <= dRight ? dLeft : dRight;
			if  Distance > CollisionDistance
			{
				Grounded = false;
			}
			else if Distance > -14
			{
				PosX += Distance;
			}
		}
		break;
		case RangeRoof:
		{	
			// Get floor distances
			var dLeft  = tile_get_data_v(floor(PosX + xRadius), floor(PosY - yRadius), Layer, false, "data_distance", false);
			var dRight = tile_get_data_v(floor(PosX - xRadius), floor(PosY - yRadius), Layer, false, "data_distance", false);

			// Calculate collision tolerance
			CollisionDistance = Game.SpeedFloorClip ? min(4 + abs(floor(Xsp)), 14) : 14;
			
			// Collide using closest distance
			var Distance = dLeft <= dRight ? dLeft : dRight;
			if  Distance > CollisionDistance
			{
				Grounded = false;
			}
			else if Distance > -14
			{
				PosY -= Distance;
			}
		}
		break;
		case RangeLWall:
		{	
			// Get floor distances and angles
			var dLeft  = tile_get_data_h(floor(PosX - yRadius), floor(PosY - xRadius), Layer, false, "data_distance", false);
			var dRight = tile_get_data_h(floor(PosX - yRadius), floor(PosY + xRadius), Layer, false, "data_distance", false);
			
			// Calculate collision tolerance
			CollisionDistance = Game.SpeedFloorClip ? min(4 + abs(floor(Ysp)), 14) : 14;

			// Collide using closest distance
			var Distance = dLeft <= dRight ? dLeft : dRight;
			if  Distance > CollisionDistance
			{
				Grounded = false;
			}
			else if Distance > -14
			{
				PosX -= Distance;
			}
		}
		break;
	}
}