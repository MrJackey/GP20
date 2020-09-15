class Player {
  PVector pos, vel;
  int h, w;
  boolean isMovingUp = false,
   isMovingDown = false;

  Player(PVector Pos) {
    pos = Pos;
    h = 100;
    w = 10;

    vel = new PVector(0, 10);
  }

  float top() {
    return pos.y - h / 2;
  }

  float bottom() {
    return pos.y + h / 2;
  }

  float leftBorder() {
    return pos.x - w / 2;
  }

  float rightBorder() {
    return pos.x + w / 2;
  }
  
  void moveUp() {
    if (top() <= 0) return;
  	pos.y -= vel.y;
  }

  void moveDown() {
    if (bottom() >= height) return;
  	pos.y += vel.y;
  }

  void render() {
    rect(pos.x, pos.y, w, h);
  }
}
