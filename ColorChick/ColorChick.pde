// this is main one by rebecca
// update by fanyuting at 2016 01 09 11:00am
//2016/01/09 11:00am

import processing.video.*;
int openingCount=300;
int movieCount=120;


PImage main;
PImage startPress1;
PImage startPress2;

Movie opening;
Movie intoBall;
Movie redMoive;
Movie orangeMovie;
Movie yellowMovie;
Movie greenMovie;
Movie blueMovie;
Movie purpleMovie;
Movie endMovie;

final int COLOR_SIZE = 40, ATTACK_SIZE = 30, BLOCK_SIZE = 80, PLAYER_SIZE = 40;
final int COLOR_NUMBER = 13;
final float BAR_SIZE = 40;

//save all the color
public int [][] colorTable = { {254,254,254}, {254,0,50},{254,127,152},
                               {254,246,154},{242,158,194},{248,202,174},
                               {248,202,174},{251,224,164},{0,204,254},
                               {127,225,204},{52,102,254},{153,178,254},
                               {147,130,224},{190,190,190},{106,106,106},
                              };
                              
//index of the color
public int white = 0, red = 1, pink2 =2,
           yellow = 3, pink = 4, orange=5,
           yellow2 = 6, yellow3=7,blue =8,
           green = 9, blue2 = 10, blue3 = 11,
           purple = 12,block = 13,attack = 14;
           
public int colorIndex;
public int totalBall, targetBall, onField, targetColor;
public int attackNum, blockNum;
public float speed;
public int [] ballIndexList = new int [15];   

public float startX = 100;
public Player player = new Player(white);
public Level level = new Level();
public BlockBall [] blockBall = new BlockBall [15];
public AttackBall [] attackBall = new AttackBall [15];
public ColorBall [] colorBall = new ColorBall [15];

boolean correctcolor(){
    if(player.x>600 && player.r==level.r && player.g==level.g && player.b==level.b){
      return true;}
        else{
          return false;
        }
    }
    
boolean restart(){
  if(colorIndex == totalBall){
    if(mouseX>20 && mouseX<70 && mouseY>380 && mouseY<410 && mousePressed){
      return true;
    }else{
      return false;
    }
  }
  return false;
}

//levelState
int levelState;
final int LEVEL_OPENING=0;
final int LEVEL_STORY_MOVIE=1;
final int LEVEL_INTOBALL_MOVIE =2;
final int GAME_PRESS_START=3;

final int LEVEL_RED=4;
final int LEVEL_RED_MOVIE=5;

final int LEVEL_ORANGE=6;
final int LEVEL_ORANGE_MOVIE=7;

final int LEVEL_YELLOW=8;
final int LEVEL_YELLOW_MOVIE=9;

final int LEVEL_GREEN=10;
final int LEVEL_GREEN_MOVIE=11;

final int LEVEL_BLUE=12;
final int LEVEL_BLUE_MOVIE=13;

final int LEVEL_PURPLE=14;
final int LEVEL_PURPLE_MOVIE=15;

final int LEVEL_END=16;
           
void setup(){
  size(640,480);
  //movie set
  opening = new Movie(this,"Opening.mp4");
  redMoive = new Movie(this, "Red.mp4");
  orangeMovie = new Movie(this, "Orange.mp4");
  yellowMovie = new Movie(this, "Yellow.mp4");
  greenMovie = new Movie(this, "Green.mp4");
  blueMovie = new Movie(this, "Blue.mp4");
  purpleMovie = new Movie(this, "Purple.mp4");
  intoBall = new Movie(this,"ChickenIntoBall.mp4");
  endMovie = new Movie(this,"newEnd.mov");
  
  //image set
  main = loadImage("img/Cover.png");
  startPress1 = loadImage("img/pressStart1.png");
  startPress2 = loadImage("img/pressStart2.png");
  
  for(int i=0; i<colorBall.length; i++){
    colorBall[i] = new ColorBall(50+i*50,200,COLOR_SIZE,0,0);
    colorBall[i].fillTheColor(ballIndexList[i]);
    attackBall[i] = new AttackBall(100,10,ATTACK_SIZE, random(-5,5),random(-5,5));
    blockBall[i] = new BlockBall(40,20,BLOCK_SIZE,random(-3,3),random(-3,3));}
 
  //player set
  player= new Player(white);
  player.x= 50;
  player.y= 240;
  levelOneSet();
  
}

void movieEvent(Movie m) {
  m.read();
}

void draw(){
  background(255);  
  switch(levelState){
  //main game
  case LEVEL_OPENING:
  image(main,0,0,640,480);
  if(mousePressed){
    levelState=LEVEL_STORY_MOVIE;}
  
  break;
  
  //click to start
  case LEVEL_STORY_MOVIE:
  opening.play();
  image(opening,0,0,640,480);
  if( openingCount== 300){openingCount --;}
  if(openingCount <300){openingCount --;}
  if(openingCount<0){
    openingCount = 300;
    levelState = LEVEL_INTOBALL_MOVIE;    
  }
  break;
  
  //chicken into ball
  case LEVEL_INTOBALL_MOVIE:
  intoBall.play();
  image(intoBall,0,0,640,480);
  if(mouseX>320-100 &&mouseX<320+100 && mouseY>240-100 &&mouseY <240+100 && mousePressed){
       openingCount = 300; 
       levelState = GAME_PRESS_START;
  }
  
  break;
  
  
  //press to start img
  case GAME_PRESS_START:
  image(startPress2,0,0,640,480);
      if(mouseX>350 &&mouseX<460 && mouseY>240 &&mouseY <280){
        image(startPress1,0,0,640,480);
          if(mousePressed)levelState =LEVEL_RED;
        }
  break;
    
  case LEVEL_RED:
  levelOneDraw();
   if(correctcolor()==true){
      levelTwoSet();
      player.x=50;
      player.y=240;
      levelState=LEVEL_RED_MOVIE;
      }
   if(restart()){
     levelOneSet();
   }
  break;
  
  case LEVEL_RED_MOVIE:
  redMoive.play();
  image(redMoive,0,0,640,480);
  if( movieCount== 120){movieCount --;}
  if(movieCount <120){ movieCount --;}
  if(movieCount<0){
    movieCount = 120;
    levelState = LEVEL_ORANGE;
  }
  break;
  
  case LEVEL_ORANGE:
  levelTwoDraw();
  movieCount = 120;
   if(correctcolor()==true){
      levelThreeSet();
      player.x=50;
      player.y=240;
      levelState=LEVEL_ORANGE_MOVIE;
      }
   if(restart()){
     levelTwoSet();
   }
  break;
  
  case LEVEL_ORANGE_MOVIE:
  println("orange");
  orangeMovie.play();
  image(orangeMovie,0,0,640,480);
  if( movieCount== 120){movieCount --;}
  if(movieCount <120){movieCount --;}
  if(movieCount<0){
    movieCount = 120;
    levelState = LEVEL_YELLOW;
    }
  break;
  
  case LEVEL_YELLOW:
  levelThreeDraw();
   if(correctcolor()==true){
      levelFourSet();
      player.x=50;
      player.y=240;
      levelState=LEVEL_YELLOW_MOVIE;
      }     
   if(restart()){
     levelThreeSet();
   }
  break;
  
  case LEVEL_YELLOW_MOVIE:
  yellowMovie.play();
  image(yellowMovie,0,0,640,480);
  if( movieCount== 120){movieCount --;}
  if(movieCount <120){movieCount --;}
  if(movieCount<0){
    levelState = LEVEL_GREEN;
    movieCount = 120;}
  break;
  
  
  
  case LEVEL_GREEN:
  levelFourDraw();
   if(correctcolor()==true){
      levelFiveSet();
      player.x=50;
      player.y=240;
      levelState=LEVEL_GREEN_MOVIE;
      } 
   if(restart()){
     levelFourSet();
   }
  break;
  
  case LEVEL_GREEN_MOVIE:
  greenMovie.play();
  image(greenMovie,0,0,640,480);
  if( movieCount== 120){movieCount --;}
  if(movieCount <120){movieCount --;}
  if(movieCount<0){
    levelState = LEVEL_BLUE;
    movieCount = 120;}
  break;
  
  case LEVEL_BLUE:
  levelFiveDraw();
   if(correctcolor()==true){
      levelSixSet();
      player.x=50;
      player.y=240;
      levelState=LEVEL_BLUE_MOVIE;
      } 
   if(restart()){
     levelFiveSet();
   }
  break;
  
  case LEVEL_BLUE_MOVIE:
  blueMovie.play();
  image(blueMovie,0,0,640,480);
  if( movieCount== 120){movieCount --;}
  if(movieCount <120){movieCount --;}
  if(movieCount<0){
    levelState = LEVEL_PURPLE;
    movieCount = 120;}
  break;  
  
  case LEVEL_PURPLE:
  levelSixDraw();
   if(correctcolor()==true){
      levelState=LEVEL_PURPLE_MOVIE;
      } 
   if(restart()){
     levelSixSet();
   }
  break;
  
  case LEVEL_PURPLE_MOVIE:
  purpleMovie.play();
  image(purpleMovie,0,0,640,480);
  if( movieCount== 120){movieCount --;}
  if(movieCount <120){movieCount --;}
  if(movieCount<0){
    levelState = LEVEL_END;
    movieCount = 120;}
  break;
  
  case LEVEL_END:
  endMovie.play();
  image(endMovie,0,0,640,480);
  break;
  }
  
  
}

void keyPressed () {
  if (key == CODED) { 
    switch ( keyCode ) {
    case UP :
      player.upPressed = true ;
      break ;
    case DOWN :
      player.downPressed = true ;
      break ;
    case LEFT :
      player.leftPressed = true ;
      break ;
    case RIGHT :
      player.rightPressed = true ;
      break ;
    }    
  }
}

void keyReleased () {
  if (key == CODED) { 
    switch ( keyCode ) {
    case UP : 
      player.upPressed = false ;
      break ;
    case DOWN :
      player.downPressed = false ;
      break ;
    case LEFT :
      player.leftPressed = false ;
      break ;
    case RIGHT :
      player.rightPressed = false ;
      break ;
    }
  }   
}