class CharacterManager {
	int humanCount = 99,
		zombieCount = 1;
	ArrayList<Character> chars = new ArrayList<Character>();

	CharacterManager() {
		for (int i = 0; i < zombieCount; i++)
			chars.add(new Zombie());
		for (int i = 0; i < humanCount; i++)
			chars.add(new Human());
	}

	void update() {
		for (int i = 0; i < chars.size(); i++) {
			Character char1 = chars.get(i);

			PVector closestHumanDir = new PVector(0, 0),
				dir = new PVector();
			float closestHumanDist = width*width,
				dist;

			for (int j = 0; j < chars.size(); j++) {
				Character char2 = chars.get(j);
				
				boolean isColliding = circleCollision(char1, char2);
				if (isColliding)
					separate(char1, char2);

				if (char1 instanceof Zombie && char2 instanceof Human) {
					if (isColliding) {
						// Zombie is colliding with human
						transformHtoZ((Human)char2, j);
					} else {
						// Turn toward the closest human
						dir = char2.pos.copy().sub(char1.pos);
						dist = dir.magSq();

						if (dist < closestHumanDist) {
							closestHumanDist = dist;
							closestHumanDir = dir.copy();
						}
						((Zombie)char1).turnTo(closestHumanDir.copy());
					}
				}
			}
		}

		for (Character chara : chars) {
			chara.update();
		}
	}

	void draw() {
		for (int i = 0; i < chars.size(); i++) {
			chars.get(i).draw();
		}
	}

	// Separate two colliding characters
	void separate(Character char1, Character char2) {
		PVector dir = PVector.sub(char2.pos, char1.pos);
		float dist = dir.mag();
		float pushDist = char2.radius + char1.radius - dist;
		dir.normalize().mult(pushDist / 2);

		char1.pos.sub(dir);
		char2.pos.add(dir);
	}
	
	// Remove infected human and add zombie in its place
	void transformHtoZ(Human human, int index) {
		chars.add(new Zombie(human.pos, human.vel, human.size));
		chars.remove(index);
		humanCount--;
		zombieCount++;
	}
}