void keyPressed() {
	if (key == 'g') {
		if (gravity.y == 0) gravity.y = 500;
		else gravity.y = 0;
	}
	if (keyCode == LEFT) dir.x = -1;
	if (keyCode == RIGHT) dir.x = 1;
	if (keyCode == UP) dir.y = -1;
	if (keyCode == DOWN) dir.y = 1;
}

void keyReleased() {
	if (keyCode == LEFT) dir.x = 0;
	if (keyCode == RIGHT) dir.x = 0;
	if (keyCode == UP) dir.y = 0;
	if (keyCode == DOWN) dir.y = 0;
}
