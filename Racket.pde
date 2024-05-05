class Racket {
    PVector pos;
    final int RACKET_WIDTH = 100;
    final int RACKET_HEIGHT = 20;

    Racket(float x, float y) {
        pos = new PVector(x, y);
    }

    void draw() {
        fill(50, 200, 150);
        rect(pos.x, pos.y, RACKET_WIDTH, RACKET_HEIGHT);
    }
    
    void update() {
        racketFollowMouse();
    }
    
    void racketFollowMouse() {
        pos.x = constrain(mouseX - RACKET_WIDTH/2.0, 0, width - RACKET_WIDTH);
    }
    
    PVector getPos() {
         return pos;   
    }
    
    int getWidth() {
         return RACKET_WIDTH;   
    }
}
