class Art {
  //ArrayList<Pix> artWork = new ArrayList<Pix>();
  Pix[][] artWork = new Pix[80][55]; 
  
  Art() {}
  
  void addPix(int x, int y) {
    Pix nP = new Pix(x,y);
    print(x);
    print(",");
    println(y);
    
    artWork[(x/10)-10][(y/10)-5] = nP;
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
    for (int i=0;i<80;i++) {
      for (int j=0;j<55;j++) {
        if (artWork[i][j] != null) {
          artWork[i][j].displayPix();
        }
      }
    }
  }
}
