Player p1, p2;
Ball ball;

void setup() {
  size(1280, 728);
  p1 = new Player(new PVector(100, height / 2));
  p2 = new Player(new PVector(width - 100.0, height / 2));
  ball = new Ball(new PVector(width / 2, height / 2), new PVector(0, 0), 25.0);
  reset();
}

void draw() {
  background(0);
  movePlayers();
  moveBall();
}

void reset() {
    ball.pos.set(width / 2, height / 2);
    float speedX = Math.ceil(random(0, 2)) == 2 ? random(3, 7) : random(-7, -3);
    float speedY = Math.ceil(random(0, 2)) == 2 ? random(3, 7) : random(-7, -3);
    ball.vel.set(speedX, speedY);
}

void keyPressed() {
  if (key == 'w') p1.isMovingUp = true;
  if (key == 's') p1.isMovingDown = true;
  if (keyCode == UP) p2.isMovingUp = true;
  if (keyCode == DOWN) p2.isMovingDown = true;
}

void keyReleased() {
  if (key == 'w') p1.isMovingUp = false;
  if (key == 's') p1.isMovingDown = false;
  if (keyCode == UP) p2.isMovingUp = false;
  if (keyCode == DOWN) p2.isMovingDown = false;
}

void movePlayers() {
  if (p1.isMovingUp) p1.moveUp();
  if (p1.isMovingDown) p1.moveDown();
  if (p2.isMovingUp) p2.moveUp();
  if (p2.isMovingDown) p2.moveDown();
  
  rectMode(CENTER);
  p1.render();
  p2.render();
}

void moveBall() {
  checkPlayerHit();
  checkBounds();
  ball.move();
  ball.render();
}

void checkPlayerHit() {
  // Ball in middle of board
  if (isBetween(ball.pos.x, p1.pos.x + ball.size / 2, p2.pos.x - ball.size / 2)) return;

  // Player1
  if (ball.vel.x < 0) {
    if (isBetween(ball.leftBorder(), p1.leftBorder() - abs(ball.vel.x), p1.rightBorder())) { // Correct X
      if (isBetween(ball.pos.y, p1.top(), p1.bottom())) { // Correct Y
        ball.vel.x *= -1;
        ball.accelerate();
      }
    }
  // Player2
  } else { 
    if (isBetween(ball.rightBorder(), p2.leftBorder(), p2.rightBorder() + abs(ball.vel.x))) { // Correct X
      if (isBetween(ball.pos.y, p2.top(), p2.bottom())) { // Correct Y
        ball.vel.x *= -1;
        ball.accelerate();
      }
    }
  }
}

void checkBounds() {
  if (ball.topBorder() < 0 || ball.bottomBorder() > height) ball.vel.y *= -1;
  if (ball.leftBorder() < 0 || ball.rightBorder() > width) reset();
}

// Helpers
boolean isBetween(float value, float min, float max) {
  return value > min && value < max;
}
