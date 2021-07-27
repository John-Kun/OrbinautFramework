function PlayerSetup()
{	
	// Set character
	CharacterID	= Game.Character;
	
	// Default sprite setup
	Facing	  = DirectionRight;
	Animation = AnimIdle;
	DrawOrder = layer_get_depth("Objects");
	
	// Set default flags
	AllowCollision = true;
	Grounded	   = true;
	PeeloutRev     = -1;
	SpindashRev    = -1;
	DropdashRev    = -1;
	
	// Set default gravity
	Grv	= 0.21875;
	
	// Set collision radiuses
	if CharacterID != CharTails
	{
		DefaultRadiusY = 19;
		DefaultRadiusX = 9;
		SmallRadiusY    = 14;
		SmallRadiusX    = 7;
	}
	else
	{
		DefaultRadiusY = 15;
		DefaultRadiusX = 9;
		SmallRadiusY    = 14;
		SmallRadiusX    = 7;
	}
	RadiusX = DefaultRadiusX;
	RadiusY = DefaultRadiusY;
	
	// Load stats
	Score    = Game.Score;
	Lives    = Game.Lives;
	Emeralds = Game.Emeralds;
	Conts    = Game.Continues;
	
	// If player uses saved global spawn position, use it
	if Game.PlayerPosition != 0
	{
		PosX = Game.PlayerPosition[0];
		PosY = Game.PlayerPosition[1];
	}
	/* Regular spawn code is stored in Spawnpoint object! */
	
	// Initialize recorded position datalist array
	RecordedPosX = ds_list_create();
	RecordedPosY = ds_list_create();
		
	// Fill recorded position datalist array
	for (var Index = 0; Index < 32; Index++) 
	{
		RecordedPosX[| Index] = x;
		RecordedPosY[| Index] = y;
	}
	
	// Create Tails' tails
	if (CharacterID == CharTails) instance_create(x, y, TailsObject);
}