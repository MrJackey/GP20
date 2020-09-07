float anim = 0;
float [] anims;
int strokes = 0;

void setup() {
	size(768,432);
	strokeWeight(15);
	noFill();
  background(255);
	reset();	
}

void draw() {
	J(34, 96, 120, 240);
	A(174, 96, 120, 240);
	C(363, 96, 120, 240);
	O(445, 96, 120, 240);
	B(600, 96, 120, 240);

  animation();
}

// tlX - topLeftX, tlY - topLeftY
void J(int tlX, int tlY, int charWidth, int charHeight) {
	line(tlX,tlY, tlX+charWidth*anims[0], tlY);
	if (strokes >= 1) line(tlX+charWidth, tlY, tlX+charWidth, tlY+charHeight*0.75*anims[1]);
	if (strokes >= 2) arc(tlX+charWidth/2, tlY+charHeight*0.75, charWidth, charHeight/2, 0, PI*anims[2], OPEN);
}

void A(int tlX, int tlY, int charWidth, int charHeight) {
	if (strokes >= 3) line(tlX, tlY+charHeight, tlX+(charWidth/2)*anims[3], tlY+charHeight-charHeight*anims[3]);
	if (strokes >= 4) line(tlX+charWidth/2, tlY, tlX+charWidth/2+(charWidth/2)*anims[4], tlY+charHeight*anims[4]);

	float delta = charHeight/(charWidth/2);
	float x = (charHeight/2)/delta;

	if (strokes >= 5) line(tlX+x, tlY+charHeight/2, tlX+x+(charWidth/2)*anims[5], tlY+charHeight/2);
}

void C(int tlX, int tlY, int charWidth, int charHeight) {
	if (strokes >= 6) arc(tlX+charWidth/2, tlY+charHeight/2, charWidth*2, charHeight, HALF_PI, (PI+HALF_PI)*anims[6], OPEN);
}

void O(int tlX, int tlY, int charWidth, int charHeight) {
	if (strokes >= 7) arc(tlX+charWidth/2, tlY+charHeight/2, charWidth, charHeight, PI+HALF_PI, (TWO_PI+PI+HALF_PI)*anims[7]);
}

void B(int tlX, int tlY, int charWidth, int charHeight) {
	if (strokes >= 8) line(tlX, tlY, tlX, tlY+charHeight*anims[8]);
	if (strokes >= 9) arc(tlX, tlY+charHeight*0.225, charWidth*1.5, charHeight*0.45, PI+HALF_PI, (TWO_PI+HALF_PI)*anims[9], OPEN);
	if (strokes >= 10) arc(tlX, tlY+charHeight*0.725, charWidth*2, charHeight*0.55, PI+HALF_PI, (TWO_PI+HALF_PI)*anims[10], OPEN);
}

// 0 < anim < 1
void animation() {
  anim += 0.05;
  if (strokes < 11) anims[strokes] = anim;
  if (anim >= 1 || strokes >= 11) {
    strokes++;
    anim = 0;
  }
  if (strokes == 100) reset();
}

void reset() {
 	strokes = 0;
  anims = new float[11];
  stroke(random(255), random(255), random(255));
}