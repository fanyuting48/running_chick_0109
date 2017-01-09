void levelSixSet(){
  blockNum = 5;
  speed = 3;
  float speedB = 2;
  initLevel(15,5,5,pink); 
  
  //player
  player = new Player(blue2);
  
  //blockBall
  blockBall[0] = new BlockBall(460,70,BLOCK_SIZE,-speed,0);
  blockBall[1] = new BlockBall(140,160,BLOCK_SIZE,speedB,0);
  blockBall[2] = new BlockBall(460,240,BLOCK_SIZE,-speed,0);
  blockBall[3] = new BlockBall(140,330,BLOCK_SIZE,speedB,0);
  blockBall[4] = new BlockBall(460,410,BLOCK_SIZE,-speed,0);
  
  //colorBall
  colorBall[0] = new ColorBall(550,240,COLOR_SIZE,0,0);
  colorBall[1] = new ColorBall(550,170,COLOR_SIZE,0,0);
  colorBall[2] = new ColorBall(550,100,COLOR_SIZE,0,0);
  colorBall[3] = new ColorBall(550,310,COLOR_SIZE,0,0);
  colorBall[4] = new ColorBall(550,380,COLOR_SIZE,0,0);
  for(int i=0;i<onField;i++){
    colorBall[i].fillTheColor(ballIndexList[i]);
  }
}
void levelSixDraw(){
  //background
  level.show(purple,6);
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
  
  //blockBall
  for(int i=0;i<blockNum;i++){
    blockBall[i].fillTheColor(block);
    blockBall[i].move(140,460,0,height);
    blockBall[i].display();
  }
    //colorBall
  for(int i=0;i<onField;i++){
    colorBall[i].display();
    for(int j=0;j<attackNum;j++){
      colorBall[i].OnCollision(attackBall[j]);
    }
  }
}