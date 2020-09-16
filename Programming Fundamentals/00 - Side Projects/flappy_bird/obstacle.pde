class Obstacle {
	PVector pos, vel;
	int w, gapHeight;
	boolean scored;

	Obstacle() {
		pos = new PVector(width + 100, random(150, height - 150));
		vel = new PVector(-100, 0);
		w = 75;
	 	gapHeight = 140;
	 	scored = false;
	}

	float topBorder() {
		return pos.y + gapHeight / 2;
	}

	float bottomBorder() {
		return pos.y - gapHeight / 2;
	}

	float rightBorder() {
		
		return pos.x + w / 2;
	}

	void render() {
		fill(0, 200, 0);
		rectMode(CORNERS);
		rect(pos.x - w / 2, 0, pos.x + w / 2, bottomBorder());
		rect(pos.x - w / 2, topBorder(), pos.x + w / 2, height);
	}

	void move() {
		pos.add(vel.copy().mult(deltaTime));
	}

	void checkPlayerCollision() {
		if (isWithin(player.rightBorder(), pos.x - w / 2, pos.x + w / 2) ||
			isWithin(player.leftBorder(), pos.x - w / 2, pos.x + w / 2)) {
			if (player.topBorder() < bottomBorder() || player.bottomBorder() > topBorder()) {
				reset();
			}
		}

		if (!scored && player.leftBorder() > rightBorder()) {
			scored = true;
			player.score++;
		}
	}
}