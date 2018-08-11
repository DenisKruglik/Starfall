class Star{
  
  final static int POST_IMAGES = 10;
  final static int INTERMEDIATE_IMAGES = 10;
  final static float MIN_RADIUS = 2;
  final static float MAX_RADIUS = 7;
  final static int MIN_SPEED_X = -20;
  final static int MAX_SPEED_X = 20;
  final static int MIN_SPEED_Y = 20;
  final static int MAX_SPEED_Y = 70;
  
  float x;
  float y;
  float r;
  PVector speed;
  ArrayList<PVector> images = new ArrayList<PVector>();
  
  Star() {
   this.x = random(0, width);
   this.r = random(MIN_RADIUS, MAX_RADIUS);
   this.y = random(-r*5, -r*2);
   this.speed = new PVector(random(MIN_SPEED_X, MAX_SPEED_X), random(MIN_SPEED_Y, MAX_SPEED_Y));
  }
  
  void fall() {
    fill(255, 255);
    ellipse(x, y, r*2, r*2);
    for(int i = 0; i < images.size(); i++) {
      showIntermediateImages(i);
    }
    PVector prev = new PVector(x, y);
    storePostImage(prev);
    if(images.size() > 0 && images.get(images.size() - 1).y - r < height) {
      x += speed.x;
      y += speed.y;
    } else {
      this.x = random(0, width);
      this.r = random(MIN_RADIUS, MAX_RADIUS);
      this.y = random(-r*5, -r*2);
      this.speed = new PVector(random(MIN_SPEED_X, MAX_SPEED_X), random(MIN_SPEED_Y, MAX_SPEED_Y));
      this.images.clear();
    }
  }
  
  void storePostImage(PVector image) {
    images.add(0, image);
    if(images.size() > POST_IMAGES) {
      images.remove(POST_IMAGES);
    }
  }
  
  float[] getImageParams(int ind) {
    float alpha = map(ind, 0, POST_IMAGES, 255, 0);
    float x = images.get(ind).x;
    float y = images.get(ind).y;
    float rad = map(ind, 0, POST_IMAGES, r, 0);
    return new float[]{alpha, x, y, rad};
  }
  
  void showIntermediateImages(int ind) {
    float[] imageParams = getImageParams(ind);
    float startAlpha;
    float startX;
    float startY;
    float startR;
    float endAlpha = imageParams[0];
    float endX = imageParams[1];
    float endY = imageParams[2];
    float endR = imageParams[3];
    
    if(ind == 0) {
      startAlpha = 255;
      startX = x;
      startY = y;
      startR = r;
    } else {
      float[] prevImageParams = getImageParams(ind - 1);
      startAlpha = prevImageParams[0];
      startX = prevImageParams[1];
      startY = prevImageParams[2];
      startR = prevImageParams[3];
    }
    
    for(int i = 0; i < INTERMEDIATE_IMAGES; i++) {
      float alpha = map(i, 0, INTERMEDIATE_IMAGES, startAlpha, endAlpha);
      fill(255, alpha);
      float x = map(i, 0, INTERMEDIATE_IMAGES, startX, endX);
      float y = map(i, 0, INTERMEDIATE_IMAGES, startY, endY);
      float rad = map(i, 0, INTERMEDIATE_IMAGES, startR, endR);
      ellipse(x, y, rad*2, rad*2);
    }
  }
}
