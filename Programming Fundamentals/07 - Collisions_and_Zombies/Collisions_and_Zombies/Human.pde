class Human extends Character {
	float turnCD,
		turnTime;

	Human() {
		super();
		float minSize = 15,
			maxSize = 20;

		this.size = random(minSize, maxSize);
		this.speed = 5;//(maxSize - size) * 0.5;
		this.vel = new PVector(random(-1, 1), random(-1, 1)).normalize().mult(speed);
		this.turnCD = random(2000, 5000);
		this.turnTime = millis();

		float firstCol = random(45, 255);
		float secCol = map(firstCol, 45, 255, 34, 206);
		float thirdCol = map(firstCol, 45, 255, 30, 180);
		this.col = color(firstCol, secCol, thirdCol);
	}

	void update() {
		if (millis() > turnTime + turnCD) {
			float newAngle = random(-HALF_PI, HALF_PI);
			turn(newAngle);
		}
		super.update();
	}

	void draw() {
		stroke(0);

		super.draw();
	}

	void turn(float newAngle) {
		vel = PVector.fromAngle(vel.heading() + newAngle).mult(speed);
		turnTime = millis();
		turnCD = random(2000, 5000);
	}
}