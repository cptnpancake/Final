//An orange titled "Fruit2" to make it seperate from the strawberry.
class Fruit2 extends Obstacle {
    Fruit2(float x, float y, float size){
        super(x, y, size);
    }
    void display() {
    fill(0, 255, 0);
    ellipse(x , y + -10, 20, size);
    fill(255, 69, 0);
    ellipse(x, y, 60, 50);
    //The "y + -10" is to make sure the stem matches the position of the fruit when placing it with the void setup in Game2.pde
  }
}