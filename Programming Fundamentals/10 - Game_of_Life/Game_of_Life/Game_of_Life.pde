CellController cellController;
Camera camera;
HUDController HUD;
State state;

enum State {
	PRE,
	RUNNING, 
	POST,
}

void setup() {
	size(840, 840);
	frameRate(500);

	state = State.PRE;

	cellController = new CellController();
	cellController.reset();
	camera = new Camera();
	HUD = new HUDController();
}

void draw() {
	background(0);

	if (state == State.RUNNING)
		cellController.update();

	cellController.draw();

	HUD.draw();
}

void toggleCellController() {
	if (cellController instanceof CellControllerExtra)
		cellController = new CellController();
	else
		cellController = new CellControllerExtra();
	cellController.reset();
}

void mouseClicked(MouseEvent event) {
	if (mouseButton == RIGHT)
		camera.reset();
	if (mouseButton == LEFT) {
		int x = floor((mouseX - camera.zoomPoint.x) / cellController.cellSize);
		int y = floor((mouseY - camera.zoomPoint.y)/ cellController.cellSize);

		cellController.toggleLife(x, y);
	}
}

void mouseDragged() {
	if (mouseButton != LEFT)
		return;
	camera.pan();
}

void mouseWheel(MouseEvent event) {
	camera.resize(event.getCount());
}

void keyPressed() {
	if (key == ENTER)
		state = state == State.RUNNING ? State.PRE : State.RUNNING;
	if (key == 'c' || key == 'C')
		cellController.clear();
	if (key == 'r' || key == 'R')
		cellController.reset();
	if (key == '+')
		cellController.changeSpeed(100);
	if (key == '-')
		cellController.changeSpeed(-100);
	if (key == 'a' || key == 'A')
		toggleCellController();
}
