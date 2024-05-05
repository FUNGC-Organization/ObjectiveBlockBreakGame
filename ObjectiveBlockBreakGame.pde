Ball ball;
Racket racket;
Blocks blocks;

void setup() {
    size(400, 600);
    ball = new Ball(width/2.0, 2*height/3.0, 3, 3);
    racket =  new Racket(width/2.0, height - 30);
    blocks = new Blocks(5, 6);
    blocks.setup();
}

void draw() {
    background(0);
    ball.draw();
    ball.update();
    if(ball.checkHitRacket(racket.getPos(), racket.getWidth())) {
        ball.reflectionVertical();
    }
    racket.draw();
    racket.update();
    blocks.draw();
    if(blocks.removeHitBlock(ball.getPos(), ball.getSize())) {
           ball.reflectionVertical();
    }
}
