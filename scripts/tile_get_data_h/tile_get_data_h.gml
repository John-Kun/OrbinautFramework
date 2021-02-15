/// @function tile_get_data_h(X, Y, Layer, toPositive, dataToGet, noSolidTop)
function tile_get_data_h(X, Y, Layer, toPositive, dataToGet, noSolidTop)
{
	// Report script error
	if dataToGet != "data_distance" and dataToGet != "data_angle"
	{
		show_message("Wrong dataToGet attribute set in function tile_get_data_h. Expected 'data_distance' or 'data_angle'");
		game_end();
	}
	if X < 0 or Y < 0 or X > room_width or Y > room_height exit;	

	// Get tile and read its width
	var Tile  = tilemap_get(Stage.TileLayer[Layer], X div TileSize, Y div TileSize);
	var Index = tile_get_index(Tile) mod TileAmount;
	var Width = Game.WidthValueOf[Index][tile_get_flip(Tile) ? TileSize - 1 - Y mod TileSize : Y mod TileSize];
	
	// Use current tile
	var Tile2 = 0;
	
	// Use a tile to the right if this tile width is 0
	if !Width
	{
		Tile2 = +TileSize;
	}
	
	// Use a tile to the left if this tile width is 16 and we're checking for the distance
	else if Width = TileSize 
	{
		if dataToGet = "data_distance" and !noSolidTop
		{
			Tile2 = -TileSize;
		}
	}
	
	// Check if we need to invert our calculations
	var Invert = toPositive ? 1 : -1;
	
	// Get second tile properties if we're using it
	if Tile2 != 0
	{	
		Tile2 *= Invert;
		Tile   = tilemap_get(Stage.TileLayer[Layer], (X + Tile2) div TileSize, Y div TileSize);
		if dataToGet = "data_distance" 
		{
			Index  = tile_get_index(Tile) mod TileAmount;
			Width = Game.WidthValueOf[Index][tile_get_flip(Tile) ? TileSize - 1 - Y mod TileSize : Y mod TileSize];
		}
	}
	
	// Return distance to the edge of our tile
	if dataToGet = "data_distance"
	{
		if noSolidTop and tile_get_index(Tile) > TileAmount
		{
			return TileSize;
		}
		else
		{
			return (Tile2 - (X mod TileSize) + (toPositive ? (TileSize - Width - 1) : Width)) * Invert;
		}
	}
	
	// Return angle
	if dataToGet = "data_angle"
	{	
		// Return cardinal angles for empty and full tiles
		if (Tile = 0) return 360;
		if (Tile = 1) return toPositive ? 90 : 270;
		
		// Return cardinal angle for mirrored tiles
	    var Mirr = tile_get_mirror(Tile);
		if toPositive and Mirr 
		{
			return 90;
		}
		else if !toPositive and !Mirr 
		{
			return 270; 
		}
		
		// Get angle of regular tiles
		Index   = tile_get_index(Tile) mod TileAmount
	    var Ang = Game.AngleValueOf[Index];
    
	    // Adjust the angle and return it
	    if tile_get_flip(Tile)
		{
			Ang = (540 - Ang) mod 360;
		}
	    return Mirr ? 360 - Ang : Ang;
	}
}