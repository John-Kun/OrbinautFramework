function ObjTailsObjectDraw()
{
	// Update object
	x			 = floor(Player.PosX);
	y			 = floor(Player.PosY);
	depth		 = Player.DrawOrder + 1;
	image_xscale = Player.Spinning and Player.Grounded ? sign(Player.Inertia) : sign(Player.Facing);
	image_angle  = VisualAngle;
	
	/* Fix one pixel offset when facing left. Comment this if you
	don't need that */
	if Player.Facing == FlipLeft
	{
		x++;
	}
	
	// Draw object
	draw_self();
}