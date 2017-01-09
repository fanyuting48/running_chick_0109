class Level{
  int r,g,b;
  
  Level(){
    r = 0;
    g = 0;
    b = 0;
  }
  void show(int colorIndex, int levelNum){
    r = colorTable[colorIndex][0];
    g = colorTable[colorIndex][1];
    b = colorTable[colorIndex][2];
    
    //bg
    if(colorIndex == blue3){
      background(r+50,g+50,b+50);
    }else{
      background(r+100,g+100,b+100);
    }
    fill(r,g,b);
    
    //goal bar
    rect(width-BAR_SIZE,0,BAR_SIZE,height);
    fill(15,15,15);
    
    //level text
    textSize(16);
    text("LEVEL"+levelNum,18,40);
    //ball text
    textSize(14);
    text("TARGET"+targetBall, 14,60);
    
    //start line
    fill(200,200,200);
    for(int i=0; i<25; i++){
      rect(90,0+i*20,3,10);
    }
    
    //wash ball
    stroke(205);
    strokeWeight(3);
    noFill();
    ellipse(50,240,35,35);
  }
}