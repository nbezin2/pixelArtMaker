//Make a pop up menu that lets you title and set save point
void screenShot(File location) {
  artFolder = location;
  mode = 4;
}

void nameArt() {
  stroke(0);
  fill(150);
  rect((width/2)-150, (height/2)-75, 300, 150);
  fill(175);
  rect((width/2)-125, (height/2)+25, 75, 35);
  rect((width/2)+50, (height/2)+25, 75, 35);
  fill(0);
  textSize(20);
  text("Save", (width/2)-110, (height/2)+50);
  text("Cancle", (width/2)+55, (height/2)+50);
  textSize(15);
  text("Type a name for your art:", (width/2)-90, (height/2)-40);
  fill(255);
  rect((width/2)-100, (height/2)-25, 200, 20);
  fill(0);
  text(fileName, (width/2)-95, (height/2)-10);
}
