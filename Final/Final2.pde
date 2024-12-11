//This pde file has code for the game behavior itself.

import processing.sound.*;

Character player;
Ghost ghost;
Dot dot1;
Dot dot2;
Dot dot3;
Dot dot4;
SoundFile start; //Sound for starting the game.
SoundFile waka; //Sound for eating dots.
SoundFile lose; //Sound if the ghost catches Pac-Man.
SoundFile win; //Sound if Pac-Man successfully eats all dots.



//Placements for Pac-Man, ghost, and dots on the screen. Codes for loading the sound effects in are also here.
void setup() {
  size(800, 600);
  player = new Character(50, height / 2, 30);
  ghost = new Ghost(width - 50, height / 2, 40);
  dot1 = new Dot(600, height / 3, 40);
  dot2 = new Dot(200, height / 3, 40);
  dot3 = new Dot(600, height / 1.5, 60);
  dot4 = new Dot(200, height / 1.5, 60);
  start = new SoundFile(this, "start.mp3");
  waka = new SoundFile(this, "waka.mp3");
  lose = new SoundFile(this, "lose.mp3");
  win = new SoundFile(this, "win.mp3");
  start.play(); //Plays the "start" sound effect when the game is started.
}


void draw() {
  background(0);
  //Controls for Pac-Man and the ghost. The ghost moves slightly faster than Pac-Man.
  if (keyPressed) {
    if (key == 'a') {
      player.move(-2, 0);
      ghost.move(3, 0);
    } else if (key == 'd') {
      player.move(2, 0);
      ghost.move(-3, 0);
    } else if (key == 'w') {
      player.move(0, -2);
      ghost.move(0, -2.5);
    } else if (key == 's') {
      player.move(0, 2);
      ghost.move(0, 2.5);
    }
  }

 

  player.display();
  //Behavior for if the ghost catches Pac-Man.
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
  //Following behaviors for when Pac-Man eats the dots.
   if(chomp1 == false){
  dot1.display();}
if(chomp1 == true){
dot1.x = -1000;} 
  if (player.collidesWith(dot1)) {
    if (waka.isPlaying()) { //Plays the "waka" sound effect when Pac-Man eats the dot.
      println("File is still playing after seconds");
    } else {
      waka.play();
      chomp1 = true; //Activates the chomp state for the game.
}
}
if(chomp2 == false){
  dot2.display();}
if(chomp2 == true){
dot2.x = -1000;} 
  if (player.collidesWith(dot2)) {
    if (waka.isPlaying()) {
      println("File is still playing after seconds");
    } else {
      waka.play();
      chomp2 = true; 
}
  }
  if(chomp3 == false){
  dot3.display();}
if(chomp3 == true){
dot3.x = -1000;} 
  if (player.collidesWith(dot3)) {
    if (waka.isPlaying()) { 
    } else {
      waka.play();
      chomp3 = true;
}
  }
  if(chomp4 == false){
  dot4.display();}
if(chomp4 == true){
dot4.x = -1000;} 
  if (player.collidesWith(dot4)) {
    if (waka.isPlaying()) {
      println("File is still playing after seconds");
    } else {
      waka.play();
      chomp4 = true;
}
  }
  //Behavior for when all dots are eaten and the player wins the game.
  if(chomp1 == true & chomp2 == true & chomp3 == true & chomp4 == true){
    textSize(32);
    fill(255);
    text("You Win!", width / 2 - 100, height / 2);
    player.x = -1000;
    ghost.y = -1000;
    if(win.isPlaying()){
      println("File is still playing after seconds");
    } else {
win.play();
    }
  }
}