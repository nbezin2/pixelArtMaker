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
  
  Pix(int x, int y, float r, float g, float b) {
    this.xPos=x;
    this.yPos=y;
    this.c.r=r;
    this.c.g=g;
    this.c.b=b;
  }
  
  float getR() {
    return this.c.r;
  }
  float getG() {
    return this.c.g;
  }
  float getB() {
    return this.c.b;
  }
  
  void setRGB(float r, float g, float b) {
    this.c.r = r;
    this.c.g = g;
    this.c.b = b;
  }
  
  void displayPix() {
    stroke(c.r,c.g,c.b);
    fill(c.r,c.g,c.b);
    rect(xPos, yPos, 10, 10);
  }
}
