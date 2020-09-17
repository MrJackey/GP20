void keyPressed() {
	if (key == 'g') {
		if (gravity.y == 0) gravity.set(0, 500);
		else gravity.set(0, 0);
	}
	if (keyCode == LEFT) input.x = -1;
	if (keyCode == RIGHT) input.x = 1;
	if (keyCode == UP) input.y = -1;
	if (keyCode == DOWN) input.y = 1;
}

void keyReleased() {
	if (keyCode == LEFT) input.x = 0;
	if (keyCode == RIGHT) input.x = 0;
	if (keyCode == UP) input.y = 0;
	if (keyCode == DOWN) input.y = 0;
}
