function hitbox_collision(collideFrom, collideWith)
{	
	// Define if we need to use player's hitbox or not
	var x1 = collideFrom == Player ? floor(Player.PosX - 8)				     : collideFrom.bbox_left;
	var x2 = collideFrom == Player ? floor(Player.PosX + 8)				     : collideFrom.bbox_right;
	var y1 = collideFrom == Player ? floor(Player.PosY - Player.yRadius + 3) : collideFrom.bbox_top;
	var y2 = collideFrom == Player ? floor(Player.PosY + Player.yRadius - 3) : collideFrom.bbox_bottom;
	
	// Return collision result
	return collision_rectangle(x1, y1, x2, y2, collideWith, true, false);
}