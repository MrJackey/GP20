class CellControllerExtra extends CellController {
	Cell[] cells;

	CellControllerExtra() {
		reset();
	}

	void reset() {
		generationCount = 0;
		state = State.PRE;

		cells = new Cell[cellMult * cellMult];
		totalCells = cellMult * cellMult;

		gridSize = height;
		refreshCellSize();

		for (int y = 0; y < cellMult * cellMult; y++) {
				cells[y] = new Cell(y % cellMult, floor(y / cellMult));
		}

		for (Cell cell : cells) {
			cell.neighbours = getCellNeighbours(cell);
		}
	}

	Cell[] getCellNeighbours(Cell cell) {
		ArrayList<Cell> neighbours = new ArrayList<Cell>();

		int gridX = (int)cell.gridPos.x;
		int gridY = (int)cell.gridPos.y;
		int baseIndex = gridX + gridY * cellMult;
		int index;

		for (int x = gridX - 1; x <= gridX + 1; x++) {
			if (!isBetween(x, 0, cellMult - 1))
				continue;

			for (int y = gridY - 1; y <= gridY + 1; y++) {
				if (!isBetween(y, 0, cellMult - 1))
					continue;
				index = calcIndex(x, y);

				if (index != baseIndex)
					neighbours.add(cells[index]);
			}
		}

		return neighbours.toArray(new Cell[neighbours.size()]);
	}
	
	int calcIndex(int x, int y) {
		return x + y * cellMult;
	}

	void update() {
		if (millis() < updateTime + updateDelay)
			return;
		updateTime = millis();

		for (Cell cell : cells) {
			cell.countAliveNeighbours();
		}

		for (Cell cell : cells) {
			cell.update();
		}

		generationCount++;

		if (isStable()) {
			state = State.POST;
		}
	}

	boolean isStable() {
		for (Cell cell : cells) {
			if (!cell.isStable)
				return false;
		}
		return true;
	}

	void draw() {
		aliveCells = 0;
	
		push();
		translate(camera.zoomPoint.x, camera.zoomPoint.y);

		rectMode(CORNER);
		fill(33);
		square(0, 0, cellMult * cellSize);
		rectMode(CENTER);
		fill(#008800);
		noStroke();

		for (Cell cell : cells) {
			if (cell.isAlive) {
				cell.draw(cellSize);
				aliveCells++;
			}
		}

		pop();
	}

	void clear() {
		for (Cell cell : cells) {
			cell.isAlive = false;
		}
	}

	void toggleLife(int x, int y) {
		if (!isBetween(x, 0, cellMult - 1) || !isBetween(y, 0, cellMult - 1))
			return;

		int index = calcIndex(x, y);
		cells[index].toggleLife();
	}
}
