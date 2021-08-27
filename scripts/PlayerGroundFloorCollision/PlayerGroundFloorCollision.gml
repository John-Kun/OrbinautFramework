function PlayerGroundFloorCollision()
{	
	// Exit if collisions are disabled or we are standing on the object
	if !AllowCollision or OnObject
	{
		exit;
	}
	
	// Get current angle quadrant
	if Angle <= 45 or Angle >= 315
	{
		var AngleQuad = QuadFloor;
	}
	else if Angle >= 46.41 and Angle <= 133.59
	{
		var AngleQuad = QuadRWall;
	}
	else if Angle >= 135 and Angle <= 225
	{
		var AngleQuad = QuadRoof;
	}
	else if Angle >= 226.41 and Angle <= 313.59
	{
		var AngleQuad = QuadLWall;
	}
	
	// Initialise static variable
	/*static AngleQuad = 0;
	
	// Set maximum angle difference. If difference exceeds this value, mode won't change
	var AngleTolerance = 45;
		
	// Update angle quadrant
	switch AngleQuad
	{
		case QuadFloor:
		{
			// Enter left wall collision mode
			var LeftWall = tile_check_collision_h(PosX - RadiusY, PosY + RadiusX, false, true, Layer);
			if  LeftWall[0] < 0 and Angle - LeftWall[1] < AngleTolerance
			{				
				AngleQuad = QuadLWall;
			}
				
			// Enter right wall collision mode
			var RightWall = tile_check_collision_h(PosX + RadiusY, PosY + RadiusX, true, true, Layer);
			if  RightWall[0] < 0 and RightWall[1] - Angle mod 360 < AngleTolerance
			{
				AngleQuad = QuadRWall;
			}
		}
		break;
		case QuadRWall:
		{
			// Enter floor collision mode
			var FloorTile = tile_check_collision_v(PosX + RadiusX, PosY + RadiusY, true, true, Layer);
			if  FloorTile[0] < 0 and Angle - FloorTile[1] < AngleTolerance
			{
				AngleQuad = QuadFloor;
			}
				
			// Enter ceiling collision mode
			var RoofTile = tile_check_collision_v(PosX + RadiusX, PosY - RadiusY, false, true, Layer);
			if  RoofTile[0] < 0 and RoofTile[1] - Angle mod 360 < AngleTolerance
			{
				AngleQuad = QuadRoof;
			}
		}
		case QuadRoof:
		{
			// Enter right wall collision mode
			var RightWall = tile_check_collision_h(PosX + RadiusY, PosY - RadiusX, true, true, Layer);
			if  RightWall[0] < 0 and Angle - RightWall[1] < AngleTolerance
			{
				
				AngleQuad = QuadRWall;
			}
				
			// Enter left wall collision mode
			var LeftWall = tile_check_collision_h(PosX - RadiusY, PosY - RadiusX, false, true, Layer);
			if  LeftWall[0] < 0 and LeftWall[1] - Angle mod 360 < AngleTolerance
			{
				AngleQuad = QuadLWall;
			}
		}
		break;
		case QuadLWall:
		{
			// Enter ceiling collision mode
			var RoofTile = tile_check_collision_v(PosX - RadiusX, PosY - RadiusY, false, true, Layer);
			if RoofTile[0] < 0 and Angle - RoofTile[1] < AngleTolerance
			{
				AngleQuad = QuadRoof;
			}
				
			// Enter floor collision mode
			var FloorTile = tile_check_collision_v(PosX - RadiusX, PosY + RadiusY, true, true, Layer);	
			if FloorTile[0] < 0 and FloorTile[1] - Angle mod 360 < AngleTolerance
			{
				AngleQuad = QuadFloor;
			}
		}
		break;
	}*/
	
	switch AngleQuad
	{
		case QuadFloor:
		{		
			// Get nearest tile below us
			var TileLeft  = tile_check_collision_v(PosX - RadiusX, PosY + RadiusY, true, false, Layer);
			var TileRight = tile_check_collision_v(PosX + RadiusX, PosY + RadiusY, true, false, Layer);
			
			// Check if we should use tile right below our position to avoid stupid quirk from originals
			var TileMiddle = tile_check_collision_v(PosX, PosY + RadiusY, true, false, Layer);
			
			// Get data
			if TileLeft[0] == TileRight[0] and TileLeft[0] > 0
			{
				var FloorDistance = TileMiddle[0];
				var FloorAngle    = TileMiddle[1];
			}
			else
			{
				var NearestTile   = tile_check_nearest(TileLeft, TileRight, Angle);
				var FloorDistance = NearestTile[0];
				var FloorAngle    = NearestTile[1];
			}
			
			// Go airborne if surface is too far away from us
			if !StickToConvex
			{
				var Distance = Game.S2FloorCollision ? min(4 + abs(floor(Xsp)), 14) : 14;
				if  FloorDistance > Distance
				{
					Grounded  = false;
					AngleQuad = false;
					
					exit;
				}		
			}
			
			// Else collide
			if FloorDistance >= -14
			{
				PosY += FloorDistance;
				Angle = FloorAngle;	
			}
		}
		break;
		case QuadRWall:
		{	
			// Get nearest tile to our right
			var TileLeft  = tile_check_collision_h(PosX + RadiusY, PosY + RadiusX, true, false, Layer);
			var TileRight = tile_check_collision_h(PosX + RadiusY, PosY - RadiusX, true, false, Layer);
			
			// Get data
			var NearestTile   = tile_check_nearest(TileLeft, TileRight, Angle);
			var FloorDistance = NearestTile[0];
			var FloorAngle    = NearestTile[1];
			
			// Go airborne if surface is too far away from us
			if !StickToConvex
			{
				var Distance = Game.S2FloorCollision ? min(4 + abs(floor(Ysp)), 14) : 14;
				if  FloorDistance > Distance
				{
					Grounded  = false;
					AngleQuad = false;
					
					exit;
				}	
			}
			
			// Else collide
			if FloorDistance >= -14
			{
				Angle = FloorAngle;
				PosX += FloorDistance;
			}
		}
		break;
		case QuadRoof:	
		{	
			// Get nearest tile above us
			var TileLeft    = tile_check_collision_v(PosX + RadiusX, PosY - RadiusY, false, false, Layer);
			var TileRight   = tile_check_collision_v(PosX - RadiusX, PosY - RadiusY, false, false, Layer);
			
			// Get data
			var NearestTile   = tile_check_nearest(TileLeft, TileRight, Angle);
			var FloorDistance = NearestTile[0];
			var FloorAngle    = NearestTile[1];
			
			// Go airborne if surface is too far away from us
			if !StickToConvex
			{
				var Distance = Game.S2FloorCollision ? min(4 + abs(floor(Xsp)), 14) : 14;
				if  FloorDistance > Distance
				{
					Grounded  = false;
					AngleQuad = false;
					
					exit;
				}
			}
			
			// Else collide
			if FloorDistance >= -14
			{
				Angle = FloorAngle;
				PosY -= FloorDistance;
			}
		}
		break;
			
		// Handle left wall collision
		case QuadLWall:
		{	
			// Get nearest tile to our left
			var TileLeft  = tile_check_collision_h(PosX - RadiusY, PosY - RadiusX, false, false, Layer);
			var TileRight = tile_check_collision_h(PosX - RadiusY, PosY + RadiusX, false, false, Layer);
			
			// Get data
			var NearestTile   = tile_check_nearest(TileLeft, TileRight, Angle);
			var FloorDistance = NearestTile[0];
			var FloorAngle    = NearestTile[1];
			
			// Go airborne if surface is too far away from us
			if !StickToConvex
			{
				var Distance = Game.S2FloorCollision ? min(4 + abs(floor(Ysp)), 14) : 14;
				if  FloorDistance > Distance
				{
					Grounded  = false;
					AngleQuad = false;
					
					exit;
				}
			}
				
			// Else collide
		    if FloorDistance >= -14
			{
				Angle = FloorAngle;
				PosX -= FloorDistance;
			}
		}
		break;
	}
}
