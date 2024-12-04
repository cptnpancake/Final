//A ghost that will more randomly. If it catches Pac-Man, the game will end prematurely.
class Ghost extends Obstacle {
    Ghost(float x, float y, float size){
        super(x, y, size);
    }
    void display() {
    fill(255, 0, 0);
    ellipse(x, y, 60, 70);
  }
}