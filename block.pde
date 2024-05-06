class Block {
    private float w, h;
    private float x, y;
    public boolean isActive;

    Block(float x, float y, float w, float h, boolean isActive) {
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.isActive = isActive;
    }

    void draw() {
        fill(150);
        rect(x, y, w, h);
    }

    boolean getIsActive() {
        return isActive;
    }

    float getX() {
        return x;
    }

    float getY() {
        return y;
    }

    int whereHitBall(Ball ball) {
        if(!isActive) return Blocks.HIT_NONE;
        
        float ballTop = ball.getPos().y - ball.getSize()/2.0;
        float ballBottom = ball.getPos().y + ball.getSize()/2.0;
        float ballLeft = ball.getPos().x - ball.getSize()/2.0;
        float ballRight = ball.getPos().x + ball.getSize()/2.0;

        boolean isHitBallTop = (y <= ballTop && ballTop <= y + h);
        boolean isHitBallBottom = (y <= ballBottom && ballBottom <= y + h);
        boolean isHitBallLeft = (x <= ballLeft && ballLeft <= x + w);
        boolean isHitBallRight = (x <= ballRight && ballRight <= x + w);
        // ボールの中心のy座標の当たり判定
        boolean isHitBallCenterY = (y <= ball.getPos().y && ball.getPos().y <= y + h);
        // ボールの中心のx座標の当たり判定
        boolean isHitBallCenterX = (x <= ball.getPos().x && ball.getPos().x <= x + w);

        // ブロックの上か下に当たった
        if (isHitBallCenterX && (isHitBallTop || isHitBallBottom)) {
            return Blocks.HIT_VERTICAL;
        } else if (isHitBallCenterY && (isHitBallLeft || isHitBallRight)) {
            return Blocks.HIT_VERTICAL;
        } else {
            return Blocks.HIT_NONE;
        }
    }
}
