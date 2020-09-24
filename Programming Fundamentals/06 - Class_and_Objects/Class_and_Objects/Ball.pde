class Ball extends Circle {
  // Our class variables
  // PVector position; //Ball position
  PVector velocity; //Ball direction
  color col;
  int speed = 30;

  //Ball Constructor, called when we type new Ball(x, y);
  Ball(float x, float y) {
    super(x, y, random(30, 50));

    //Set our position when we create the code.
    // position = new PVector(x, y);

    //Create the velocity vector and give it a random direction.
    velocity = new PVector();
    velocity.x = random(11) - 5;
    velocity.y = random(11) - 5;

    col = color(random(255), random(255), random(255));
  }

  //Update our ball
  void update() {
    checkScreenBounce();

    pos.x += velocity.x * speed * deltaTime;
    pos.y += velocity.y * speed * deltaTime;
  }

  void draw(){
    fill(col);
    stroke(255);
    ellipse(pos.x, pos.y, size, size);
  }

  void checkScreenBounce() {
    if (pos.x < 0 + radius || pos.x > width - radius)
      velocity.x *= -1;
    if (pos.y < 0 + radius || pos.y > height - radius)
      velocity.y *= -1;
  }
}
