boolean moveLeft, 
	moveRight, 
	moveUp, 
	moveDown;
PVector input = new PVector(0, 0);


void keyPressed() {
	if (key == 'g') {
		if (gravity.y == 0) 
			gravity.set(0, 500);
		else 
			gravity.set(0, 0);
	}
	if (key == 'r') {
		reset();
	}
	if (keyCode == LEFT) 
		moveLeft = true;
	if (keyCode == RIGHT) 
		moveRight = true;
	if (keyCode == UP) 
		moveUp = true;
	if (keyCode == DOWN) 
		moveDown = true;
}

void keyReleased() {
	if (keyCode == LEFT) 
		moveLeft = false;
	if (keyCode == RIGHT) 
		moveRight = false;
	if (keyCode == UP) 
		moveUp = false;
	if (keyCode == DOWN) 
		moveDown = false;
}

PVector input() {
	input.set(0, 0);

	if (moveLeft) 
		input.x--;
	if (moveRight)
		input.x++;
	if (moveDown)
		input.y++;
	if (moveUp)
		input.y--;

	return input.normalize();
}