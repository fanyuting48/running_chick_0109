class ColorBall extends Ball{
  float ratio = 1f;
  float initRatio = 1f;
  float transformRatio = 0.5f;
  float minRatio = 0.25f;
  int threshold = 30;
  int playerTouch = 100;

  
  ColorBall(float x, float y, float size, float speedX, float speedY){
    super(x,y,size,speedX,speedY);
    ratio = 1f;
  }
  
  Boolean OnCollision(Ball target){
    if(threshold != 30) return false;
    float distance = dist(x,y,target.x,target.y);
    if(distance<=(size+target.size)/2){
      ratio = ratio * transformRatio;
      if(ratio == minRatio){
        if(colorIndex<totalBall){
          ratio = initRatio;
          fillTheColor(ballIndexList[colorIndex]);
          colorIndex++;
        }else{
          ratio = 0;        
        }
      }
      threshold --;
      return true;
    }
    return false;
  }
  
  void display(){
    noStroke();
    fill(r,g,b);
    ellipse(x,y,size * ratio,size * ratio);
    if (threshold <30) threshold -= 1;
    if (threshold <0) threshold =30;
  }
}