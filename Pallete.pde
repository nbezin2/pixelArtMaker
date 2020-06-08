class Pallete {
  private int xPos, yPos, radi=40,s1=20,s2=20,s3=20;
  private float r=255,g=255,b=255;
  
  Pallete(int xPos, int yPos) {
    this.xPos = xPos;
    this.yPos = yPos;
  }
  
  void setS1(int s1) {
    this.s1 = s1;
  }
  
  void setS2(int s2) {
    this.s2 = s2;
  }
  
  void setS3(int s3) {
    this.s3 = s3;
  }
  
  int getS1() {
    return this.s1;
  }
  
  int getS2() {
    return this.s2;
  }
  
  int getS3() {
    return this.s3;
  }
  
  void setR(float r) {
    this.r = r;
  }
  
  void setB(float b) {
    this.b = b;
  }
  
  void setG(float g) {
    this.g = g;
  }
  
  float getR() {
    return this.r;
  }
  
  float getG() {
    return this.g;
  }
  
  float getB() {
    return this.b;
  }
  
  void show() {
    stroke(0);
    fill(r,g,b);
    ellipse(this.xPos, this.yPos, this.radi, this.radi);
  }
}
