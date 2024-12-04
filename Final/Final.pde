 /*
  Assignment: Semester Project
  Student: Michael
  Pasadena City College, Fall 2024
  Course Name: DMA60 Creative Coding
  Prof. George McKinney
  Project Description: This is a simplied version of Pac-Man where eating dots will generate an abstract background.
  Last Modified: December 2, 2024
  */


//This pde file is setting up the boolean states, playable character (Pac-Man), obstacles (ghost), and collectibles (dots).

boolean caught = false;
//The state for when the ghost catches Pac-Man.


class Character { //The playable Pac-Man character.
  float x, y;
  float size;
  
  Character(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
  }
  
  void move(float xSpeed, float ySpeed) {
    x += xSpeed;
    y += ySpeed;
  }
  
  boolean collidesWith(Obstacle obstacle) {
    float distance = dist(x, y, obstacle.x, obstacle.y);
    return distance < (size + obstacle.size) / 2;
  }
  
  void display() {
    fill(255, 255, 0);
    arc(x, y, 80, 80, .6, TWO_PI-.6);
  }
}


abstract class Obstacle { //The class for the ghost which has its own pde file.
  float x, y;
  float size;
  
  Obstacle(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
  }

  void move(float xSpeed, float ySpeed) {
    x += xSpeed;
    y += ySpeed;
  }

  abstract void display();
}


abstract class Collectible { //The class for the collectible dots which has their own pde file.
  float x, y;
  float size;
  
  Collectible(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
  }
  
  abstract void display();
}
