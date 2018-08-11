int amount = 40;
ArrayList<Star> stars = new ArrayList<Star>();

void setup() {
  size(800, 600, P2D);
  fill(255);
  noStroke();
  for(int i = 0; i < amount; i++) {
    Star s = new Star();
    stars.add(s);
  }
}

void draw() {
  background(0); //<>//
  for(Star s: stars) {
    s.fall();
  }
}
