class Camera {
	PVector zoomPoint = new PVector(0, 0);

	void pan() {
		PVector mousePos = new PVector(mouseX, mouseY);
		zoomPoint.add(mousePos.sub(pmouseX, pmouseY));
	}

	void resize(int dir) {
		PVector mousePos = new PVector(mouseX, mouseY);
		PVector gridMid = new PVector(width / 2, height / 2).add(zoomPoint);

		mousePos.sub(gridMid);
		mousePos.mult(-1);

		zoomPoint.lerp(mousePos, 0.2);
		if (cellController.cellSize > 1)
			cellController.cellSize += dir < 0 ? 1 : -1;
	}
	
	void reset() {
		cellController.cellSize = cellController.baseCellSize;
		zoomPoint.set(0, 0);
	}
}
