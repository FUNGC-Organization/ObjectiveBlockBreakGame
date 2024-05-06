App app;

void setup() {
    size(400, 600);
    app = new App();
}

void draw() {
    background(0);
    app.run();
}

void keyPressed() {
    app.keyPressed();
}

void keyReleased() {
    app.keyReleased();
}

void mousePressed() {
    app.mousePressed();
}
