class PowerUp {
  // Member variables
  int x, y, size, speed;
  boolean isHit;
  char type;
  PImage p1;

  // constructor

  PowerUp(int x, int y) {
    this.x = x;
    this.y = y;
    size = int(random(20, 100));
    speed = int(random(1, 9));
    if (random(3)>2.0) {
      type = 'h';
      //p1 = loadImage("powerup01.png");
    } else if(random(2)>1.0) {
      type = 't';
      //p1 = loadImage("powerup02.png");
    } else {
      type = 's';
      //p1 = loadImage("powerup03.png");
    }
    isHit = false;
  }

  //Member Methods
  void display() {
    fill(55,200,44);
    if (size > 50) {
      fill(22, 55, 222);
    } else {
      fill(222, 43, 22);
    }
    ellipse(x, y, size, speed);
    textSize(20);
    text(type,x,y);
  }

  void move() {
    x = x + speed;
  }

  boolean isOffScreen() {
    if (y>height +50) {
      return true;
    } else {
      return false;
    }
  }
  boolean isHit(Spaceship s) {
    float d = dist(x, y, s.x, s.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
