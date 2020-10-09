class Cell {
	PVector gridPos;
	Cell[] neighbours;
	int aliveNeighbours;
	boolean isStable = false,
		isAlive;
	float bornAliveChance = 20;

	Cell(int gridX, int gridY) {
		this.gridPos = new PVector(gridX, gridY);
 
		resetLife();
	}

	void update() {
		boolean prevLife = isAlive;
		isStable = false;

		if (aliveNeighbours < 2 || aliveNeighbours > 3)
			isAlive = false;
		else if (aliveNeighbours == 3)
			isAlive = true;

		if (prevLife == isAlive)
			isStable = true;
	}

	void countAliveNeighbours() {
		int count = 0;

		for (Cell neighbour : neighbours) {
			count += neighbour.isAlive ? 1 : 0;
		}
		
		aliveNeighbours = count;
	}

	void draw(float size) {
		square(
			gridPos.x * cellController.cellSize + cellController.cellSize / 2, 
			gridPos.y * cellController.cellSize + cellController.cellSize / 2, 
			size
		);
	}

	void toggleLife() {
		isAlive = !isAlive;
	}

	void die() {
		isAlive = false;
	}

	void resetLife() {
		this.isAlive = random(100) <= bornAliveChance ? true : false; 
	}
}
