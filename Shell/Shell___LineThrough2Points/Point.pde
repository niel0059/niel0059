class Point{
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //
  //  How to use the point class
  //  Create by using:
  //  Point {variable name} = new Point();
  //  no initial parameters are required for instantiation
  //
  //  Parameters:
  //  xLoc - a floating point value representing the x Cartesian coordinate
  //  yLoc - a floating point value representing the y Cartesian coordinate
  //  dDisp - diameter of the point as displayed (in pixels)
  //
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  
  float xLoc;  //xlocation in cartesian coordinates
  float yLoc;  //ylocation in cartesian coordinates
  int dDisp=16;  //display diameter of point
  boolean dragging=false;
  int xOffset;  //in pixels
  int yOffset;  //in pixels
  
  Point(){
  }
  
  void display(){
    stroke(0);
    strokeWeight(0);
    fill(0,0,255);
    ellipseMode(CENTER);
    if (contains(mouseX, mouseY)) fill(0,255,0);
    ellipse(map(xLoc,xMin,xMax,0,width),map(yLoc,yMin,yMax,height,0), dDisp, dDisp);
    displayCoordinates();
  }
  
  boolean contains(int x, int y){
    int rTouch=20;  // acceptable touch radius from point (in pixels)
    int xPix = int(map(xLoc,xMin,xMax,0,width));
    int yPix = int(map(yLoc,yMin,yMax,height,0));
    if ((rTouch*rTouch)>((x-xPix)*(x-xPix)+(y-yPix)*(y-yPix))) return true;
    else return false;
  }
  
  void click(int x, int y){
    if (contains(x,y)){
      dragging=true;
      xOffset=int(x-map(xLoc,xMin,xMax,0,width));
      //testDebug=str(xOffset);
      yOffset=int(y-map(yLoc,yMin,yMax,height,0));
    }
  }
  
  void drag(int x, int y){
    if (dragging){
      xLoc = map(float(x-xOffset),0,width,xMin,xMax);
      yLoc = map(float(y-yOffset),height,0,yMin,yMax);
    }
  }
  
  void displayCoordinates(){
    int vertOffset=0;
    int horizOffset=0;

    textSize(30);
    fill(0);
    if (xLoc>((xMax-xMin)/2+xMin)){
      horizOffset=-20;
      textAlign(RIGHT);
    }else{
      horizOffset=20;
      textAlign(LEFT);
    }
    if (yLoc>((yMax-yMin)/2+yMin)){
      vertOffset=30;
    } else {
      vertOffset=-30;
    }

    text("("+String.format("%.2f",xLoc)+","+String.format("%.2f",yLoc)+")",map(xLoc,xMin, xMax, 0, width)+horizOffset, map(yLoc,yMin, yMax, height,0)+vertOffset);
    
  }
}
