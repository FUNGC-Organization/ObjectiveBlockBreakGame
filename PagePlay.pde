class PagePlay implements Page {
    Ball ball;
    Racket racket;
    Blocks blocks;

    PagePlay() {
    }

    void setup() {
        ball = new Ball(width/2.0, 2*height/3.0, 3, 3);
        racket =  new Racket(width/2.0, height - 30);
        blocks = new Blocks(7, 10);
        blocks.setup();
    }

    void draw() {
        ball.draw();
        ball.update();
        if (ball.checkHitRacket(racket.getPos(), racket.getWidth())) {
            ball.reflectionVertical();
        }
        racket.draw();
        racket.update();
        blocks.draw();
        switch(blocks.ballHitBlock(ball)) {
        case Blocks.HIT_VERTICAL:
            ball.reflectionVertical();
            break;
        case Blocks.HIT_HORIZONTAL:
            ball.reflectionHorizontal();
            break;
        }
        if (ball.isGameOver()) {
            app.changePage(App.GAMEOVER_PAGE_NUM);
        }
        if (blocks.isGameClear()) {
            app.changePage(App.GAMECLEAR_PAGE_NUM);
        }
    }

    void keyPressed() {
    }

    void keyReleased() {
    }

    void mousePressed() {
    }
}
