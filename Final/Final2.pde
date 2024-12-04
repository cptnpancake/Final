//This pde file has code for the game behavior itself.

import processing.sound.*;

Character player;
Ghost ghost;
Dot dot;
SoundFile start; //Sound for starting the game.
SoundFile waka; //Sound for eating dots.
SoundFile lose; //Sound if the ghost catches Pac-Man.
SoundFile win; //Sound if Pac-Man successfully eats all dots.


void setup() { //Placements for Pac-Man, ghost, and dots on the screen. Codes for loading the sound effects in are also here.
  size(800, 600);
  player = new Character(50, height / 2, 30);
  ghost = new Ghost(width - 50, height / 2, 40);
  dot = new Dot(50, height / 2, 30);
  start = new SoundFile(this, "start.mp3");
  waka = new SoundFile(this, "waka.mp3");
  lose = new SoundFile(this, "lose.mp3");
  win = new SoundFile(this, "win.mp3");
  start.play(); //Plays the "start" sound effect when the game is started.
}


void draw() {
  background(0);
  if (keyPressed) { //Controls for Pac-Man.
    if (key == 'a') {
      player.move(-2, 0);
    } else if (key == 'd') {
      player.move(2, 0);
    } else if (key == 'w') {
      player.move(0, -2);
    } else if (key == 's') {
      player.move(0, 2);
    }
  }



  player.display(); //Behavior for if the ghost catches Pac-Man.
  if(caught == false){
  ghost.display();}
if(caught == true){
textSize(32);
    fill(255);
    text("Game Over...", width / 2 - 100, height / 2);} //Makes text appear when the ghost catches Pac-Man.
  if (player.collidesWith(ghost)) {
    if (lose.isPlaying()) { //Plays the "lose" sound effect when Pac-Man is caught.
      println("File is still playing after seconds");
    } else {
      lose.play();
      caught = true; //Activates the caught state for the game.
      player.x = -1000; //Code to make both the player and ghost dissapear.
      
    }
  }  
}