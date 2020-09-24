enum GameState {
	ACTIVE,
	GAMEOVER,
}

CharacterManager charManager;
HUD hud = new HUD();
GameState gameState = GameState.ACTIVE;
float gameTime;

void setup() {
	size(800, 800);
	charManager = new CharacterManager();
}

void draw() {
	background(90);

	charManager.update();
	charManager.draw();	

	if (gameState != GameState.GAMEOVER && charManager.humanCount == 0) {
		gameState = GameState.GAMEOVER;
		gameTime = round(millis() * 0.001 * 100.0) / 100.0;
	}

	hud.drawStats();
	hud.drawTimer();
	if (gameState == GameState.GAMEOVER)
		hud.drawGameOver();
}

// public <T> T[] shuffle(T[] arr) {
// 	T[] output = arr.clone();
// 	for (int i = 0; i < arr.length; i++) {
// 		int index = floor(random(arr.length));
// 		T temp = output[index];
// 		output[index] = output[i];
// 		output[i] = temp;
// 	}
// 	return output;
// }