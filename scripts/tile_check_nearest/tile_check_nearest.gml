/// @function tile_check_nearest(leftdata,rightdata,object_angle)
function tile_check_nearest(leftdata, rightdata, object_angle)
{
	// Is the left tile closer to us than the right one?
	if leftdata[0] <= rightdata[0]
	{
		// Use the left tile
		var ResultDistance = leftdata[0];
		var ResultAngle	   = leftdata[1];
	}
	else
	{
		// Else use the right tile
		var ResultDistance = rightdata[0];
		var ResultAngle	   = rightdata[1];
	}
	
	// Is object angle defined?
	if object_angle != noone
	{
		// Get the difference between object current angle and floor angle
		var Difference = abs(object_angle mod 180 - ResultAngle mod 180);
		
		// Is difference higher than or equal to 45 degrees, or angle equals to 360?
		if Difference >= 45 and Difference <= 135 or ResultAngle == 360
		{
			// Use cardinal angle
			var ResultAngle = round(object_angle / 90) mod 4 * 90;
			if !ResultAngle
			{
				ResultAngle = 360;
			}
		}
	}
	
	// Return data
	return [ResultDistance, ResultAngle];
}