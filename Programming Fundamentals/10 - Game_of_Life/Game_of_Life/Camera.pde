class Camera {
	PVector zoomPoint = new PVector(0, 0);
	int zoomRatio = 50;

	void pan() {
		PVector mousePos = new PVector(mouseX, mouseY);
		zoomPoint.add(mousePos.sub(pmouseX, pmouseY));
	}

	void resize(int dir) {
		if (cellController.gridSize <= zoomRatio && dir > 0) 
			return;

		PVector mousePos = new PVector(mouseX, mouseY);
		PVector gridMid = new PVector(width / 2, height / 2).add(zoomPoint);

		mousePos.sub(gridMid);
		mousePos.mult(-1);

		zoomPoint.lerp(mousePos, 0.2);

		cellController.gridSize += dir * zoomRatio  * -1;
		cellController.refreshCellSize();
	}
	
	void reset() {
		cellController.gridSize = height;
		cellController.refreshCellSize();
		zoomPoint.set(0, 0);
	}
}
