class Pix {
  int xPos, yPos;
  Color c = new Color();
  
  Pix(int x, int y) {
    this.xPos=x;
    this.yPos=y;
    this.c.r=pC.r;
    this.c.g=pC.g;
    this.c.b=pC.b;
  }
  
  void displayPix() {
    stroke(c.r,c.g,c.b);
    fill(c.r,c.g,c.b);
    rect(xPos, yPos, 10, 10);
  }
}
