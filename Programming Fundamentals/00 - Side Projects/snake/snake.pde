Player player;
Objective obj;
int gridSize = 40, baseVel = 4;

void setup() {
	size(640, 640);
	player = new Player();
	obj = new Objective();
}

void draw() {
	background(0, 75, 150);
	//drawGrid();
	obj.render();
	player.move();
	player.render();
	obj.checkPlayerContact();

	for (Part part : player.parts) {
		part.checkPlayerHit();
	}
	player.checkWallHit();
}

void drawGrid() {
	stroke(100);
	for (int i = 0; i < width; i += gridSize) {
		line(i, 0, i, height);
		line(0, i, width, i);
		
		for (int j = 0; j < height; j += gridSize) {
			textAlign(CENTER);
			textSize(7);
			text(String.format("%dx%d", i+20, j+20), i+20, j+20);
		}
	}
	line(0, height - 1, width, height - 1);
	line(width - 1, 0, width - 1, height);
}

void gameOver() {
	player.vel = 0;
	for (Part part : player.parts) {
		part.vel = 0;
	}
}

void keyPressed() {
	if (key == 'w' || keyCode == UP) player.setNextDir(new PVector(0, -1));
	else if (key == 'a' || keyCode == LEFT) player.setNextDir(new PVector(-1, 0));
	else if (key == 's' || keyCode == DOWN) player.setNextDir(new PVector(0, 1));
	else if (key == 'd' || keyCode == RIGHT) player.setNextDir(new PVector(1, 0));
}

// Helpers
float difference(float v1, float v2) {
	if (v1 > v2) return v1 - v2;
	else return v2 - v1;
}
