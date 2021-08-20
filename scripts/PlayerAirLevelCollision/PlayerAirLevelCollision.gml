function PlayerAirLevelCollision()
{
	// Exit if climbing or gliding
	if ClimbState or GlideState
	{
		exit;
	}
	
	// Get movement angle quadrant
	if abs(Xsp) >= abs(Ysp)
	{
		var MoveDirection = Xsp > 0 ? "MoveRight" : "MoveLeft";
	}
	else
	{
		var MoveDirection = Ysp > 0 ? "MoveDown" : "MoveUp";
	}
	switch MoveDirection
	{
		case "MoveDown":
		{
			// Collide with left wall
			var LeftDistance = tile_check_collision_h(floor(PosX - 10), floor(PosY), false, true, Layer)[0];
			if  LeftDistance < 0
			{
				PosX -= LeftDistance;
				Xsp   = 0;
			}
			
			// Collide with right wall
			var RightDistance = tile_check_collision_h(floor(PosX + 10), floor(PosY), true, true, Layer)[0];
			if  RightDistance < 0
			{
				PosX += RightDistance;
				Xsp   = 0;
			}
			
			// Check for floor
			var TileLeft    = tile_check_collision_v(floor(PosX - RadiusX), floor(PosY + RadiusY), true, false, Layer);
			var TileRight   = tile_check_collision_v(floor(PosX + RadiusX), floor(PosY + RadiusY), true, false, Layer);
			var NearestTile = tile_check_nearest(TileLeft, TileRight, noone);
			
			// Get data
			var FloorDistance = NearestTile[0];
			var FloorAngle    = NearestTile[1];
			
			// Collide with floor
			if FloorDistance < 0
			{
				// Make sure if second distance is within the clip distance
				var ClipDistance = -(Ysp + 8)
				if  TileLeft[0] >= ClipDistance or TileRight[0] >= ClipDistance
				{
					if FloorAngle >= 46.41 and FloorAngle <= 315
					{
						Xsp		= 0;
						Inertia = FloorAngle < 180 ? -Ysp : Ysp;
					}
					else if FloorAngle >= 23.91 and FloorAngle <= 337.5
					{
						Inertia = FloorAngle < 180 ? -Ysp / 2 : Ysp / 2;
					}
					else 
					{	
						Ysp     = 0;
						Inertia = Xsp;	
					}
				
					PosY    += FloorDistance;
					Angle    = FloorAngle;
					Grounded = true;
				}
			}	
		}
		break;	
		case "MoveUp":
		{
			// Collide with left wall
			var LeftDistance = tile_check_collision_h(floor(PosX - 10), floor(PosY), false, true, Layer)[0];
			if  LeftDistance < 0
			{
				PosX -= LeftDistance;
				Xsp   = 0;
			}
			
			// Collide with right wall
			var RightDistance = tile_check_collision_h(floor(PosX + 10), floor(PosY), true, true, Layer)[0];
			if  RightDistance < 0
			{
				PosX += RightDistance;
				Xsp   = 0;
			}
			
			// Check for ceiling
			var TileLeft    = tile_check_collision_v(floor(PosX - RadiusX), floor(PosY - RadiusY), false, true, Layer);
			var TileRight   = tile_check_collision_v(floor(PosX + RadiusX), floor(PosY - RadiusY), false, true, Layer);
			var NearestTile = tile_check_nearest(TileLeft, TileRight, noone);
			
			// Get data
			var RoofDistance = NearestTile[0];
			var RoofAngle    = NearestTile[1];
			
			// Collide with ceiling
			if RoofDistance < 0
			{	
				if (RoofAngle >= 91.41 and RoofAngle <= 136.41 or RoofAngle >= 226.41 and RoofAngle <= 268.59) and !FlightState
				{
					Angle    = RoofAngle;
					Inertia  = RoofAngle < 180 ? -Ysp : Ysp;
					Grounded = true;
				}
				else 
				{
					if FlightState
					{
						Grv	= 0.03125;
					}	
					Ysp = 0;
				}				
				PosY -= RoofDistance;
			}
		}
		break;		
		case "MoveLeft":
		{
			// Collide with left wall
			var LeftDistance = tile_check_collision_h(floor(PosX - 10), floor(PosY), false, true, Layer)[0];
			if  LeftDistance < 0
			{
				PosX -= LeftDistance;
				Xsp   = 0;
				
				// Set inertia to... ysp?
				Inertia = Ysp;
			}
			
			// Try ceiling collision
			else
			{
				// Check for ceiling
				var TileLeft    = tile_check_collision_v(floor(PosX - RadiusX), floor(PosY - RadiusY), false, true, Layer);
				var TileRight   = tile_check_collision_v(floor(PosX + RadiusX), floor(PosY - RadiusY), false, true, Layer);
				var NearestTile = tile_check_nearest(TileLeft, TileRight, noone);
				
				// Get data
				var RoofDistance = NearestTile[0];
				var RoofAngle    = NearestTile[1];
			
				// Collide with ceiling
				if RoofDistance < 0
				{	
					if Ysp < 0
					{
						Ysp = 0;
					}
					if FlightState
					{
						Grv	= 0.03125;
					}
					PosY -= RoofDistance;
				}
				
				// Try floor collision
				else if Ysp > 0
				{
					// Check for floor
					var TileLeft    = tile_check_collision_v(floor(PosX - RadiusX), floor(PosY + RadiusY), true, false, Layer);
					var TileRight   = tile_check_collision_v(floor(PosX + RadiusX), floor(PosY + RadiusY), true, false, Layer);
					var NearestTile = tile_check_nearest(TileLeft, TileRight, noone);
					
					// Get data
					var FloorDistance = NearestTile[0];
					var FloorAngle    = NearestTile[1];
			
					// Collide with floor
					if FloorDistance < 0
					{
						PosY	+= FloorDistance;
						Angle    = FloorAngle;
						Inertia  = Xsp;
						Ysp      = 0;
						Grounded = true;
					}
				}
			}
		}
		break;
		case "MoveRight":
		{
			// Collide with right wall
			var RightDistance = tile_check_collision_h(floor(PosX + 10), floor(PosY), true, true, Layer)[0];
			if  RightDistance < 0
			{
				PosX += RightDistance;
				Xsp   = 0;
				
				// Also set inertia to ysp?
				Inertia = Ysp;
			}
			
			// Try ceiling collision
			else
			{
				// Check for ceiling
				var TileLeft    = tile_check_collision_v(floor(PosX - RadiusX), floor(PosY - RadiusY), false, true, Layer);
				var TileRight   = tile_check_collision_v(floor(PosX + RadiusX), floor(PosY - RadiusY), false, true, Layer);
				var NearestTile = tile_check_nearest(TileLeft, TileRight, noone);
				
				// Get data
				var RoofDistance = NearestTile[0];
				var RoofAngle    = NearestTile[1];
			
				// Collide with ceiling
				if RoofDistance < 0
				{	
					if Ysp < 0
					{
						Ysp = 0;
					}
					if FlightState
					{
						Grv	= 0.03125;
					}
					PosY -= RoofDistance;
				}
				
				// Try floor collision
				else if Ysp > 0
				{
					// Check for floor
					var TileLeft    = tile_check_collision_v(floor(PosX - RadiusX), floor(PosY + RadiusY), true, false, Layer);
					var TileRight   = tile_check_collision_v(floor(PosX + RadiusX), floor(PosY + RadiusY), true, false, Layer);
					var NearestTile = tile_check_nearest(TileLeft, TileRight, noone);
					
					// Get data
					var FloorDistance = NearestTile[0];
					var FloorAngle    = NearestTile[1];
			
					// Collide with floor
					if FloorDistance < 0
					{
						PosY	+= FloorDistance;
						Angle    = FloorAngle;
						Inertia  = Xsp
						Ysp      = 0;
						Grounded = true;
					}
				}
			}
		}
		break;
	}
}