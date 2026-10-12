class Laser {
  int x, y, w, h, speed;
  Laser(int x, int y, int speed) {
    this.x = x;
    this.y = y;
    w = 6;
    h = 12;
    this.speed = speed;
  }
  void display() {
    fill(255, 0, 0);
    rect(x, y, w, h);
  }
  
  void move() {
    y=y-speed;
  }

  boolean isOffScreen() {
    if (y<-15) {
      return true;
    } else {
      return false;
    }
  }

  boolean isHit(Asteroid a) {
    float d = dist(x, y, a.x, a.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
