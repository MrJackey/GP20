class Zombie extends Character {
	float armLength,
		armWidth;

	Zombie() {
		super();
		this.speed = 1;
		this.vel = new PVector(random(-1, 1), random(-1, 1)).normalize().mult(speed);
		this.col = color(63, 237, 57);
		this.armLength = size;
		this.armWidth = armLength / 3;
	}

	Zombie(PVector pos, PVector vel, float size) {
		this();
		this.size = size;
		this.pos.set(pos);
		this.vel.set(vel.normalize().mult(speed));
	}

	void draw() {
		noStroke();
		fill(this.col);

		push();
		translate(pos.x, pos.y);
		rotate(vel.heading());

		rectMode(CORNERS);
		// Left Arm
		rect(0, 0 - radius, armLength, -armWidth);
		// Right Arm
		rect(0, 0 + radius, armLength, armWidth);
		pop();

		super.draw();
	}

	// Gradually turn towards the new direction
	void turnTo(PVector newDir) {
		if (newDir.magSq() == 0) return;
		// Add PI to disable negative values
		float currAngle = vel.heading() + PI;
		float newDirAngle = newDir.heading() + PI;
		float diff = newDirAngle - currAngle;
		float rotationSpeed = 0.05;

		if (diff > PI)
			diff = (TWO_PI - diff) * -1;
		else if (diff < -PI)
			diff = TWO_PI + diff;

		float newAngle = lerp(currAngle, currAngle + diff, rotationSpeed);
		PVector newPartDir = PVector.fromAngle(newAngle - PI).normalize();
		
		vel = newPartDir.mult(speed);
	}
}