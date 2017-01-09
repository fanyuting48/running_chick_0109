class Player{
  float x,y;
  float speed;
  float size;
  int r,g,b;
  float easing;
  boolean upPressed = false;
  boolean downPressed = false;
  boolean rightPressed = false;
  boolean leftPressed = false;
 
  boolean bouncingUp = false;
  boolean bouncingDown = false;
  boolean bouncingRight = false;
  boolean bouncingLeft = false;
  float bounceUp = 30;
  float bounceDown = 30;
  float bounceRight = 30;
  float bounceLeft = 30;
  
  int initR,initG,initB;
  
  Player(int colorIndex){
    x = 50;
    y = 240;
    easing = 0.1;
    speed = 4;
    size = PLAYER_SIZE;
    r = colorTable[colorIndex][0];
    g = colorTable[colorIndex][1];
    b = colorTable[colorIndex][2];
    initR = r;
    initG = g;
    initB = b;
  }
  
  void display(){
    if(bouncingUp){
      y-=30*easing;
      if(y<PLAYER_SIZE/2) y = PLAYER_SIZE;
      bounceUp -= 30*easing;
      if(bounceUp < 0){
        bouncingUp = false;
        bounceUp = 30;
      }
    }
    if(bouncingDown){
      y+=30*easing;
      if(y>height-PLAYER_SIZE/2) y = height-PLAYER_SIZE/2;
      bounceDown -= 30*easing;
      if(bounceDown < 0){
        bouncingDown = false;
        bounceDown = 30;
      }
    }
    if(bouncingRight){
      x+=30*easing;
      if(x>width-PLAYER_SIZE/2) x = width-PLAYER_SIZE/2;
      bounceRight -= 30*easing;
      if(bounceRight < 0){
        bouncingRight = false;
        bounceRight = 30;
      }
    }
    if(bouncingLeft){
      x-=30*easing;
      if(x<PLAYER_SIZE/2) x = PLAYER_SIZE/2;
      bounceLeft -= 30*easing;
      if(bounceLeft < 0){
        bouncingLeft = false;
        bounceLeft = 30;
      }
    }
    
    if(playerTouch<120) playerTouch--;
    if(playerTouch<0) playerTouch = 120;
    noStroke();
    fill(r,g,b);
    ellipse(x,y,size,size);
  }
  
  public void blendOtherCircle(Player player, ColorBall colorball){
    r = (player.r + colorball.r)/2;
    g = (player.g + colorball.g)/2;
    b = (player.b + colorball.b)/2;
    player.x = colorball.x;
    player.y = colorball.y;
  }
  
  void move(){
      if(bouncingUp == false && upPressed && y>size/2) y -= speed;
      if(bouncingDown == false && downPressed && y<height-size/2) y += speed;
      if(bouncingRight == false && rightPressed && x<width-size/2) x += speed;
      if(bouncingLeft == false && leftPressed && x>size/2) x -= speed;
    }
  
  void colorBlend(ColorBall target){
    r = (r+target.r)/2;
    g = (g+target.g)/2;
    b = (b+target.b)/2;
  }
  
  boolean goToNextLevel(Level level){
    if(x>600 && r == level.r && g == level.g && b == level.b){
      return true;
    }else{
      return false;
    }
  }
  
  int playerTouch = 120;
  
  boolean OnCollision(ColorBall target){
    if(playerTouch != 120) return false;
    float distance = dist(x,y,target.x,target.y);
    if(distance<=(size+target.size)/2){
      player.colorBlend(target);
      if(colorIndex<totalBall){
          target.fillTheColor(ballIndexList[colorIndex]);
          colorIndex++;
        }else{
          target.ratio = 0;        
        }
      playerTouch--;
      return true;
    }
    return false;
  }
  
  void washBack(){
    if(x<90){
      if(initR != r || initG != g || initB != b){
        r = initR;
        g = initG;
        b = initB;
      }
    }
  }
  
  void OnCollision(BlockBall target){
    float distance = dist(x,y,target.x,target.y);
    if(distance<=(size+target.size)/2){
      if(x<target.x) bouncingLeft = true;
      if(x>target.x) bouncingRight = true;
      if(y<target.y) bouncingUp = true;
      if(y>target.y) bouncingDown = true;
    }    
  }
}