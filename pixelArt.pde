int grid, grSlider, mode, palMode, prevMode, artNum;
String palModeText, modeText, fileName;
boolean locked;
ArrayList<Art> allArt;
File artFolder;
Art art1,copyPage;
Color pC;
Slider rS, gS, bS;
Pallete pal1, pal2, pal3, pal4, pal5, pal6;

void setup() {
  size(900, 600);
  background(255);
  frameRate(100);
  allArt = new ArrayList<Art>();
  art1=new Art();
  copyPage=new Art();
  allArt.add(art1);
  pC=new Color();
  rS=new Slider(20, 115);
  gS=new Slider(45, 115);
  bS=new Slider(70, 115);
  pal1=new Pallete(25, 265);
  pal2=new Pallete(75, 265);
  pal3=new Pallete(25, 310);
  pal4=new Pallete(75, 310);
  pal5=new Pallete(25, 355);
  pal6=new Pallete(75, 355);
  grid = 0;
  grSlider = 0;
  locked = false;
  prevMode = 0;
  mode = 0;
  palMode = 1;
  artNum = 0;
  palModeText = "Set Pallete";
  modeText = "Draw";
  fileName = "";
}

void draw() {
  clear();
  background(255);
  if (grid == 1) {
    drawGrid();
  }
  allArt.get(artNum).displayArt();//Figure this out
  UIButtons();
}

void UIButtons() {
  stroke(0);
  fill(75);
  rect(0, 0, 100, height);
  stroke(0);
  fill(150);
  rect(100, 0, 100, 50);
  fill(0);
  textSize(35);
  text("Grid", 115, 40);

  stroke(0);
  fill(150);
  rect(200, 0, 100, 50);
  fill(0);
  text("Clear", 205, 40);

  stroke(0);
  fill(150);
  rect(300, 0, 100, 50);
  fill(0);
  text(modeText, 305, 40);

  stroke(0);
  fill(150);
  rect(400, 0, 100, 50);
  fill(0);
  textSize(25);
  text("Add Art", 405, 40);

  fill(150);
  rect(500,0,100,50);
  fill(0);
  textSize(19);
  text("Delete Art", 505, 40);
  
  fill(150);
  rect(600,0,100,50);
  fill(0);
  textSize(19);
  text("Copy Art", 605, 40);
  
  fill(150);
  rect(700,0,100,50);
  fill(0);
  textSize(19);
  text("Paste Art", 705, 40);
  
  fill(150);
  rect(800,0,100,50);
  fill(0);
  textSize(19);
  text("Save", 805, 40);
  
  //color & slider stuff
  line(25, 20, 25, 120);
  line(50, 20, 50, 120);
  line(75, 20, 75, 120);

  rS.show();
  gS.show();
  bS.show();

  stroke(0);
  fill(255, 0, 0);
  rect(20, 130, 10, 10);
  fill(0, 255, 0);
  rect(45, 130, 10, 10);
  fill(0, 0, 255);
  rect(70, 130, 10, 10);

  stroke(0);
  fill(pC.r, pC.g, pC.b);
  ellipse(50, 200, 80, 80);
  pal1.show();
  pal2.show();
  pal3.show();
  pal4.show();
  pal5.show();
  pal6.show();

  stroke(0);
  fill(150);
  rect(10, 380, 80, 30);
  fill(0);
  textSize(12);
  text(palModeText, 20, 400);
  
  stroke(0);
  fill(150);
  rect(5,height-45,40,40);
  rect(55, height-45,40,40);
  fill(0);
  triangle(10,height-25,40,height-40,40,height-10);
  triangle(90,height-25,60,height-40,60,height-10);
  
  if (mode == 2) {
    stroke(0);
    fill(150);
    rect((width/2)-200, (height/2)-100, 400, 200);
    fill(175);
    rect((width/2)-150, (height/2)+25, 100, 50);
    rect((width/2)+50, (height/2)+25, 100, 50);
    fill(0);
    textSize(25);
    text("Yes", (width/2)-123, (height/2)+60);
    text("No", (width/2)+83, (height/2)+60);
    textSize(15);
    text("Are you sure you want to clear this current", (width/2)-160, (height/2)-50);
    text("frame of art?", (width/2)-50, (height/2)-35);
  }
  
  if (mode == 3) {
    stroke(0);
    fill(150);
    rect((width/2)-200, (height/2)-100, 400, 200);
    fill(175);
    rect((width/2)-150, (height/2)+25, 100, 50);
    rect((width/2)+50, (height/2)+25, 100, 50);
    fill(0);
    textSize(25);
    text("Yes", (width/2)-123, (height/2)+60);
    text("No", (width/2)+83, (height/2)+60);
    textSize(15);
    text("Are you sure you want to delete this current", (width/2)-160, (height/2)-50);
    text("frame of art?", (width/2)-50, (height/2)-35);
  }
  
  if (mode == 4) {
    nameArt();
  }
  else if (mode == 5) {
    PImage pixelArt = get(101,51,width,height);
    pixelArt.save(artFolder+"/"+fileName+".png");
    fileName = "";
    mode = prevMode;
  }
}

void nextFrame() {
  if (artNum < allArt.size()-1) {
    artNum++;
  }
}

void prevFrame() {
  if (artNum > 0) {
    artNum--;
  }
}

void deleteArtFrame() {
  allArt.remove(artNum);
  if (allArt.size()>=1) {
    if (artNum == allArt.size()) {
      artNum--;
    }
  }
  else {
    allArt.add(new Art());
  }
}

void copyArt() {
  copyPage = allArt.get(artNum); //pointers pointing at same art
}

void pasteArt(Art art1,Art art2) {
  //clear current art
  art1.clearArt();
  
  //Loop through each pix of copyPage and set current art pix to equal
  for (int i=0;i<art1.getWidth();i++) {
    for (int j=0;j<art1.getHeight();j++) {
      if (art2.getArtW()[i][j] != null) {
        art1.copyPix(art2, i,j);
      }
    }
  }
  //Reset copyPage to Empty
  //copyPage = new Art(); //keep the image that was copied without this line
}

void addArtFrame() {
  allArt.add(new Art());
  artNum = allArt.size()-1;
}

void mousePressed() {
  int xPos=mouseX, yPos=mouseY;
  if (mode < 2) {
    //Drawing Space Functions Below
    if (mouseY > 50 && mouseX > 100) {
      if (mode == 0) { //Draw Mode
        for (int i=xPos; i%10!=0; i--) {
          xPos=i;
        }
        if (xPos%10 != 0) {
          xPos--;
        }

        for (int i=yPos; i%10!=0; i--) {
          yPos=i;
        }
        if (yPos%10 != 0) {
          yPos--;
        }
        allArt.get(artNum).addPix(xPos, yPos);
      } else if (mode == 1) { //Eraser Mode
        for (int i=xPos; i%10!=0; i--) {
          xPos=i;
        }
        if (xPos%10 != 0) {
          xPos--;
        }

        for (int i=yPos; i%10!=0; i--) {
          yPos=i;
        }
        if (yPos%10 != 0) {
          yPos--;
        }
        allArt.get(artNum).removeSPix(xPos, yPos);
      }
    //Left SideBar Buttons/Tools Below
    } else if (mouseX <= 100) {
      if (mouseX >= rS.xPos && mouseX <= rS.xPos+10 && mouseY >= rS.yPos && mouseY <= rS.yPos + 5) { //Red Slider Functions
        locked=true;
        grSlider=1;
      } else if (mouseX >= gS.xPos && mouseX <= gS.xPos+10 && mouseY >= gS.yPos && mouseY <= gS.yPos + 5) { //Green Slider Funtions
        locked=true;
        grSlider=2;
      } else if (mouseX >= bS.xPos && mouseX <= bS.xPos+10 && mouseY >= bS.yPos && mouseY <= bS.yPos + 5) { //Blue Slider Functions
        locked=true;
        grSlider=3;
      } else if (mouseX >= 10 && mouseX <= 90 && mouseY >= 380 && mouseY <= 410) { //Toggle Set/Use Pallete Functionality Button
        if (palMode == 0) {
          palMode = 1;
          palModeText = "Set Pallete";
        } else {
          palMode = 0;
          palModeText = "Use Pallete";
        }
      } else if (mouseX>=5 && mouseX<=45 && mouseY>=height-45 && mouseY<=height-5) { //Back Arrow Button
        prevFrame();
      } else if (mouseX>=55 && mouseX<=95 && mouseY>=height-45 && mouseY<=height-5) { //Forward Arrow Button
        nextFrame();
      } else if (mouseX >= 5 && mouseX <= 45) { //Left Column of Pallete Circles
        //Use Mode Functionality
        if (palMode == 0) {
          if (mouseY >= 245 && mouseY <= 285) {
            rS.move(pal1.getS1());
            pC.r= map(rS.yPos, 115, 20, 0, 255);
            gS.move(pal1.getS2());
            pC.g= map(gS.yPos, 115, 20, 0, 255);
            bS.move(pal1.getS3());
            pC.b= map(bS.yPos, 115, 20, 0, 255);
          } else if (mouseY >= 290 && mouseY <= 330) {
            rS.move(pal3.getS1());
            pC.r= map(rS.yPos, 115, 20, 0, 255);
            gS.move(pal3.getS2());
            pC.g= map(gS.yPos, 115, 20, 0, 255);
            bS.move(pal3.getS3());
            pC.b= map(bS.yPos, 115, 20, 0, 255);
          } else if (mouseY >= 335 && mouseY <= 375) {
            rS.move(pal5.getS1());
            pC.r= map(rS.yPos, 115, 20, 0, 255);
            gS.move(pal5.getS2());
            pC.g= map(gS.yPos, 115, 20, 0, 255);
            bS.move(pal5.getS3());
            pC.b= map(bS.yPos, 115, 20, 0, 255);
          }
        //Set Mode Functionality
        } else {
          if (mouseY >= 245 && mouseY <= 285) {
            pal1.setR(pC.r);
            pal1.setS1(rS.getY());
            pal1.setG(pC.g);
            pal1.setS2(gS.getY());
            pal1.setB(pC.b);
            pal1.setS3(bS.getY());
          } else if (mouseY >= 290 && mouseY <= 330) {
            pal3.setR(pC.r);
            pal3.setS1(rS.getY());
            pal3.setG(pC.g);
            pal3.setS2(gS.getY());
            pal3.setB(pC.b);
            pal3.setS3(bS.getY());
          } else if (mouseY >= 335 && mouseY <= 375) {
            pal5.setR(pC.r);
            pal5.setS1(rS.getY());
            pal5.setG(pC.g);
            pal5.setS2(gS.getY());
            pal5.setB(pC.b);
            pal5.setS3(bS.getY());
          }
        }
      } else if (mouseX >= 55 && mouseX <= 95) { //Right Column of Pallete Circles
        //Use Mode Functionality
        if (palMode == 0) {
          if (mouseY >= 245 && mouseY <= 285) {
            rS.move(pal2.getS1());
            pC.r= map(rS.yPos, 115, 20, 0, 255);
            gS.move(pal2.getS2());
            pC.g= map(gS.yPos, 115, 20, 0, 255);
            bS.move(pal2.getS3());
            pC.b= map(bS.yPos, 115, 20, 0, 255);
          } else if (mouseY >= 290 && mouseY <= 330) {
            rS.move(pal4.getS1());
            pC.r= map(rS.yPos, 115, 20, 0, 255);
            gS.move(pal4.getS2());
            pC.g= map(gS.yPos, 115, 20, 0, 255);
            bS.move(pal4.getS3());
            pC.b= map(bS.yPos, 115, 20, 0, 255);
          } else if (mouseY >= 335 && mouseY <= 375) {
            rS.move(pal6.getS1());
            pC.r= map(rS.yPos, 115, 20, 0, 255);
            gS.move(pal6.getS2());
            pC.g= map(gS.yPos, 115, 20, 0, 255);
            bS.move(pal6.getS3());
            pC.b= map(bS.yPos, 115, 20, 0, 255);
          }
        //Set Mode Functionality
        } else {
          if (mouseY >= 245 && mouseY <= 285) {
            pal2.setR(pC.r);
            pal2.setS1(rS.getY());
            pal2.setG(pC.g);
            pal2.setS2(gS.getY());
            pal2.setB(pC.b);
            pal2.setS3(bS.getY());
          } else if (mouseY >= 290 && mouseY <= 330) {
            pal4.setR(pC.r);
            pal4.setS1(rS.getY());
            pal4.setG(pC.g);
            pal4.setS2(gS.getY());
            pal4.setB(pC.b);
            pal4.setS3(bS.getY());
          } else if (mouseY >= 335 && mouseY <= 375) {
            pal6.setR(pC.r);
            pal6.setS1(rS.getY());
            pal6.setG(pC.g);
            pal6.setS2(gS.getY());
            pal6.setB(pC.b);
            pal6.setS3(bS.getY());
          }
        }
      }
    //Grid Button Function
    } else if (mouseX > 100 && mouseX < 200) {
      if (grid == 0) {
        grid = 1;
      } else {
        grid = 0;
      }
    //Clear Button Function
    } else if (mouseX > 200 && mouseX < 300) {
      mode = 2;
    //Draw/Erase Toggle Button
    } else if (mouseX > 300 && mouseX < 400) {
      if (mode==0) {
        prevMode = 1;
        mode = 1;
        modeText = "Erase";
      } else {
        prevMode = 0;
        mode = 0;
        modeText = "Draw";
      }
    }
    //Add Art Frame Button
    else if (mouseX > 400 && mouseX < 500) {
      addArtFrame();
    }
    //Delete Art Frame Button
    else if (mouseX > 500 && mouseX < 600) {
      mode = 3;
    }
    else if (mouseX > 600 && mouseX < 700) {
      copyArt();
    }
    else if (mouseX > 700 && mouseX < 800) {
      pasteArt(allArt.get(artNum), copyPage);
    }
    //Saving Art
    else if (mouseX > 800 && mouseX < 900) {
      selectFolder("Select a folder to save art", "screenShot",artFolder);
    }
  //Dealing with pop up windows when Clearing/Deleting Art Frames
  } else {
    //Clearing Current Art
    if (mode == 2) {
      if (mouseX >= (width/2)-150 && mouseX <= (width/2)-50 && mouseY >= (height/2)+25 && mouseY <= (height/2)+75) {
        allArt.get(artNum).clearArt();
        mode = prevMode;
      } else if (mouseX >= (width/2)+50 && mouseX <= (width/2)+150 && mouseY >= (height/2)+25 && mouseY <= (height/2)+75) {
        mode = prevMode;
      }
    }
    //Deleting Current Art
    else if (mode == 3) {
      if (mouseX >= (width/2)-150 && mouseX <= (width/2)-50 && mouseY >= (height/2)+25 && mouseY <= (height/2)+75) {
        deleteArtFrame();
        mode = prevMode;
      } else if (mouseX >= (width/2)+50 && mouseX <= (width/2)+150 && mouseY >= (height/2)+25 && mouseY <= (height/2)+75) {
        mode = prevMode;
      }
    }
    else if (mode == 4) {
      if (mouseX >= (width/2)-150 && mouseX <= (width/2)-50 && mouseY >= (height/2)+25 && mouseY <= (height/2)+75) {
        mode = 5;
      } else if (mouseX >= (width/2)+50 && mouseX <= (width/2)+150 && mouseY >= (height/2)+25 && mouseY <= (height/2)+75) {
        fileName = "";
        mode = prevMode;
      }
    }
  }
}

void mouseDragged() {
  if (locked) {
    if (grSlider == 1) {
      rS.move(mouseY);
      pC.r= map(rS.yPos, 115, 20, 0, 255);
    } else if (grSlider == 2) {
      gS.move(mouseY);
      pC.g= map(gS.yPos, 115, 20, 0, 255);
    } else if (grSlider == 3) {
      bS.move(mouseY);
      pC.b= map(bS.yPos, 115, 20, 0, 255);
    }
  }

  if (mouseY > 50 && mouseX > 100 && mouseX < 900 && mouseY < 600) {
    int xPos = mouseX, yPos = mouseY;
    for (int i=xPos; i%10!=0; i--) {
      xPos=i;
    }
    if (xPos%10 != 0) {
      xPos--;
    }

    for (int i=yPos; i%10!=0; i--) {
      yPos=i;
    }
    if (yPos%10 != 0) {
      yPos--;
    }

    if (mouseX != width || mouseY != height) {
      if (mode == 0) {
        allArt.get(artNum).addPix(xPos, yPos);
      } else if (mode == 1) {
        allArt.get(artNum).removeSPix(xPos, yPos);
      }
    }
  }
}

void mouseReleased() {
  locked = false;
  grSlider = 0;
}

void keyPressed() {
  if (mode == 4) {
    if (keyCode == BACKSPACE) {
      if (fileName.length() > 0) {
        fileName = fileName.substring(0,fileName.length()-1);
      }
    }
    else if (keyCode != SHIFT) {
      char letter = key;
      fileName+=letter;
    }
  }
}

void drawGrid() {
  for (int y=0; y<height; y++) {
    if (y%10==0 || y%10==0) {
      stroke(100);
      line(0, y, width, y);
    }
  }

  for (int x=0; x<width; x++) {
    if (x%10==0 || x%10==0) {
      stroke(100);
      line(x, 0, x, height);
    }
  }
}
