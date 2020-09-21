class Player extends Circle {
	PVector vel, acceleration;
	float speed = 750,
		deaccelerationMult = 10,
		bounceMult = 0.7;
	int maxSpeed = 255;

	Player(float x, float y) {
		super(x, y, 30);
		vel = new PVector();
	}

	void update() {
		// Adjust velocity according to acceleration and gravity
		acceleration = input();
		acceleration.mult(speed);
		acceleration.add(gravity);

		// Deaccelerate slowly
		if (input.x == 0 && input.y == 0) {
			acceleration.x -= vel.x * deaccelerationMult;
			acceleration.y -= vel.y * deaccelerationMult;
		}

		// Change velocity based on acceleration
		acceleration.mult(deltaTime);
		vel.add(acceleration);

		// Check special cases
		if (gravity.magSq() != 0) 
			checkBounce();
		checkBounds();

		vel.limit(maxSpeed);

		pos.add(vel.copy().mult(deltaTime));
	}

	void draw() {
		fill(255);
		stroke(0);

		// Draw main ellipse
		ellipse(pos.x, pos.y, size, size);

		// Draw mirror ellipse on opposites
		float xDiff = pos.x <= radius ? width : -width; 
		ellipse(pos.x + xDiff, pos.y, size, size);
		
		float yDiff = pos.y <= radius ? height : -height;
		ellipse(pos.x, pos.y + yDiff, size, size);

		ellipse(pos.x + xDiff, pos.y + yDiff, size, size);
	}

	void checkBounds() {
		if (pos.x < 0) 
			pos.x += width;
		if (pos.x > width)
			pos.x -= width;
		if (pos.y < 0) 
			pos.y += height;
		if (pos.y > height)
			pos.y -= height;
	}

	void checkBounce() {
		if(pos.y >= height - radius) {
			vel.y *= -bounceMult;
			pos.y = height - radius;
		}
	}

}