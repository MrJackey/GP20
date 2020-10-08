class HUDController {
	int margin = 10;
	color col = #FFFFFF;

	void draw() {
		fill(col);
		
		drawStats();

		textSize(20);
		textAlign(LEFT, TOP);

		drawControls();
		if (state == State.POST)
			drawPost();
	}

	void drawControls() {
		text("Click a cell to toggle it's life", margin, margin);
		text("Press 'R' to randomize all cells, 'C' to clear", margin, margin + 30);
		text("Press '+' or '-' to control the speed", margin, margin + 60);
		text("Press 'A' to toggle arrayMode ([ ]/[ ][ ])", margin, margin + 90);
		text("Hold down 'LMB' to pan\nScroll to zoom\nClick 'RMB' to reset camera", margin, margin + 120);
		text("Press 'Enter' to toggle simulation", margin, margin + 210);
	}

	void drawPost() {
		textSize(40);
		textAlign(CENTER, CENTER);
		fill(0, 90);
		rectMode(CENTER);
		rect(width / 2, height / 2, 400, 150);
		fill(255);
		text("Your simulation\nhas become stable", width / 2, height / 2);
	}
	
	void drawStats() {
		textSize(20);
		textAlign(RIGHT, TOP);
		text(String.format("Speed: %.1fs", cellController.updateDelay * 0.001), 
			width - margin, margin);
		text(String.format("Generation: %d", cellController.generationCount), 
			width - margin, margin + 30);
		text(String.format("Cells alive: %d/%d", cellController.aliveCells, cellController.totalCells), 	width - margin, margin + 60);
		text(String.format("FPS: %.1f", frameRate),
			width - margin, margin + 90);
		text("ArrayMode: " + (cellController instanceof CellControllerExtra ? "[ ]" : "[ ][ ]"), 
			width - margin, margin + 120);
	}
}
