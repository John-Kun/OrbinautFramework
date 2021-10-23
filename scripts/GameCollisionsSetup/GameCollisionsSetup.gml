function GameCollisionsSetup()
{
	switch room
	{
		// Test Stage
		case Stage_TZ:
			tile_data_set("TZ", 66, "CollisionLayerA", "CollisionLayerB");
		break;
		
		// Do not load any tiledata by default
		default:
			tile_data_set(noone, "", "", "");
		break;
	}
}