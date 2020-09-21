
class BallManager {
	int startBallCount = 10,
		maxBalls = 100;
	ArrayList<Ball> balls = new ArrayList<Ball>();
	float addTime;

	void reset() {
		balls.clear();
		for (int i = 0; i < startBallCount; i++) {
			balls.add(new Ball(width / 2, height / 2));
		}
	}

	void update() {
		for(Ball ball : balls) {
			if (Circle.roundCollision(ball, player)) 
				gameOver = true;

			ball.update();
			ball.draw();
		}
	}

	void add() {
		Ball newBall = new Ball(0, 0);
		int margin = 20;
		while (true) {
			newBall.pos.x = random(margin, width - margin);
			newBall.pos.y = random(margin, height - margin);
			if (!Circle.roundCollision(player, newBall))
				break;
		}

		balls.add(newBall);
		addTime = millis();
	}
}