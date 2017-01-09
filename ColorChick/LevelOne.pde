void levelOneSet(){
  blockNum = 2;
  speed = 2;
  
  //player
  player = new Player(white);
  //initialLevel
  initLevel(4,2,2,red);
  
  //blockBall
  blockBall[0] = new BlockBall(180,80,BLOCK_SIZE,0,speed);
  blockBall[1] = new BlockBall(280,height-80,BLOCK_SIZE,0,-speed); 
  
  //colorBall
  colorBall[0] = new ColorBall(400,260,COLOR_SIZE,0,0);
  colorBall[1] = new ColorBall(480,350,COLOR_SIZE,0,0);
  for(int i=0;i<onField;i++){
    colorBall[i].fillTheColor(ballIndexList[i]);
  }
  
}

void levelOneDraw(){
  //background
  level.show(pink2,1);
  
  //player
  player.display();
  player.move();
  player.washBack();
  //player.goToNextLevel(level);
  for(int i=0;i<blockNum;i++){
    player.OnCollision(blockBall[i]);
  }
  for(int i=0;i<onField;i++){
    player.OnCollision(colorBall[i]);
  }
  
  //blockBall
  for(int i=0;i<blockNum;i++){
    blockBall[i].fillTheColor(block);
  }
  blockBall[0].move(0,width,80*0.5,height-80*0.5);
  blockBall[1].move(0,width,80*0.5,height-80*0.5);
  for(int i=0;i<blockNum;i++){
    blockBall[i].display();
  }
  
  //colorBall
  for(int i=0;i<onField;i++){
    colorBall[i].display();
  }
  
}