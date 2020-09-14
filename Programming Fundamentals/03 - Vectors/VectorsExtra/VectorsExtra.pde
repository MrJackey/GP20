PVector startPos = new PVector(0, 0), 
	endPos = new PVector(0, 0),
	mouse = new PVector(0, 0),
	drawnVec = new PVector(0, 0), 
	goalVec;
int score = 0;
boolean guessed = false;

void setup() {
	size(800, 800);
	strokeWeight(2.5);

	reset();
}

void draw() {
	background(#888888);
	drawText();

	stroke(0);
	if (mousePressed && !guessed) drawArrow(startPos, mouse.set(mouseX, mouseY));
	else drawArrow(startPos, endPos);

	if (guessed) showGoalVec();
}

void reset() {
	guessed = false;
	setGoalVec();
	startPos.set(0, 0);
	endPos.set(0, 0);
}

void setGoalVec() {
	goalVec = new PVector(random(-600, 600), random(-600, 600));
}

void drawText() {
	textSize(20);
	textAlign(RIGHT, TOP);
	text("M1 for next vector", width - 10, 10);
	textSize(25);
	textAlign(CENTER, TOP);
	text(String.format("(%d, %d)", int(goalVec.x), int(goalVec.y)), width / 2, 10);

	textAlign(LEFT);
	text(String.format("You drew vector: (%d, %d)", int(drawnVec.x), int(drawnVec.y)), 10, 775);
  textAlign(RIGHT);	
  text(String.format("You were off by a total of %d", score), width - 10, 778);
}

void drawArrow(PVector start, PVector end) {
	line(start.x, start.y, end.x, end.y);
	PVector pressedVec = new PVector(end.x - start.x, end.y - start.y);
	PVector right = PVector.fromAngle(pressedVec.heading() + HALF_PI + QUARTER_PI).mult(25);
	PVector left = PVector.fromAngle(pressedVec.heading() - HALF_PI - QUARTER_PI).mult(25);
	line(end.x, end.y, end.x + right.x, end.y + right.y);
	line(end.x, end.y, end.x + left.x, end.y + left.y);
}

void showGoalVec() {
	stroke(0, 255, 0);
	int mid = height / 2;
	line(mid + goalVec.x / 2, mid + goalVec.y / 2, mid - goalVec.x / 2, mid - goalVec.y / 2);
}

void mouseClicked() {
	reset();
}

void mousePressed() {
	if (guessed) return;
	startPos.set(mouseX, mouseY);
	endPos.set(0, 0);
}

void mouseReleased() {
	if (guessed) return;
	endPos.set(mouseX, mouseY);
	drawnVec.set(endPos.x - startPos.x, endPos.y - startPos.y);
	score = int(abs(drawnVec.x - goalVec.x) + abs(drawnVec.y - goalVec.y));
	guessed = true;
}

