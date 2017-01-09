void levelFourSet(){
  attackNum = 3;
  initLevel(10,3,4,yellow);
  
  //player
  player = new Player(blue);
  
  
  //attackBall
  attackBall[0] = new AttackBall(350,180,ATTACK_SIZE,random(3,7),random(-3,4));
  attackBall[1] = new AttackBall(250,120,ATTACK_SIZE,random(3,7),random(-3,4));
  attackBall[2] = new AttackBall(355,120,ATTACK_SIZE,random(3,7),random(-3,4));
  //colorBall
  colorBall[0] = new ColorBall(300,160,ATTACK_SIZE,0,0);
  colorBall[1] = new ColorBall(280,250,ATTACK_SIZE,0,0);
  colorBall[2] = new ColorBall(340,350,ATTACK_SIZE,0,0);
  colorBall[3] = new ColorBall(480,120,ATTACK_SIZE,0,0);
  for(int i=0;i<onField;i++){
    colorBall[i].fillTheColor(ballIndexList[i]);
  }
}

void levelFourDraw(){
  //background
  level.show(green,4);
  
  //player
  player.display();
  player.move();
  player.washBack();
  player.goToNextLevel(level);
  for(int i=0;i<onField;i++){
    player.OnCollision(colorBall[i]);
  }
  
  //attackBall
  for(int i=0;i<attackNum;i++){
    attackBall[i].fillTheColor(attack);
    attackBall[i].move(startX,width-BAR_SIZE-ATTACK_SIZE/2,0,height);
    attackBall[i].OnCollision(player);
    attackBall[i].display();
  }
  //colorBall
  for(int i=0;i<onField;i++){
    colorBall[i].display();
    for(int j=0;j<attackNum;j++){
      colorBall[i].OnCollision(attackBall[j]);
    }
  }
}