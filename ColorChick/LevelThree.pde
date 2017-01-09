void levelThreeSet(){
  blockNum = 8;
  speed = 1;
  initLevel(15,3,5,yellow);
  
  //player
  player = new Player(yellow2);
  
  //blockBall
  blockBall[0] = new BlockBall(180,40,BLOCK_SIZE,0,speed);
  blockBall[1] = new BlockBall(180,200,BLOCK_SIZE,0,-speed);
  blockBall[2] = new BlockBall(180,280,BLOCK_SIZE,0,speed);
  blockBall[3] = new BlockBall(180,440,BLOCK_SIZE,0,-speed);
  blockBall[4] = new BlockBall(550,40,BLOCK_SIZE,0,speed);
  blockBall[5] = new BlockBall(550,200,BLOCK_SIZE,0,-speed);
  blockBall[6] = new BlockBall(550,280,BLOCK_SIZE,0,speed);
  blockBall[7] = new BlockBall(550,440,BLOCK_SIZE,0,-speed);
  
  //colorBall
  colorBall[0] = new ColorBall(390,420,COLOR_SIZE,0,0);
  colorBall[1] = new ColorBall(275,300,COLOR_SIZE,0,0);
  colorBall[2] = new ColorBall(349,70,COLOR_SIZE,0,0);
  colorBall[3] = new ColorBall(437,253,COLOR_SIZE,0,0);
  colorBall[4] = new ColorBall(385,170,COLOR_SIZE,0,0);
  for(int i=0;i<onField;i++){
    colorBall[i].fillTheColor(ballIndexList[i]);
  }
}

void levelThreeDraw(){
  //background
  level.show(yellow3,3);
  
  //player
  player.display();
  player.move();
  player.washBack();
  player.goToNextLevel(level);
  for(int i=0;i<blockNum;i++){
    player.OnCollision(blockBall[i]);
  }
  for(int i=0;i<onField;i++){
    player.OnCollision(colorBall[i]);
  }
  
  //blockball
  blockBall[0].move(0,width,40,80);
  blockBall[1].move(0,width,160,200);
  blockBall[2].move(0,width,280,320);
  blockBall[3].move(0,width,400,440);
  blockBall[4].move(0,width,40,80);
  blockBall[5].move(0,width,160,200);
  blockBall[6].move(0,width,280,320);
  blockBall[7].move(0,width,400,440); 
  for(int i=0;i<blockNum;i++){
    blockBall[i].fillTheColor(block);
    blockBall[i].display();
  }
  
  //colorBall
  for(int i=0;i<onField;i++){
    colorBall[i].display();
  }
  

}