class Slider {
  int xPos, yPos;
  
  Slider(int x,int y) {
    this.xPos = x;
    this.yPos = y;
  }
  
  void show() {
    stroke(0);
    fill(255);
    rect(xPos, yPos, 10,5);
  }
  
  int getY() {
    return this.yPos;
  }
  
  void move(int y){
    if (y >= 20 && y <= 115) {
      this.yPos=y;
    }  
  }
  
}
