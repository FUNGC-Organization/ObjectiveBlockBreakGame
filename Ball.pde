class Ball {
    private PVector pos, vec;
    private final int BALL_SIZE = 30;

    Ball(float x, float y, float vx, float vy) {
        pos = new PVector(x, y);
        vec = new PVector(vx, vy);
    }

    void draw() {
        fill(200, 200, 100);
        circle(pos.x, pos.y, BALL_SIZE);
    }

    void update() {
        move();
        reflectionWall();
    }

    void move() {
        pos.add(vec);
    }

    void reflectionWall() {
        if (checkHitSideWall()) {
            vec.x = -vec.x;
        }
        if (checkHitTopWall()) {
            vec.y = -vec.y;
        }
    }

    void reflectionVertical() {
        vec.y = -vec.y;
    }

    void reflectionHorizontal() {
        vec.x = -vec.x;
    }

    boolean checkHitSideWall() {
        return pos.x-BALL_SIZE/2.0 <= 0 || width <= pos.x + BALL_SIZE/2.0;
    }

    boolean checkHitTopWall() {
        return pos.y - BALL_SIZE/2.0 <= 0;
    }

    boolean checkHitRacket(PVector racketPos, int racketWidth) {
        return (
            (racketPos.x <= pos.x && pos.x <= racketPos.x + racketWidth) &&
            (racketPos.y <= pos.y + BALL_SIZE/2.0 && pos.y + BALL_SIZE/2.0 <= racketPos.y+abs(vec.y))
            );
    }

    PVector getPos() {
        return pos;
    }

    int getSize() {
        return BALL_SIZE;
    }
}
