class JacLun implements WalkerInterface {
	private PVector playArea = new PVector();
	private PVector position = new PVector();
	private PVector facing = new PVector();

	private ArrayList<PVector> pastPositions = new ArrayList();

	public String getName() { return "Jacke"; }

	public PVector getStartPosition(int playAreaWidth, int playAreaHeight) {
		playArea.set(playAreaWidth, playAreaHeight);

		float offset = 0.3;
		int xOffset = floor(playArea.x * offset);
		int yOffset = floor(playArea.y * offset);

		int x = (int)random(xOffset, playArea.x - xOffset);
		int y = (int)random(yOffset, playArea.y - yOffset);

		position.set(x, y);
		return position.copy();
	}

	public PVector update() {
		ArrayList<PVector> directions = getAvailableDirections();

		removeLastDirection(directions);
		removeOutofBounds(directions);

		shuffle(directions);
		removeWouldBePastPositions(directions);

		PVector chosenDirection = directions.get((int)random(0, directions.size()));
		facing = chosenDirection;

		pastPositions.add(position.copy());

		position.add(facing.copy());

		return facing;
	}

	private ArrayList<PVector> getAvailableDirections() {
		ArrayList<PVector> directions = new ArrayList();
		directions.add(new PVector(1, 0));
		directions.add(new PVector(-1, 0));
		directions.add(new PVector(0, 1));
		directions.add(new PVector(0, -1));

		return directions;
	}

	private void removeLastDirection(ArrayList<PVector> directions) {
		for (int i = 0; i < directions.size(); i++) {
			PVector direction = directions.get(i);

			if (direction.x == facing.x && direction.y == facing.y) {
				directions.remove(i);
				return;
			}
		}
	}

	private void removeOutofBounds(ArrayList<PVector> directions) {
		for (int i = directions.size() - 1; i >= 0; i--) {
			if (directions.size() == 1) break;

			PVector newPosition = position.copy().add(directions.get(i));
			if (isOutOfBounds(newPosition))
				directions.remove(i);
		}
	}

	private boolean isOutOfBounds(PVector position) {
		return (position.y <= 1 ||
						position.y >= playArea.y - 1 ||
						position.x <= 1 ||
						position.x >= playArea.x - 1);
	}

	private <T> void shuffle(ArrayList<T> list) {
		for (int i = 0; i < list.size() - 1; i++) {
			int j = (int)random(i, list.size());

			T temp = list.get(i);
			list.set(i, list.get(j));
			list.set(j, temp);
		}
	}

	private void removeWouldBePastPositions(ArrayList<PVector> directions) {
			for (int i = directions.size() - 1; i >= 0; i--) {
				if (directions.size() == 1) break;

				if (isDirectionHistory(directions.get(i)))
					directions.remove(i);
			}
	}

	private boolean isDirectionHistory(PVector direction) {
		PVector newPosition = position.copy().add(direction.copy());

		if (isOutOfBounds(newPosition)) return true;

		for (int i = pastPositions.size() - 1; i >= 0; i--) {
			PVector pastPosition = pastPositions.get(i);

			if (pastPosition.x == newPosition.x && pastPosition.y == newPosition.y)
				return true;
		}

		return false;
	}
}
