class PageGameOver implements Page {
    PageGameOver() {   
    }
    
    void setup() {
    }
    
    void draw() {
        textSize(25);
        textAlign(CENTER, CENTER);
        fill(255, 50, 50);
        text("Game Over", width/2.0, height/2.0 - 20);
        fill(255);
        text("Click To Title", width/2.0, height/2.0 + 20);
    }
    
    void keyPressed() {
        
    }
    
    void keyReleased() {
        
    }
    
    void mousePressed() {
        app.changePage(App.TITLE_PAGE_NUM);
    }
}
