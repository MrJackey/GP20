float anim;

void setup() {
	size(640, 480);
	strokeWeight(3);
}

void draw() {
	background(10);

	anim = millis() * 0.0015;

	drawCurve(Curve.sine, height * 0.05, 10, 20, 40, #00FF00);
	drawCurve(Curve.cos, height * 0.8, 2.5, 20, 30, #FF0000);

	drawCircle(new PVector(width * 0.25, height * 0.33), 50, 16, #0000FF);

	drawSpiral(new PVector(width * 0.25, height * 0.33), 40, 2.5, 16, #FF00FF);

	drawParabolicCircle(new PVector(width * 0.5, height * 0.5), 50, 24, 6, #0000FF);
	drawParabolicSpriral(new PVector(width * 0.75, height * 0.33), 50, 2.5, 30, 5, #FFFFFF);
}

enum Curve {
	sine,
	cos,
}

void drawCurve(Curve curve, float yPosition, float curveLoops, int dotsPerLoop,  int amplitude, color col) {
	stroke(col);
	float step = TWO_PI / dotsPerLoop;
	float totalDots = dotsPerLoop * curveLoops;
	float dotSpacing = width / totalDots;

	for (int i = 0; i < totalDots; i++) {
		float x = dotSpacing * i;

		float angle = step * i + anim;
		float y = curve == Curve.sine ? yPosition + sin(angle) * amplitude
																	: yPosition + cos(angle) * amplitude;

		point(x, y);
	}
}

void drawCircle(PVector center, float radius, int totalDots, color col) {
	stroke(col);
	float step = TWO_PI / totalDots;

	for (int i = 0; i < totalDots; i++) {
		float angle = step * i + anim;
		float x = center.x + cos(angle) * radius;
		float y = center.y + sin(angle) * radius;

		point(x, y);
	}
}

void drawParabolicCircle(PVector center, float radius, int totalDots, int lineIncrement, color col) {
		stroke(col);
		float step = TWO_PI / totalDots;

		for (int i = 0; i < totalDots; i++) {
			float angle = step * i + anim;
			float x1 = center.x + cos(angle) * radius;
			float y1 = center.y + sin(angle) * radius;

			float angle2 = step * ((i + lineIncrement) % totalDots) + anim;

			float x2 = center.x + cos(angle2) * radius;
			float y2 = center.y + sin(angle2) * radius;

			line(x1, y1, x2, y2);
		}
	}

void drawSpiral(PVector center, float maxRadius, float totalLoops, int dotsPerLoop, color col) {
	stroke(col);
	float step = TWO_PI / dotsPerLoop;
	float totalDots = dotsPerLoop * totalLoops;

	for (int i = 0; i < totalDots; i++) {
		float angle = step * i + anim * i * 0.05;
		float radie = maxRadius * (i + 1) / totalDots;
		float x = center.x + cos(angle) * radie;
		float y = center.y + sin(angle) * radie;

		point(x, y);
	}
}

void drawParabolicSpriral(PVector center, float maxRadius, float totalLoops, int dotsPerLoop, int lineIncrement, color col) {
	stroke(col);
	float step = TWO_PI / dotsPerLoop;
	float totalDots = dotsPerLoop * totalLoops;

	for (int i = 0; i < totalDots; i++) {
		float radie = maxRadius * (i + 1) / totalDots;

		float angle = step * i + anim * i * 0.05;
		float x1 = center.x + cos(angle) * radie;
		float y1 = center.y + sin(angle) * radie;

		float angle2 = step * ((i + lineIncrement) % totalDots) + anim * i * 0.05;
		float x2 = center.x + cos(angle2) * radie;
		float y2 = center.y + sin(angle2) * radie;

		line(x1, y1, x2, y2);
	}
}
