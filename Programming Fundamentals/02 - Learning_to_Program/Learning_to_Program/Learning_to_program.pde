Axis axis1, axis2;

void setup() {
	size(800, 800);
	strokeWeight(1.5);

	axis1 = new Axis(200, 200, 200, 600);
	axis2 = new Axis(200, 600, 600, 600);
}

void draw() {
	background(#333333);
	axis1.move();
	axis2.move();
	new ParaCurve(axis1, axis2, 50);
}
