class CellController {
	Cell[][] cells;
	float baseCellSize, 
		cellSize;
	int cellMult = 100,
		updateDelay = 500,
		updateTime,
		generationCount,
		aliveCells,
		totalCells;

	void reset() {
		generationCount = 0;
		state = State.PRE;

		cells = new Cell[cellMult][cellMult];
		totalCells = cellMult * cellMult;
		baseCellSize = (float)height / cellMult;
		cellSize = baseCellSize;

		for (int x = 0; x < cellMult; x++) {
			Cell[] cellColumn = cells[x];

			for (int y = 0; y < cellMult; y++) {
				cellColumn[y] = new Cell(x, y);
			}
		}

		for (Cell[] cellRow : cells) {
			for (Cell cell : cellRow) {
				cell.neighbours = getCellNeighbours(cell);
			}
		}
	}

	Cell[] getCellNeighbours(Cell cell) {
		ArrayList<Cell> neighbours = new ArrayList<Cell>();

		int gridX = (int)cell.gridPos.x;
		int gridY = (int)cell.gridPos.y;

		for (int x = gridX - 1; x <= gridX + 1; x++) {
			if (!isBetween(x, 0, cellMult - 1))
				continue;

			for (int y = gridY - 1; y <= gridY + 1; y++) {
				if (!isBetween(y, 0, cellMult - 1) || (x == gridX && y == gridY))
					continue;

					neighbours.add(cells[x][y]);
			}
		}
		
		return neighbours.toArray(new Cell[neighbours.size()]);
	}

	void update() {
		if (millis() < updateTime + updateDelay)
			return;
		updateTime = millis();

		for (Cell[] cellColumn : cells) {
			for (Cell cell : cellColumn) {
				cell.countAliveNeighbours();
			}
		}

		for (Cell[] cellRow : cells) {
			for (Cell cell : cellRow) {
				cell.update();
			}
		}

		generationCount++;

		if (isStable()) {
			state = State.POST;
		}
	}

	boolean isStable() {
		for (Cell[] cellRow : cells) {
			for (Cell cell : cellRow) {
				if (!cell.isStable)
					return false;
			}
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

		for (Cell[] cellRow : cells) {
			for (Cell cell : cellRow) {
				if (cell.isAlive) {
					cell.draw();
					aliveCells++;
				}
			}
		}

		pop();
	}

	void clear() {
		for (Cell[] cellRow : cells) {
			for (Cell cell : cellRow) {
				cell.isAlive = false;
			}
		}
	}

	void changeSpeed(int time) {
		if (updateDelay <= 100 && time < 0)
			return;
		updateDelay += time;
	}
	
	void toggleLife(int x, int y) {
		if (!isBetween(x, 0, cellMult - 1) || !isBetween(y, 0, cellMult - 1))
			return;
		cells[x][y].toggleLife();
	}
}
