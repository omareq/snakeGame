
class Snake{
  ArrayList<PVector> body = new ArrayList<PVector>();
  int up = 0;
  int left = 1;
  int down = 2;
  int right = 3;
  int w,h;
  int direction;
  int scale;
  
  Snake(int s){
    scale = s;
    w = floor(width/scale);
    h = floor(height/scale);
    PVector startPos = new PVector(random(w), random(h));
    direction = left;//floor(random(4));
    body.add(startPos);
    body.add(new PVector(startPos.x + 1, startPos.y));
    body.add(new PVector(startPos.x + 2, startPos.y));
    body.add(new PVector(startPos.x + 3, startPos.y));
  }
  
  //come up with a better way to do this
  void changeDirection(int direc){
     if(direc < 0  || direc >3){
       return;
     }
     if(direc == up && direction == down){
       return;
     }
     if(direc == down && direction == up){
       return;
     }
     if(direc == left && direction == right){
       return;
     }
     if(direc == right && direction == left){
       return;
     }
     
     direction = direc;
  }
  
  boolean eat(Food f){
    
  }
  
  void update(){
    for(int i = body.size() - 1; i > 0; i--){
      PVector current = body.get(i-1).copy();
      body.set(i, current);
    }
    
    PVector nextPos = body.get(0);
    
    if(direction == up){
       nextPos.y -=1;
       if(nextPos.y < 0){
         nextPos.y = h - 1;
       }
    }
    else if (direction == left){
      nextPos.x -= 1;
      if(nextPos.x < 0){
        nextPos.x = w - 1;
      }
    }
    else if (direction == down){      
      nextPos.y += 1;
      if(nextPos.y >=  h){
        nextPos.y = 0;
      }
    }
    else if (direction == right){
      nextPos.x +=1;
      if(nextPos.x >= w){
        nextPos.x = 0;
      }
    }
    
    body.set(0, nextPos);    
  }
  
  void show(){
    pushStyle();
    fill(255);  
    
    for(int i = 0; i < body.size(); i ++){
      PVector section = body.get(i);
      rect(section.x * scale, section.y * scale, scale, scale);
    }
    
    update();
    popStyle();
  }
}