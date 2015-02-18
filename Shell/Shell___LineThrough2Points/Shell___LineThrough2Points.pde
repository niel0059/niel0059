// Global variable declaration

// change these values to change the values covered by each axis
float xMin=-10;
float xMax=10;
float yMin=-10;
float yMax=10;

int xSteps=20;  //number of tick marks between xMmin and xMax
int ySteps=20;  //number of tick marks between yMmin and yMax

Point point1 = new Point();
Point point2 = new Point();

float m;  // slope of the line
float c;  // x-intercept of the line

boolean showAnswers=false;  // a switch to show or hide the display text.

// end global variable declaration

void setup(){
  size(800,600);
  
  // if possible, make the window resizable
  if (frame != null) {
    frame.setResizable(true);
  }
  
  //starting points hard-coded (change these if you change the max/min values for the axes)
  point1.xLoc=-2.0;
  point1.yLoc=-1.0;
  point2.xLoc=2.0;
  point2.yLoc=0.0;
  
}

void draw(){
  background(255);
  drawAxes();
  point1.drag(mouseX,mouseY);
  point2.drag(mouseX,mouseY);
  point1.display();
  point2.display();
  drawLine();
  if(showAnswers){
    textAlign(LEFT);
    text("y="+String.format("%.2f",m)+"x+"+String.format("%.2f",c),10,30);
    // add more text display code here. It will all toggle visibility when you press "a"
  }
}

void drawLine(){
  float x1=point1.xLoc;
  float y1=point1.yLoc;
  float x2=point2.xLoc;
  float y2=point2.yLoc;
  m=(y1-y2)/(x1-x2);
  c=(-m*x1)+y1;

  // first, use the x and y values of your two
  // points to calculate global floats m and c
  // as the slope and x-intercept of your function
  
  
  // now display the line representing the equation
  // across the whole width of the screen
  
  
  
}

float xPixToCartesian(int xPix){  // returns the x cartesian coordinate for a given horizontal reference in pixels
  return map(xPix,0,width,xMin,xMax);
}

float yPixToCartesian(int yPix){  // returns the y cartesian coordinate for a given vertical reference in pixels
  return map(yPix,height,0,yMin,yMax);
}

int xCartesianToPix(float xCart){  // returns the horizontal reference in pixels for a given y cartesian coordinate
  return int(map(xCart,xMin,xMax,0,width));
}

int yCartesianToPix(float yCart){  // returns the horizontal reference in pixels for a given y cartesian coordinate
  return int(map(yCart,yMin,yMax,height,0));
}

void mousePressed(){
  point1.click(mouseX, mouseY);
  point2.click(mouseX, mouseY);
}

void mouseReleased(){
  point1.dragging=false;
  point2.dragging=false;
}

void keyPressed(){
  if (key=='a') showAnswers=!showAnswers;  // toggle answer visibility when a is pressed
}

// this method draws the axes and tick marks
void drawAxes(){
  stroke(150);
  strokeWeight(3);
  if ((xMin<=0)&&(xMax>=0)){  //check that x=0 is within the drawn range
    line(xCartesianToPix(0),0,xCartesianToPix(0),height);  // draw y-axis
  }
  for(int i=0; i<ySteps; i++){  //draw tick marks for y axis
    line(xCartesianToPix(0),map(i,0,ySteps,0,height),xCartesianToPix(0)+(height+width)/300, map(i,0,ySteps,0,height));
  }
  if ((yMin<=0)&&(yMax>=0)){  //check that y=0 is within the drawn range
    line(0, yCartesianToPix(0),width,yCartesianToPix(0));
  }
  for(int i=0; i<xSteps; i++){  //draw tick marks for y axis
    line(map(i,0,xSteps,0,width),map(0,yMin,yMax,height,0), map(i,0,xSteps,0,width), map(0,yMin,yMax,height,0)+(height+width)/300);
  }
}
