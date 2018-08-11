int amount = 100;
ArrayList<Star> stars = new ArrayList<Star>();

void setup() {
  size(1024, 768, P2D);
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
