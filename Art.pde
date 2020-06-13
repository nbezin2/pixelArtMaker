class Art {
  //ArrayList<Pix> artWork = new ArrayList<Pix>();
  private int artWidth = 80;
  private int artHeight = 55;
  
  private Pix[][] artWork = new Pix[artWidth][artHeight]; 
  
  Art() {}
  
  Pix[][] getArtW() {
    return this.artWork;
  }
  
  int getHeight() {
    return this.artHeight;
  }
  
  int getWidth() {
    return this.artWidth;
  }
  
  void addPix(int x, int y) {
    Pix nP = new Pix(x,y);
    print(x);
    print(",");
    println(y);
    
    artWork[(x/10)-10][(y/10)-5] = nP;
  }
  
  void clearArt() {
    for(int i=0; i<this.artWidth; i++) {
      for (int j=0; j<this.artHeight; j++) {
        if (artWork[i][j] != null) {
          artWork[i][j] = null;
        }
      }
    }
  }
  
  void removeSPix(int x, int y) {
    print(x);
    print(",");
    println(y);
    if (artWork[(x/10)-10][(y/10)-5] != null) {
      artWork[(x/10)-10][(y/10)-5] = null;
    }
    
  }
  
  
  void displayArt() {
    for (int i=0;i<artWidth;i++) {
      for (int j=0;j<artHeight;j++) {
        if (artWork[i][j] != null) {
          artWork[i][j].displayPix();
        }
      }
    }
  }
}
