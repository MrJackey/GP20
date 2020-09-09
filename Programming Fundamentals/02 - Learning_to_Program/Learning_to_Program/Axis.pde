class Axis {
	float x1, y1, x2, y2, x1v, y1v, x2v, y2v;

 	Axis(float X1, float Y1, float X2, float Y2) {
	 	x1 = X1;
	 	y1 = Y1;
	 	x2 = X2;
	 	y2 = Y2;

	 	x1v = 5;
	 	y1v = 0;
	 	x2v = -5;
	 	y2v = 0;

 	}

	float calcY(float x) {
		// f(x) = kx + m
	 	float k = (y2-y1)/(x2-x1);
	 	float m = y1 - (k*x1);

	 	return k*x+m;
 	}

 	void move() {
	 	checkCollison();
	 	x1 += x1v;
	 	y1 += y1v;
	 	x2 += x2v;
	 	y2 += y2v;
 	}

 	void checkCollison() {
	 	if (x1 <= 0 || x1 >= height) x1v *= -1;
	 	if (y1 <= 0 || y1 >= width) y1v *= -1;
	 	if (x2 <= 0 || x2 >= height) x2v *= -1;
	 	if (y2 <= 0 || y2 >= width) y2v *= -1;
 	}
}