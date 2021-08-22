function PaletteSetup()
{	
	switch room 
	{	
		// Load default palette
		default:
		{
			palette_load(PaletteDry, pal_default_dry);
			palette_load(PaletteWet, pal_default_wet);
		}
		break;
	}
}