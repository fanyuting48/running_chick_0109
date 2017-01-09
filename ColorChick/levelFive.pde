void levelFiveSet(){
  blockNum = 8;
  attackNum = 3;  
  initLevel(15,5,5,blue2);
  
  //player
  player = new Player(white);
  
  
  //blockBall
  blockBall[0] = new BlockBall(400,40,BLOCK_SIZE,0,0);
  blockBall[1] = new BlockBall(400,120,BLOCK_SIZE,0,0);
  blockBall[2] = new BlockBall(480,120,BLOCK_SIZE,0,0);
  blockBall[3] = new BlockBall(560,120,BLOCK_SIZE,0,0);
  blockBall[4] = new BlockBall(400,440,BLOCK_SIZE,0,0);
  blockBall[5] = new BlockBall(400,360,BLOCK_SIZE,0,0);
  blockBall[6] = new BlockBall(480,360,BLOCK_SIZE,0,0);
  blockBall[7] = new BlockBall(560,360,BLOCK_SIZE,0,0);
  
  //attackBall
  attackBall[0] = new AttackBall(width-BAR_SIZE-ATTACK_SIZE/2-1, height/2-50,ATTACK_SIZE,random(3,5),random(-1,-1));
  attackBall[1] = new AttackBall(width-BAR_SIZE-ATTACK_SIZE/2-1, height/2,ATTACK_SIZE,random(3,5),random(-1,-1));
  attackBall[2] = new AttackBall(width-BAR_SIZE-ATTACK_SIZE/2-1, height/2+50,ATTACK_SIZE,random(3,5),random(-1,-1));
  
  //colorBall
  colorBall[0] = new ColorBall(280,240,COLOR_SIZE,0,0);
  colorBall[1] = new ColorBall(280,170,COLOR_SIZE,0,0);
  colorBall[2] = new ColorBall(280,100,COLOR_SIZE,0,0);
  colorBall[3] = new ColorBall(280,310,COLOR_SIZE,0,0);
  colorBall[4] = new ColorBall(280,380,COLOR_SIZE,0,0);
  for(int i=0;i<onField;i++){
    colorBall[i].fillTheColor(ballIndexList[i]);
  }
}

void levelFiveDraw(){
  //background
  level.show(blue3,5);
  
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
    blockBall[i].display();
  }
  
  //attackBall
  for(int i=0;i<attackNum;i++){
    attackBall[i].fillTheColor(attack);
    attackBall[i].move(100,width-BAR_SIZE-ATTACK_SIZE/2,0,height);
    attackBall[i].display();
    attackBall[i].OnCollision(player);
    for(int j=0;j<blockNum;j++){
      attackBall[i].OnCollision(blockBall[j]);
    }
  }
  
  //colorBall
  for(int i=0;i<onField;i++){
    colorBall[i].display();
    for(int j=0;j<attackNum;j++){
      colorBall[i].OnCollision(attackBall[j]);
    }
  }
}