PVector pos = new PVector(0, 0),
	input = new PVector(0, 0),
	acceleration = new PVector(0, 0),
	vel = new PVector(0, 0),
	gravity = new PVector(0, 0);
float deltaTime, 
	time = 0, 
	accelerationVal = 650,
	deaccelerationMult = 0.9,
	maxSpeed = 500,
	size = 50;

void setup() {
	size(640, 480);	
	pos.set(width / 2, height / 2);
}

void draw() {
	background(0);
	stroke(255);
	fill(255);

	// Calculate deltaTime
	long currentTime = millis();
	deltaTime = (currentTime - time) * 0.001;

	move();

	checkNonModuloBounds();

	if (gravity.y != 0) checkBounce();

	drawEllipses();

	time = currentTime;
}

void move() {
	// Adjust velocity according to acceleration and gravity
	acceleration = PVector.mult(input.copy().normalize(), accelerationVal * deltaTime);

	vel.add(acceleration);
	vel.add(gravity.copy().mult(deltaTime));		

	// Deaccelerate slowly
	if (input.x == 0 && input.y == 0) {
		vel.mult(1 - deaccelerationMult * deltaTime);
	}

	vel.limit(maxSpeed);
	pos.add(vel.copy().mult(deltaTime));
}

void checkNonModuloBounds() {
	if (pos.x < 0) pos.x += width;
	if (pos.y < 0) pos.y += height;
}

void checkBounce() {
	if(pos.y % height >= height - size / 2) {
		vel.y *= -1;
		pos.y = height - size / 2;
	}
}

void drawEllipses() {
	// Draw main ellipse
	ellipse(pos.x % width, pos.y % height, size, size);

	// Draw mirror ellipse on opposites
	float xDiff = (pos.x % width) <= (width / 2) ? width : -width; 
	ellipse(pos.x % width + xDiff, pos.y % height, size, size);
	
	float yDiff = (pos.y % height) <= (height / 2) ? height : -height;
	ellipse(pos.x % width, pos.y % height + yDiff, size, size);

	ellipse(pos.x % width + xDiff, pos.y % height + yDiff, size, size);
}
