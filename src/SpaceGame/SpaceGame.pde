// Miriam Giles | 17 Sept 2026 |Shape Game
import processing.sound.*;
SoundFile laser1;
Spaceship s1;
Boss b1;
ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
ArrayList<Laser> laser = new ArrayList<Laser>();
Timer asteroidsDist, puDist;
int score, asteroidsCount, asteroidsOffScreen, laserSpeed;
boolean play;

void setup() {
  size(800, 1000);
  //b1 = new Boss();
  s1 = new Spaceship();
  //asteroids.add(new Asteroid(int(random(width)), -60));
  //powerups.add(new PowerUp(int(random(width)), -60));
  asteroidsDist = new Timer(2000);
  asteroidsDist.start();
  puDist = new Timer(3000);
  puDist.start();
  score = 0;
  asteroidsCount = 0;
  asteroidsOffScreen = 0;
  play = false;
  laser1 = new SoundFile(this, "laser1.mp3");
}

void draw() {
  noCursor();

  //check for start screen
  if (play == false) {
    startScreen();
  } else {

    background(#1D379D);
    //add rocks
    if (asteroidsDist.isFinished() == true) {
      asteroidsDist.start();
      asteroids.add(new Asteroid(int(random(width)), int(random(height))));
    }

    // add power ups
    if (puDist.isFinished() == true) {
      puDist.start();
      powerups.add(new PowerUp(int(random(width)), int(random(height))));
    }
    //boss01.display();
    //boss01.move();
    for (int g = 0; g < powerups.size(); g++) {
      PowerUp pu= powerups.get(g);
      //for (int j = 0; j < asteroids.size(); j++) {
      //  Asteroid a =  asteroids.get(j);
      if (pu.isHit(s1)) {
        if (pu.type == 'h') {
          s1.health += 100;
          powerups.remove(pu);
        } else if (pu.type == 's') {
          laserSpeed = laserSpeed +1;
          powerups.remove(pu);
        } else if (pu.type == 't') {
          s1.turretCount += 1;
          powerups.remove(pu);
        }
      }



      for (int i = 0; i < laser.size(); i++) {
        Laser l= laser.get(i);
        for (int j = 0; j < asteroids.size(); j++) {
          Asteroid a =  asteroids.get(j);
          if (a.isHit(s1)) {
            //increment score
            //remove rock and laser
          }
        }
        l.display();
        l.move();

        if (l.isOffScreen() == true) {
          laser.remove(l);
        }
        println(laser.size());
      }
      infoPanel();
      if (s1.health<1 || asteroidsOffScreen>9) {
        gameOver();
      }
    }
    s1.display();
    s1.move(mouseX, mouseY);
  }
  }
  void mousePressed() {
    if (s1.turretCount==1) {
      laser.add(new Laser(s1.x, s1.y, laserSpeed));
      //laser1.play();
    } else if (s1.turretCount==2) {
      laser.add(new Laser(s1.x-20, s1.y, laserSpeed));
      laser.add(new Laser(s1.x+20, s1.y, laserSpeed));
    } else {
      laser.add(new Laser(s1.x, s1.y, laserSpeed));
      laser.add(new Laser(s1.x-20, s1.y, laserSpeed));
      laser.add(new Laser(s1.x+20, s1.y, laserSpeed));
    }
  }

  void infoPanel() {
    fill(125, 15, 125, 15);
    rect(width/2, 20, width, 40);
    fill(255);
    text("Score: " + score, 20, 35);
    text("Rock Count: " + asteroidsCount, 180, 35);
    text("Health: " + s1.health, 380, 35);
    text("Asteroids Passed: " + asteroidsOffScreen, 500, 35);
  }

  void startScreen() {
    background(0);
    //add start screen graphic
    fill(255);
    text("Press any key to start game...", width/2-50, height/2);
    if (keyPressed) {
      play = true;
    }
  }

  void gameOver() {
    background(0);
    //add game over graphic
    fill(255);
    text("Game Over! Thanks For Playing!", width+300, height+400);
    noLoop();
  }
