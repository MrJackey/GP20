class Part {
	PVector pos, dir;
	int vel;
	boolean isTail;

	Part(PVector Pos, PVector Dir) {
		pos = Pos;
		dir = Dir;
		vel = baseVel;
	}

	Part(PVector Pos, PVector Dir, boolean IsTail) {
		this(Pos, Dir);
		
		isTail = 	IsTail;
	}

	void render() {
		rectMode(CENTER);
		fill(0, 255, 0);
		stroke(0, 255, 0);
		if (!isTail) rect(pos.x, pos.y, gridSize, gridSize);
		else {
			int partH = gridSize;
			int partW = gridSize / 2;

			if (dir.y != 0) {
				int temp = partH;
				partH = partW;
				partW = temp;
			}

			PVector rectC = dir.copy().mult(gridSize / 4);
			rect(pos.x + rectC.x, pos.y + rectC.y, partW, partH);
			arc(pos.x, pos.y, gridSize, gridSize, dir.heading() + HALF_PI, dir.heading() + PI + HALF_PI, OPEN);
		}
	}

	void move() {
		pos.add(dir.copy().mult(vel));
	}

	void checkPlayerHit() {
		PVector dist = player.pos.copy().sub(pos);
		if (dist.mag() < gridSize / 2) {
			gameOver();
		} 
	}
}
