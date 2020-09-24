class HUD {
	int margin = 10;

	void drawGameOver() {
		fill(138, 3, 3);
		textSize(64);
		textAlign(CENTER, BOTTOM);
		text("ALL HUMANS\nHAVE PERISHED", width/2, height/2);

		textSize(32);
		textAlign(CENTER, TOP);
		text(String.format("The humans survived for: %.2fs", gameTime), width/2, height/2);
	}

	void drawStats() {
		fill(255);
		textSize(16);
		textAlign(LEFT, TOP);

		text(String.format("Humans Remaining: %d", charManager.humanCount), margin, margin);
		text(String.format("Total Zombies: %d", charManager.zombieCount), margin, margin + 20);
	}

	void drawTimer() {
		fill(255);
		textSize(16);
		textAlign(RIGHT, TOP);
		text(String.format("Time Passed: %ds", int(millis() * 0.001)), width - margin, margin);
	}
}