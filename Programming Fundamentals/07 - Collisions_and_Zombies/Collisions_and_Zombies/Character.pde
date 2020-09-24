class Character {
	PVector pos, vel;
	color col;
	float size = 17.5, 
		radius,
		speed;

	Character() {
		int margin = 20;
		this.pos = new PVector(random(margin, width - margin), random(margin, height - margin));
		this.radius = size / 2;
		this.speed = 1;
	}

	void draw() {
		fill(col);
		ellipse(pos.x, pos.y, size, size);
	}

	void update() {
		checkBoundary();
		pos.add(vel);
	}

	void checkBoundary() {
		if (pos.x < 0)
			pos.x += width;
		if (pos.x > width)
			pos.x -= width;
		if (pos.y < 0)
			pos.y += height;
		if (pos.y > height)
			pos.y -= height;
	}
}
