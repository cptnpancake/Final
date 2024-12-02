 /*
  Assignment: OOP EXERCISE
  Student: Michael
  Pasadena City College, Fall 2024
  Course Name: DMA60 Creative Coding
  Prof. George McKinney
  Project Description: This program is an edited version of the example given in Canvas.
  Last Modified: November 19, 2024
  */


//This pde file is setting up the boolean states, playable character, and obstacles (fruits).

boolean notEaten1 = false;
boolean notEaten2 = false;
//Two states for the fruits when they are eaten seperately.


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


abstract class Obstacle { //The class for the 2 fruits which have their own pde file.
  float x, y;
  float size;
  
  Obstacle(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
  }

  abstract void display();
}

