class Blocks {
    static final int HIT_NONE = 0;
    static final int HIT_VERTICAL = 1;
    static final int HIT_HORIZONTAL = 2;

    Block[][] blocks;

    Blocks(int colNum, int rowNum) {
        this.blocks = new Block[rowNum][colNum];
        setup();
    }

    void setup() {
        int rowNum = blocks.length;
        for (int i = 0; i < rowNum; i++) {
            int colNum = blocks[i].length;
            for (int j = 0; j < colNum; j++) {
                float blockWidth = width/colNum;
                float blockHeight = (height/2.0)/rowNum;
                blocks[i][j] = new Block(j*blockWidth, i*blockHeight, blockWidth, blockHeight, true);
            }
        }
    }

    void draw() {
        for (Block[] _blocks : blocks) {
            for (Block block : _blocks) {
                if (block.getIsActive()) {
                    block.draw();
                }
            }
        }
    }

    int ballHitBlock(Ball ball) {
        int rowNum = blocks.length;
        for (int i = 0; i < rowNum; i++) {
            int colNum = blocks[i].length;
            for (int j = 0; j < colNum; j++) {
                int hitPosition = blocks[i][j].whereHitBall(ball);
                if (hitPosition != Blocks.HIT_NONE) {
                    blocks[i][j].isActive = false;
                    return hitPosition;
                }
            }
        }
        return HIT_NONE;
    }
    
    boolean isGameClear() {
        for(Block[] _blocks : blocks) {
             for(Block block : _blocks) {
                 if(block.isActive)
                     return false;
             }
        }
        return true;
    }
}
