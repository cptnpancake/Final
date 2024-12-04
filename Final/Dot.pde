//The dots that, when collected, will generate a shape in the background. The goal of the game is to eat all dots.
class Dot extends Collectible {
    Dot(float x, float y, float size){
        super(x, y, size);
    }
    void display() {
    fill(253, 183, 150);
    ellipse(x, y, 30, 30);
  }
}