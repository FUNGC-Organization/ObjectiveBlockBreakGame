class Blocks {
    int colNum, rowNum;
    float blockWidth, blockHeight;

    int[][] blocks;

    Blocks(int colNum, int rowNum) {
        this.colNum = colNum;
        this.rowNum = rowNum;
        this.blockWidth = width/colNum;
        this.blockHeight = (height/2.0) / rowNum;
        this.blocks = new int[rowNum][colNum];
    }

    void setup() {
        for (int i=0; i<rowNum; i++) {
            for (int j=0; j<colNum; j++) {
                blocks[i][j] = 1;
            }
        }
    }

    void draw() {
        for (int i=0; i<rowNum; i++) {
            for (int j=0; j<colNum; j++) {
                if (blocks[i][j] == 1) {
                    fill(150);
                    rect(j*blockWidth, i*blockHeight, blockWidth, blockHeight);
                }
            }
        }
    }

    boolean removeHitBlock(PVector ballPos, int ballSize) {
        for (int i=0; i<rowNum; i++) {
            for (int j=0; j<colNum; j++) {
                if (blocks[i][j] == 1 && ballHitBlock(ballPos, ballSize, j*blockWidth, i*blockHeight)) {
                    blocks[i][j] = 0;
                    return true;
                }
            }
        }
        return false;
    }

    boolean ballHitBlock(PVector ballPos, int ballSize, float blockX, float blockY) {
        float ballTop = ballPos.y - ballSize/2.0;
        float ballBottom = ballPos.y + ballSize/2.0;
        float ballLeft = ballPos.x + ballSize/2.0;
        float ballRight = ballPos.x - ballSize/2.0;
        return (
            (
            (blockY <= ballTop && ballTop <= blockY + blockHeight) ||
            (blockY <= ballBottom && ballBottom <= blockY + blockHeight)
            ) &&
            (
            (blockX <= ballLeft && ballLeft <= blockX + blockWidth) ||
            (blockX <= ballRight && ballRight <= blockX + blockWidth)
            )
            );
    }
}
