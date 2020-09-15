class Objective {
	PVector pos;

	Objective() {
		pos = new PVector();
		teleport();
	}

	void render() {
		stroke(255, 0, 0);
		fill(255, 0, 0);
		ellipse(pos.x, pos.y, gridSize, gridSize);
	}

	void checkPlayerContact() {
		PVector dist = pos.copy().sub(player.pos);
		if (dist.x == 0 && dist.y == 0) {
			player.addPart();
			teleport();
		}
	}

	void teleport() {
		int newXPos;
		int newYPos;
		int gridHalf = gridSize / 2;
		PVector newPos = new PVector();

		boolean freeGrid = false;
		while (!freeGrid) {
			freeGrid = true;
			newXPos = gridSize * floor(random(width / gridSize - 1)) + gridHalf;
			newYPos = gridSize * floor(random(height / gridSize - 1)) + gridHalf;
			newPos.set(newXPos, newYPos);

			PVector dist = new PVector();
			dist.set(player.pos.copy().sub(newPos));

			if (dist.mag() <= gridSize) {
				freeGrid = false;
			}

			for (Part part : player.parts) {
				dist.set(newPos.copy().sub(part.pos));
				if (dist.mag() <= gridSize)  {
					freeGrid = false;
					break;
				}
			}
		}	
		pos.set(newPos);
	}
}