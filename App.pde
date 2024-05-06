class App {
    Page[] pages;
    int pageNum;
    
    static final int TITLE_PAGE_NUM = 0;
    static final int PLAY_PAGE_NUM = 1;
    static final int GAMEOVER_PAGE_NUM = 2;
    static final int GAMECLEAR_PAGE_NUM = 3;

    App() {
        pageNum = 0;
        pages = new Page[] {
            new PageTitle(),
            new PagePlay(),
            new PageGameOver(),
            new PageGameClear(),
        };
    }

    void run() {
        pages[pageNum].draw();
    }

    void changePage(int n) {
        pageNum = constrain(n, 0, pages.length-1);
        pages[pageNum].setup();
    }

    void keyPressed() {
        // デバッグ用で矢印キーでページ切り替えができる
        if (keyCode == RIGHT) {
            changePage(pageNum+1 >= pages.length ? 0 : pageNum+1);
        } else if (keyCode == LEFT) {
            changePage(pageNum-1 < 0 ? pages.length-1 : pageNum-1);
        }
        pages[pageNum].keyPressed();
    }

    void keyReleased() {
        pages[pageNum].keyReleased();
    }

    void mousePressed() {
        pages[pageNum].mousePressed();
    }
}
