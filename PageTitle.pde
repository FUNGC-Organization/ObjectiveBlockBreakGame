class PageTitle implements Page {
    PageTitle() {   
    }
    
    void setup() {
    }
    
    void draw() {
        fill(255);
        textSize(25);
        textAlign(CENTER, CENTER);
        text("Click To Start!", width/2.0, height/2.0);
    }
    
    void keyPressed() {
        
    }
    
    void keyReleased() {
        
    }
    
    void mousePressed() {
        app.changePage(App.PLAY_PAGE_NUM);
    }
}
