function PlayerCollideFloor()
{	
	// Do not collide if we're not allowed to, or if we're standing on object
	if (!AllowCollision or OnObject) exit;
	
	// Define angle range
	switch AngleRange
	{
		case RangeFloor:
		{
			if tile_meeting(floor(PosX - xRadius * 2), floor(PosY + yRadius / 2), Layer)
			or tile_meeting(floor(PosX + xRadius * 2), floor(PosY + yRadius / 2), Layer)
			{
				AngleRange = round(Angle/90) % 4;
			}
		}
		break;
		case RangeRWall:
		{
			if tile_meeting(floor(PosX + yRadius / 2), floor(PosY - xRadius * 2), Layer)
			or tile_meeting(floor(PosX + yRadius / 2), floor(PosY + xRadius * 2), Layer)
			{
				AngleRange = round(Angle/90) % 4;
			}
		}
		break;
		case RangeRoof:
		{
			if tile_meeting(floor(PosX - xRadius * 2), floor(PosY - yRadius / 2), Layer)
			or tile_meeting(floor(PosX + xRadius * 2), floor(PosY - yRadius / 2), Layer)
			{
				AngleRange = round(Angle/90) % 4;
			}
		}
		break;
		case RangeLWall:
		{
			if tile_meeting(floor(PosX - yRadius / 2), floor(PosY - xRadius * 2), Layer)
			or tile_meeting(floor(PosX - yRadius / 2), floor(PosY + xRadius * 2), Layer)
			{
				AngleRange = round(Angle/90) % 4;
			}
		}
	}
	
	// Collide with one of four floor sides based on floor angle range
	switch AngleRange
	{
		case RangeFloor:
		{		
			// Get tiles
			var tileDataLeft  = tile_check_collision_v(floor(PosX - xRadius), floor(PosY + yRadius), true, false, Layer);
			var tileDataRight = tile_check_collision_v(floor(PosX + xRadius), floor(PosY + yRadius), true, false, Layer);
			
			// Use tile with closest distance
			if tileDataLeft[0] <= tileDataRight[0]
			{
				var floorDistance = tileDataLeft[0];
				var floorAngle	  = tileDataLeft[1];
			}
			else
			{
				var floorDistance = tileDataRight[0];
				var floorAngle	  = tileDataRight[1];
			}
			
			// Perform floor collision
			var maxDistance = Game.SpeedFloorClip ? min(4 + abs(floor(Xsp)), 14) : 14;
			if  maxDistance <= floorDistance
			{
				Grounded = false;
				exit;
			}
			else if floorDistance > -14
			{
				PosY += floorDistance;
			}
		}
		break;
		case RangeRWall:
		{	
			// Get tiles
			var tileDataLeft  = tile_check_collision_h(floor(PosX + yRadius), floor(PosY + xRadius), true, false, Layer);
			var tileDataRight = tile_check_collision_h(floor(PosX + yRadius), floor(PosY - xRadius), true, false, Layer);
			
			// Use tile with closest distance
			if tileDataLeft[0] <= tileDataRight[0]
			{
				var floorDistance = tileDataLeft[0];
				var floorAngle	  = tileDataLeft[1];
			}
			else
			{
				var floorDistance = tileDataRight[0];
				var floorAngle	  = tileDataRight[1];
			}
			
			// Perform floor collision
			var maxDistance = Game.SpeedFloorClip ? min(4 + abs(floor(Ysp)), 14) : 14;
			if  maxDistance <= floorDistance
			{
				Grounded = false;
				exit;
			}
			else if floorDistance > -14
			{
				PosX += floorDistance;
			}
		}
		break;
		case RangeRoof:	
		{	
			// Get tiles
			var tileDataLeft  = tile_check_collision_v(floor(PosX + xRadius), floor(PosY - yRadius), false, false, Layer);
			var tileDataRight = tile_check_collision_v(floor(PosX - xRadius), floor(PosY - yRadius), false, false, Layer);
			
			// Use tile with closest distance
			if tileDataLeft[0] <= tileDataRight[0]
			{
				var floorDistance = tileDataLeft[0];
				var floorAngle	  = tileDataLeft[1];
			}
			else
			{
				var floorDistance = tileDataRight[0];
				var floorAngle    = tileDataRight[1];
			}
			
			// Perform floor collision
			var maxDistance = Game.SpeedFloorClip ? min(4 + abs(floor(Xsp)), 14) : 14;
			if  maxDistance <= floorDistance
			{
				Grounded = false;
				exit;
			}
			else if floorDistance > -14
			{
				PosY -= floorDistance;
			}
		}
		break;
		case RangeLWall:
		{	
			// Get tiles
			var tileDataLeft  = tile_check_collision_h(floor(PosX - yRadius), floor(PosY - xRadius), false, false, Layer);
			var tileDataRight = tile_check_collision_h(floor(PosX - yRadius), floor(PosY + xRadius), false, false, Layer);
			
			// Use tile with closest distance
			if tileDataLeft[0] <= tileDataRight[0]
			{
				var floorDistance = tileDataLeft[0];
				var floorAngle    = tileDataLeft[1];
			}
			else
			{
				var floorDistance = tileDataRight[0];
				var floorAngle    = tileDataRight[1];
			}
			
			// Perform floor collision
			var maxDistance = Game.SpeedFloorClip ? min(4 + abs(floor(Ysp)), 14) : 14;
			if  maxDistance <= floorDistance
			{
				Grounded = false;
				exit;
			}
			else if floorDistance > -14
			{
				PosX -= floorDistance;
			}
		}
		break;
	}
	
	// Update player's angle
	if Game.ConsiderAngleDifference
	{
		var angDifference = abs(Angle - floorAngle);
		if  angDifference < 180
		{
			Angle = angDifference > 45  ? (round(Angle/90) % 4) * 90 : floorAngle;
		}
		else
		{
			Angle = angDifference < 315 ? (round(Angle/90) % 4) * 90 : floorAngle;
		}
		if (Angle == 0) Angle = 360;
		
		// Force disable balance
		Balancing = false;
	}
	else
	{
		Angle = floorAngle;
	}
	
	// Store values to display in debug
	Screen.DebugValue[0] = tileDataLeft[0];
	Screen.DebugValue[1] = tileDataRight[0];
	Screen.DebugValue[2] = tileDataLeft[1];
	Screen.DebugValue[3] = tileDataRight[1];
	Screen.DebugValue[4] = tileDataLeft[0] <= tileDataRight[0] ? "LEFT" : "RIGHT";
}