class Player {
	PVector pos, dir, nextDir;
	ArrayList<Part> parts = new ArrayList<Part>();
	int vel;

	Player() {
		pos = new PVector(2.5 * gridSize, 0.5 * gridSize);
		dir = new PVector(1, 0);
		vel = baseVel;
		nextDir = dir.copy();
		addBaseBody();
	}

	void setNextDir(PVector newDir) {
		if (difference(abs(dir.heading()), abs(newDir.heading())) != HALF_PI) return;

		nextDir.set(newDir);
	}

	void addBaseBody() {
		// Tail
		PVector partPos = new PVector(0.5 * gridSize, 0.5 * gridSize);
		PVector partDir = new PVector(1, 0);
		parts.add(new Part(partPos, partDir, true));

		// One body part
		partPos = new PVector(1.5 * gridSize, 0.5 * gridSize);
		partDir = new PVector(1, 0);
		parts.add(new Part(partPos, partDir));
	}

	void addPart() {
		PVector newDir = parts.get(1).dir.copy();
		PVector newPos = parts.get(1).pos.copy();
		Part newPart = new Part(newPos, newDir);
		parts.add(1, newPart);

		parts.get(0).vel = 0;
		newPart.vel = 0;
	}

	void render() {
		for (Part part : parts) {
			part.render();
		}
		drawHead();
	}

	void drawHead() {
		stroke(0, 255, 0);
		fill(0, 255, 0);
		int gridHalf = gridSize / 2;
		int headW = gridHalf;
		int headH = gridSize;

		if (dir.y != 0) {
			int temp = headH;
			headH = headW;
			headW = temp;
		}

		// Head
		rectMode(CENTER);
		PVector rectC = dir.copy().mult(gridHalf / -2);
		rect(pos.x + rectC.x, pos.y + rectC.y, headW, headH);
		arc(pos.x, pos.y, gridSize, gridSize, dir.heading() - HALF_PI, dir.heading() + HALF_PI, OPEN);

		// Eyes
		stroke(0);
		fill(0);
		int eyeSize = 5;

		PVector leftEye = PVector.fromAngle(dir.heading() - QUARTER_PI);
		leftEye.mult(gridHalf / 2);
		circle(pos.x + leftEye.x, pos.y + leftEye.y, eyeSize);

		PVector rightEye = PVector.fromAngle(dir.heading() + QUARTER_PI);
		rightEye.mult(gridHalf / 2);
		circle(pos.x + rightEye.x, pos.y + rightEye.y, eyeSize);
	}

	void move() {
		float gridHalf = gridSize / 2;

		// If middle of grid
		if ((pos.x + gridHalf) % gridSize == 0 && (pos.y + gridHalf) % gridSize == 0) {
			turn();
		}

		// If edge of grid
		if (parts.size() > 2) {
			if (parts.get(1).pos.copy().sub(parts.get(2).pos.copy()).mag() >= gridSize) {
				parts.get(0).vel = baseVel;	
				parts.get(1).vel = baseVel;
			}
		}

		pos.add(dir.copy().mult(vel));
		for (Part part : parts) {
			part.move();
		}
	}

	void turn() {
		// Turn body
		for (int i = 0; i < parts.size() - 1; i++) {
			Part currPart = parts.get(i);
			Part nextPart = parts.get(i + 1);
			if (nextPart.dir.heading() != currPart.dir.heading()) {
					currPart.dir.set(nextPart.dir);;
			}
		}

		// Turn neck (part closest to head)
		Part neck = parts.get(parts.size() - 1);
		if (neck.dir.heading() != dir.heading()) {
			neck.dir.set(dir);
		}

		// Turn head
		dir.set(nextDir);
	}

	void checkWallHit() {
		if (pos.x < 0 || pos.x > width) gameOver();
		if (pos.y < 0 || pos.y > height) gameOver();
	}
}
