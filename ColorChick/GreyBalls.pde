class AttackBall extends Ball{
  int threshold = 30;
  AttackBall(float x, float y, float size, float speedX, float speedY){
    super(x,y,size,speedX,speedY);
  }
  
  boolean OnCollision(Ball target){
    if(threshold != 30) return false;
    float distance = dist(x,y,target.x,target.y);
    if(distance <= (size+target.size)/2){
      speedX *= -1;
      speedY *= -1;
      threshold --;
      return true;
    }
    return false;
  }
  
  void OnCollision(Player target){
    float distance = dist(x,y,target.x,target.y);
    if(distance <= (size+target.size)/2){
      speedX *= -1;
      speedY *= -1;
    }
  }

  void display(){
    noStroke();
    fill(r,g,b);
    ellipse(x,y,size,size);
    if (threshold <30) threshold -= 1;
    if (threshold <0) threshold =30;
  }
}

class BlockBall extends Ball{
  BlockBall(float x, float y, float size, float speedX, float speedY){
    super(x,y,size,speedX,speedY);
  }
  void display(){
    noStroke();
    fill(r,g,b);
    ellipse(x,y,size,size);
  }
}