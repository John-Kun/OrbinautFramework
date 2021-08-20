/// @function palette_handle(type,id,range,last,goto,duration)
function palette_handle(type, id, range, last, goto, duration)
{
	// Get colour index
	var index = max(0, id - 1);
	
	// Get unique ID
	var AnimationID = string(last) + "_" + string(goto);
	
	// Initialize or update palette animation
	if Sequence[type,index] != AnimationID
	{
		// Set data
		Sequence[type,index] = AnimationID;
		Duration[type,index]	= duration;
	}
	else if duration > 1
	{
		// Decrease the value of animation timer
		if --Duration[type,index] < 1
		{
			var cycle = max(1, goto);
			var lastanim = index + range;
			
			// Reset duration
			Duration[type,index] = duration;
			
			// Update colour
			for(var i = index; i < lastanim; i++)
			{
				if type == PaletteSurface
				{
					if ++IndexDry[i] > last
					{
						IndexDry[i] = cycle;
					}
				}
				else if type == PaletteUnderwater
				{
					if ++IndexWet[i] > last
					{
						IndexWet[i] = cycle;
					}
				}
			}
		}
	}
}