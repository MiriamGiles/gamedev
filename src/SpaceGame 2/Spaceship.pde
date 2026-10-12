class Spaceship {
  //Member Variables
  int x,y,health, turretCount;
  PImage space01;
  
  // Constructor
  Spaceship() {
    x = width/2;
    y = height/2;
    turretCount = 1;
    space01 = loadImage("");
  }
  
  // Member Methods
  void display() {
    fill(0);
    stroke(0);
    //Shooters
    ellipse(x+50,y-15,2,30);
    ellipse(x-50,y-15,2,30);
    fill(127);
    //propellers
    ellipse(x-30,y,10,50);
    ellipse(x+30,y,10,50);
    //Engine
    quad(x-12,y+10,x-22,y+10,x-22,y+30,x-12,y+30);
    quad(x+12,y+10,x+22,y+10,x+22,y+30,x+12,y+30);
    //Body of ship
    stroke(100);
    quad(x,y-25,x+50,y,x,y+25,x-50,y);
    quad(x,y-50,x+20,y,x,y+50,x-20,y);
    fill(255);
    stroke(0);
    line(x,y-35,x,y+35);
    triangle(x,y-40,x+7,y-15,x-7,y-15);
  }
  
  void move(int tempX, int tempY) {
    x = tempX;
    y = tempY;
  }
}
