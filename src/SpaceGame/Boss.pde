class Boss{
  int x, y, w, h, duration, health, speed, lvl;
  boolean isHit;
  PImage b1;
  
   // constructor
  Boss(int x, int y, int lvl) {
   this.x = x;
   this.y = y;
   this.lvl = lvl;
   w = 200;
   h = 200;
   duration =  20000;
   health = 10000;
   speed = 1;
   isHit = false;
   if(lvl == 1) {
     b1 = loadImage("lvl1boss.png");   
   } else if(lvl ==2) {
     b1 = loadImage("lvl2boss.png");
   } else if(lvl ==3) {
     b1 = loadImage("lvl3boss.png");
   }
 
 }
  
  //Display
  void display() {
    //Todo: replace with image
    //image(b1,x,y);
    fill(255,6,88);
    ellipse(x,y,w,h);
    fill(255);
    text(health,x,y);
  }
  
  void move() {
    x =x + speed;
  }
}
