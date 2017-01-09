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
    if(colorIndex == blue3 || colorIndex == yellow3 || colorIndex ==orange){
      background(r+50,g+50,b+50);
      }else{
        background(r+100,g+100,b+100);
    }
    fill(r,g,b);
    
    //goal bar
    rect(width-BAR_SIZE,0,BAR_SIZE,height);
    fill(15,15,15);
    
    //level text
    fill(255);
    rect(0,20,90,45);
    
    fill(50,50,50);
    textSize(20);
    text("Level"+levelNum,12,40);
    //ball text
    fill(150,150,150);
    textSize(14);
    text("target  "+targetBall, 14,60);
    
    //start line
    fill(200,200,200);
    for(int i=0; i<25; i++){
      rect(90,0+i*20,3,10);
    }
    
    //wash ball
    stroke(205);
    strokeWeight(2);
    if(mouseX>20 && mouseX<70 && mouseY>380 && mouseY<410){
      fill(r+50,g+50,b+50);
        }else{
          noFill();
          }
          
    rect(20,380,50,30);
    fill(100);
    textSize(10);
    text("RESTART",25,400);
    
    
  }
}