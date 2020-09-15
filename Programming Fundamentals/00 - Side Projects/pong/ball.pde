class Ball {
	PVector pos, vel;
	float size;

	Ball(PVector Pos, PVector Vel, float Size) {
		pos = Pos;
		vel = Vel;
		size = Size;
	}

	float topBorder() {
		return pos.y - size / 2;
	}

	float bottomBorder() {
		return pos.y + size / 2;
	}

	float rightBorder() {
		return pos.x + size / 2;
	}

	float leftBorder() {
		return pos.x - size / 2;
	}

	void move() {
		pos.set(pos.x + vel.x, pos.y + vel.y);
	}

	void accelerate() {
		float acc = 0.25;
		if (vel.x > 0) vel.x += acc;
		else vel.x -= acc;
		if (vel.y > 0) vel.y += acc;
		else vel.y -= acc;
	}

	void render() {
		circle(pos.x, pos.y, size);
	}
}
