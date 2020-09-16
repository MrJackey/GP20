class Player {
	PVector pos, vel;
	int size, score;

	Player() {
		pos = new PVector(width / 3, height / 2);
		vel = new PVector(0, 0);
		size = 50;
		score = 0;
	}

	float bottomBorder() {
		return pos.y + size / 2;
	}

	float topBorder() {
		return pos.y - size / 2;
	}

	float rightBorder() {
		return pos.x + size / 2;
	}

	float leftBorder() {
		return pos.x - size / 2;
	}

	void render() {
		// Body
		fill(#cadb32);
		stroke(0);
		circle(pos.x, pos.y, size);

		// Eye
		fill(255);
		ellipse(pos.x + size / 8, pos.y - size / 10, size / 1.75, size / 1.75);
		fill(0);
		circle(pos.x + size / 4, pos.y, 5);

		// Mouth
		fill(200, 0, 0);
		rectMode(CORNER);
    rect(pos.x + size / 4, pos.y + size / 4,	size / 3, size / 6);
    rect(pos.x + size / 3, pos.y + size / 10,	size / 3, size / 6);

    // Wing
    fill(255);
    rect(pos.x - size / 1.5, pos.y + size / 12, size / 2, size / 4, 50);

    renderScore();
	}

	void renderScore() {
		textAlign(RIGHT, TOP);
		textSize(25);
		text(String.format("Score: %d", score), width - 50, 50);
	}

	void move() {
		vel.add(gravity.copy().mult(deltaTime));
		pos.add(vel.copy().mult(deltaTime));
		
		if (pos.y > height || pos.y < 0) {
			vel.mult(-1);
		}
	}

	void fly() {
		vel.y = gravity.y * -0.5;
	}
}
