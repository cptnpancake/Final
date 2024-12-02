//This pde file has code for the game behavior itself.

import processing.sound.*;

SoundFile sound;
Character player;
Fruit fruit;
Fruit2 fruit2;


void setup() { //Placements for Pac-Man and the fruits on the screen. Code for loading the sound effect in is also here.
  size(400, 400);
  player = new Character(50, height / 2, 30);
  fruit = new Fruit(width - 50, height / 1.5, 40);
  fruit2 = new Fruit2(width - 50, height / 5, 40);
  sound = new SoundFile(this, "sound.mp3");
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

  player.display(); //Behavior for when the strawberry is eaten.
  if(notEaten1 == false){
  fruit.display();}
if(notEaten1 == true){
textSize(32);
    fill(255);
    text("Yummy!", width / 2 - 100, height / 2);} //Makes unique text appear when this specific fruit is eaten.
  if (player.collidesWith(fruit)) {
    if (sound.isPlaying()) { //Plays the sound effect when the fruit is eaten.
      println("File is still playing after seconds");
    } else {
      sound.play();
      notEaten1 = true; //Activates the notEaten1 state for this specific fruit.
      fruit.x = -1000; //Code to make the fruit dissapear.
      
    }
  }
  if(notEaten2 == false){ //Behavior for when the orange is eaten.
  fruit2.display();}
if(notEaten2 == true){
textSize(32);
    fill(255);
    text("Tasty!", width / 2 - 100, height / 5);} //Makes unique text appear when this specific fruit is eaten.
  if (player.collidesWith(fruit2)) {
    if (sound.isPlaying()) { //Plays the sound effect when the fruit is eaten.
      println("File is still playing after seconds");
    } else {
      sound.play();
      notEaten2 = true; //Activates the notEaten2 state for this specific fruit.
      fruit2.x = -1000; //Code to make the fruit dissapear.
      
    }
  }
  
}