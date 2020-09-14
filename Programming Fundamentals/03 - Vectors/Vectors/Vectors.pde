PVector ballPos = new PVector(),
	diff = new PVector(0, 0),
	vel = new PVector(0, 0);

void setup() {
	size(800, 800);
	ballPos.set(width / 2, height / 2);
}

void draw() {
	background(100);
	ellipse(ballPos.x, ballPos.y, 20, 20);
	if (mousePressed) line(ballPos.x, ballPos.y, mouseX, mouseY);
	move();
}

void mouseReleased() {
	diff.set(mouseX - ballPos.x, mouseY - ballPos.y);
	float length = diff.mag();
	vel = diff; 
	vel.normalize();
	vel.mult(length*0.05);
}

void move() {
	handleCollision();
	ballPos.set(ballPos.x + vel.x, ballPos.y + vel.y);
}

void handleCollision() {
	if (ballPos.x <= 10 || ballPos.x >= width - 10) vel.x *= -1;
	if (ballPos.y <= 10 || ballPos.y >= height - 10) vel.y *= -1;
}
