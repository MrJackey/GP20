Player player;
BallManager ballManager = new BallManager();
PVector gravity = new PVector(0, 0);
float deltaTime, 
	time = 0; 
boolean gameOver;

void setup() {
	size(640, 480);	
	
	reset();
}

void draw() {
	background(0);
	stroke(255);
	fill(255);

	// Calculate deltaTime
	long currentTime = millis();
	deltaTime = (currentTime - time) * 0.001;

	if (!gameOver && (ballManager.balls.size() < ballManager.maxBalls) && (ballManager.addTime + 3000 < currentTime))
		ballManager.add();

	ballManager.update();

	player.update();
	player.draw();

	if (gameOver) 
		drawGameOver();

	drawScore();

	time = currentTime;
}

void reset() {
	gameOver = false;
	player = new Player(50, 50);

	ballManager.reset();
}

void drawScore() {
	fill(255);
	textAlign(RIGHT, TOP);
	textSize(20);

	int margin = 25;
	text(String.format("Score: %d", ballManager.balls.size()), width - margin, margin);
}

void drawGameOver() {
	fill(255);
	textAlign(CENTER, BOTTOM);
	textSize(24);
	text("GAME OVER", width / 2, height / 2);
	textSize(16);
	text("PRESS 'R' TO RESTART", width / 2, height / 2 + 24);
}
