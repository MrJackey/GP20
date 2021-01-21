//This file is only for testing your movement/behavior.
//The Walkers will compete in a different program!

WalkerInterface walker;
PVector walkerPos;

void setup() {
  size(640, 480);

  //Create a walker from the class Example it has the type of WalkerInterface
  walker = new JacLun();

  walkerPos = walker.getStartPosition(width, height);
}

void draw() {
  point(walkerPos.x, walkerPos.y);
  PVector delta = walker.update();

  if (delta.magSq() != 1)
    println("Bad delta" + delta);
  walkerPos.add(delta);
}
