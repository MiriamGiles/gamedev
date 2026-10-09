class Asteroid {
  // Member variables
  int x, y, w, h, health, hitPoints, speed;
  boolean isHit;
  PImage r1;

  // constructor

  Asteroid(int x, int y) {
    this.x = x;
    this.y = y;
    w = int(random(20, 100));
    h = int(random(20, 100));
    speed = int(random(1, 10));
    health = 100;
    //hitPoints = 100;
    isHit = false;
    if (random(2)>1) {
      r1 = loadImage("rock01.png");
    } else {
      r1 = loadImage("rock02.png");
    }
  }

  //Member Methods
  void display() {
    fill(127);
    r1.resize(w, w);
    image(r1, x, y);
    textAlign(CENTER, CENTER);
    fill(255);

    if (health > 50) {
      fill(#987272);
    } else {
      fill(#BF2E2E);
    }
    ellipse(x, y, w, h);
  }

  void move() {
    y = y + speed;
  }

  boolean isOffScreen() {
    if (y>height +50) {
      return true;
    } else {
      return false;
    }
  }
  boolean isHit(Spaceship s1) {
    float d = dist(x, y, s1.x, s1.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
