PVector pos = new PVector(0, 0),
	dir = new PVector(0, 0),
	vel = new PVector(0, 0),
	gravity = new PVector(0, 0);
float deltaTime, 
	time = 0, 
	a = 250,
	size = 30;

void setup() {
	size(640, 480);	
	pos.set(width / 2, height / 2);
}

void draw() {
	background(0);
	stroke(255);
	fill(255);

	long currentTime = millis();
	deltaTime = (currentTime - time) * 0.001;

	vel.add(dir.copy().normalize().mult(a * deltaTime));
	vel.add(gravity.copy().mult(deltaTime));		

	// Deaccelerate
	if (!keyPressed) vel.mult(1 - 0.75 * deltaTime);

	pos.add(vel.copy().mult(deltaTime));

	if (pos.x < 0) pos.x += width;
	if (pos.y < 0) pos.y += height;

	if(gravity.y != 0 && pos.y % height >= height - size / 2) {
		vel.y *= -1;
		pos.y = height - size / 2;
	}

	ellipse(pos.x % width, pos.y % height, size, size);
	
	time = currentTime;
}
