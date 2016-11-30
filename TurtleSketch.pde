import codeanticode.tablet.*;
import controlP5.*;

ControlP5 cp5;
Tablet tablet;

float lineStartX;
float lineStartY;

Line prevLine;
Line curLine;

boolean firstClick;

String[] turtleNames = {"araceli", "bilal", "cristina", "daniel"};

TurtleTracker turtleTracker;

boolean executed = false;
boolean displayCode = false;

float CODE_AREA_WIDTH = 225;
float BUTTON_AREA_HEIGHT = 35;
int TEXT_SIZE = 13;
                        
/* Get the window ready to roll */
public void setup() {
  size(1000, 700);
  
  resetEverything();
  
  tablet = new Tablet(this);
  cp5 = new ControlP5(this);
  
  /* Three buttons */
  cp5.addButton("sketchToCode")
     .setValue(0)
     .setPosition(10,height-25)
     .setSize(200,19)
     .setLabel("Sketch To Code")
     ;
     
  cp5.addButton("codeToSketch")
     .setValue(1)
     .setPosition(220,height-25)
     .setSize(200,19)
     .setLabel("Code To Sketch")
     ;
     
  cp5.addButton("clearAll")
     .setValue(2)
     .setPosition(430,height-25)
     .setSize(200,19)
     .setLabel("Clear All")
     ;
     
  turtleTracker = new TurtleTracker(this, turtleNames[int(random(turtleNames.length))]);
  
}

public void draw() {

  this.drawBackdrop();

  if (this.displayCode) {
      this.drawTurtleCode();
  }
  
}


public void drawBackdrop() {
  /* Boxes around code area and button area */
  //this.background(255);
  this.stroke(0);
  this.fill(0);
  this.rect(0, 0, CODE_AREA_WIDTH, height);
  this.fill(100);
  this.rect(0, height - BUTTON_AREA_HEIGHT, width, BUTTON_AREA_HEIGHT);
}


public void mousePressed(){

  /* If you click in the code or button zones, nothing happens */
  if (mouseX <= CODE_AREA_WIDTH || mouseY >= height - BUTTON_AREA_HEIGHT)
      return;
  
  /* If you click in the same place, stop this shape */
  if (abs(mouseX - lineStartX) < 3 && abs(mouseY - lineStartY) < 3) {
    firstClick = true;
    return;
  }
  
   stroke(0); 
   this.line(lineStartX, lineStartY, mouseX, mouseY); // Draw on the screen

   prevLine = curLine;
   curLine = new Line(new PVector(lineStartX, lineStartY), new PVector(mouseX, mouseY));
   turtleTracker.add(prevLine.getRotation(curLine));
   turtleTracker.add(curLine);
 
 // Set things up for the next line
 lineStartX = mouseX;
 lineStartY = mouseY;
 
 firstClick = false;
}


public void drawTurtleCode() {
  this.stroke(255);
  this.fill(255);
  this.textSize(TEXT_SIZE);
  this.text(turtleTracker.getCode(), 5, 2);
}

public void resetEverything() {
  background(200);
  
  lineStartX = width/2; // Turtles start in the middle of the screen
  lineStartY = height/2;
  
  firstClick = true;
  curLine = new Line(new PVector(0, 0), new PVector(0, -1)); // Turtles start facing north
}

/* Button Action Listeners */
// Each one needs the same name as the string passed to the constructor of the button.
public void sketchToCode(int theValue) {
  this.drawTurtleCode();
  displayCode = true;
}

public void codeToSketch(int theValue) {
  this.background(200);
  //this.drawBackdrop();
  turtleTracker.drawTurtleSketch();
  //this.drawTurtleCode();
  executed = true;
}

public void clearAll(int theValue) {
  resetEverything();
  displayCode = false;
  executed = false;
  turtleTracker.clear();
  turtleTracker = new TurtleTracker(this, turtleNames[int(random(turtleNames.length))]);
}

//boolean sketchFullScreen() {
//  return true;
//}