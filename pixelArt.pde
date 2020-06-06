

int grid, grSlider, mode;
boolean locked;
Art art1;
Color pC;
Slider rS,gS,bS;


void setup() {
  size(900,600);
  background(255);
  frameRate(100);
  
  art1=new Art();
  pC=new Color();
  rS=new Slider(20,115);
  gS=new Slider(45,115);
  bS=new Slider(70,115);
  grid = 0;
  grSlider = 0;
  locked = false;
  mode = 0;
}


void draw() {
  clear();
  background(255);
  if (grid == 1) {
    drawGrid();
  }
  UIButtons();
  art1.displayArt();
}

void UIButtons() {
  stroke(0);
  fill(75);
  rect(0,0, 100, height);
  stroke(0);
  fill(150);
  rect(100,0, 100, 50);
  stroke(0);
  fill(150);
  rect(200,0, 100, 50);
  stroke(0);
  fill(150);
  rect(300,0, 100, 50);
  
  
  //color & slider stuff
  line(25,20,25,120);
  line(50,20,50,120);
  line(75,20,75,120);
  
  rS.show();
  gS.show();
  bS.show();
  
  stroke(0);
  fill(255,0,0);
  rect(20,130,10,10);
  fill(0,255,0);
  rect(45,130,10,10);
  fill(0,0,255);
  rect(70,130,10,10);
  
  stroke(0);
  fill(pC.r,pC.g,pC.b);
  ellipse(50,300,80,80);
  
}

void mousePressed() {
  int xPos=mouseX, yPos=mouseY;
  if (mouseY > 50 && mouseX > 100) {
    if (mode == 0) { //Draw Mode
      for (int i=xPos;i%10!=0;i--) {
        xPos=i;
      }
      if (xPos%10 != 0) {
        xPos--;
      }
      
      for (int i=yPos;i%10!=0;i--) {
        yPos=i;
      }
      if (yPos%10 != 0) {
        yPos--;
      }
      art1.addPix(xPos, yPos);
    }
    else if (mode == 1) { //Eraser Mode
      for (int i=xPos;i%10!=0;i--) {
        xPos=i;
      }
      if (xPos%10 != 0) {
        xPos--;
      }
      
      for (int i=yPos;i%10!=0;i--) {
        yPos=i;
      }
      if (yPos%10 != 0) {
        yPos--;
      }
      art1.removeSPix(xPos, yPos);
    
    }
  }
  else if (mouseX <= 100) {
    if (mouseX >= rS.xPos && mouseX <= rS.xPos+10 && mouseY >= rS.yPos && mouseY <= rS.yPos + 5) {
      locked=true;
      grSlider=1;
    }
    else if (mouseX >= gS.xPos && mouseX <= gS.xPos+10 && mouseY >= gS.yPos && mouseY <= gS.yPos + 5) {
      locked=true;
      grSlider=2;
    }
    else if (mouseX >= bS.xPos && mouseX <= bS.xPos+10 && mouseY >= bS.yPos && mouseY <= bS.yPos + 5) {
      locked=true;
      grSlider=3;
    }
  }
  else if (mouseX > 100 && mouseX < 200) {
    if (grid == 0) {
      grid = 1;
    }
    else {
      grid = 0;
    }
    
  }
  else if (mouseX > 200 && mouseX < 300) {
    clear();
    background(255);
    if (grid == 4) {
      drawGrid();
      UIButtons();
    }
  }
  else if (mouseX > 300 && mouseX < 400) {
    if (mode==0) {
      mode = 1;
    }
    else {
      mode = 0;
    } 
  }
}

void mouseDragged() {
  if (locked) {
    if (grSlider == 1) {
      rS.move(mouseY);
      pC.r= map(rS.yPos, 115, 20, 0, 255);
    }
    else if (grSlider == 2) {
      gS.move(mouseY);
      pC.g= map(gS.yPos, 115, 20, 0, 255);
    }
    else if (grSlider == 3) {
      bS.move(mouseY);
      pC.b= map(bS.yPos, 115, 20, 0, 255);
    }
  }
  
  if (mouseY > 50 && mouseX > 100 && mouseX < 900 && mouseY < 600) {
    int xPos = mouseX, yPos = mouseY;
    for (int i=xPos;i%10!=0;i--) {
      xPos=i;
    }
    if (xPos%10 != 0) {
      xPos--;
    }
      
    for (int i=yPos;i%10!=0;i--) {
      yPos=i;
    }
    if (yPos%10 != 0) {
      yPos--;
    }
    
    if (mouseX != width || mouseY != height) {
      if (mode == 0) {
        art1.addPix(xPos, yPos);
      }
      else if (mode == 1) {
        art1.removeSPix(xPos, yPos);
       
      }
    }
  }
}

void mouseReleased() {
  locked = false;
  grSlider = 0;
}

void drawGrid() {
  for (int y=0;y<height;y++) {
      if(y%10==0 || y%10==0) {
        stroke(100);
        line(0,y,width,y);
      } 
    }
    
    for (int x=0;x<width;x++) {
      if(x%10==0 || x%10==0) {
        stroke(100);
        line(x,0,x,height);
      } 
    }
}
