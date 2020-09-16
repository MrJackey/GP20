Player player;
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
float deltaTime, time;
boolean addedObstacle = false;
PVector gravity;
 
void setup() {
	size(1080, 720);
	strokeWeight(2);

	player = new Player();
	gravity = new PVector(0, 500);
}

void draw() {
	background(0, 127, 255);
	long currentTime = millis();
	deltaTime = (currentTime - time) * 0.001;

	if (second() % 3 == 0 && !addedObstacle) {
		obstacles.add(new Obstacle());
		addedObstacle = true;
	}
	if (second() % 3 == 1) addedObstacle = false;

	player.move();

	for (int i = obstacles.size() - 1; i >= 0 && obstacles.size() > 0; i--) {
		Obstacle obstacle = obstacles.get(i);
		if (obstacle.pos.x < -obstacle.w) {
			obstacles.remove(i);
			continue;
		} else obstacle.checkPlayerCollision();

		obstacle.move();
		obstacle.render();
	}

	player.render();
	
	time = currentTime;
}

void reset() {
	player = new Player();
	obstacles.clear();
}

void keyPressed() {
	if (key == ' ') player.fly();
}

// Helpers
boolean isWithin(float value, float min, float max) {
	return value > min && value < max;
}
