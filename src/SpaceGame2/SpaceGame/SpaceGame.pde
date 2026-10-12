// Miriam Giles | 17 Sept 2026 |Shape Game
//import processing.sound.*;
//SoundFile laser1;
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
  laserSpeed = 1;
  //laser1 = new SoundFile(this, "laser1.mp3");
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
      asteroids.add(new Asteroid(int(random(width)), 0));
    }
    for (int i = 0; i < asteroids.size(); i++) {
      Asteroid a= asteroids.get(i);
      a.display();
      a.move();

      if (a.isHit(s1)) {
        asteroids.remove(a);
        s1.health-=10;
      }

      if (a.isOffScreen()) {
        asteroids.remove(a);
        asteroidsOffScreen++;
      }
    }

    // add power ups
    if (puDist.isFinished() == true) {
      puDist.start();
      powerups.add(new PowerUp(int(random(width)), 0));
    }
    //boss01.display();
    //boss01.move();
    for (int g = 0; g < powerups.size(); g++) {
      PowerUp pu= powerups.get(g);
      pu.display();
      pu.move();
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
    }

    for (int i = 0; i < laser.size(); i++) {
      Laser l= laser.get(i);
      l.display();
      l.move();
      for (int j = 0; j < asteroids.size(); j++) {
        Asteroid a =  asteroids.get(j);
        if (l.isHit(a)) {
          asteroids.remove(a);
          laser.remove(l);
          score+=1;
          asteroidsCount+=1;
        }
      }


      if (l.isOffScreen() == true) {
        laser.remove(l);
      }
      println(laser.size());
    }

    if (s1.health<1 || asteroidsOffScreen>9) {
      gameOver();
    }

    infoPanel();
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
  } else if (s1.turretCount>=3) {
    laser.add(new Laser(s1.x, s1.y, laserSpeed));
    laser.add(new Laser(s1.x-20, s1.y, laserSpeed));
    laser.add(new Laser(s1.x+20, s1.y, laserSpeed));
  }
}

void infoPanel() {
  fill(125, 15, 125, 15);
  rect(0, 0, width, 50);
  fill(255);
  text("Score: " + score, 40, 35);
  text("Asteroid Count: " + asteroidsCount, 200, 35);
  text("Health: " + s1.health, 400, 35);
  text("Asteroids Passed: " + asteroidsOffScreen, 600, 35);
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
  text("Game Over! Thanks For Playing!", width/2, height/2);
  noLoop();
}
