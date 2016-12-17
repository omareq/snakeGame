
class Snake {
  ArrayList<PVector> body = new ArrayList<PVector>();
  int up = 0;
  int left = 1;
  int down = 2;
  int right = 3;
  int w, h;
  int direction;
  int scale;
  boolean justEaten = false;
  
  Snake(int s) {
    scale = s;
    w = floor(width/scale);
    h = floor(height/scale);
    PVector startPos = new PVector(floor(random(w)), floor(random(h)));
    direction = floor(random(4));
    body.add(startPos);
  }
  
  int getLength(){
   return body.size(); 
  }

  //come up with a better way to do this
  void changeDirection(int direc) {
    if (direc < 0  || direc >3) {
      return;
    }
    if (direc == up && direction == down) {
      return;
    }
    if (direc == down && direction == up) {
      return;
    }
    if (direc == left && direction == right) {
      return;
    }
    if (direc == right && direction == left) {
      return;
    }

    direction = direc;
  }

  boolean eat(Food f) {
    PVector head = body.get(0).copy();
    if(f.pos.x == head.x && f.pos.y == head.y){
      justEaten = true;
      return true;
    }
    return false;
  }
  
  void die(){
    PVector startPos = body.get(0).copy();
    body.clear();
    body.add(startPos);
  }
  
  void update() {
    if(justEaten){
      PVector tail = body.get(body.size()-1).copy();
      body.add(tail);
      justEaten = false;
    }
    for (int i = body.size() -1; i > 0; i --) {
      PVector section = body.get(i - 1).copy();
      body.set(i, section.copy());
    }

    PVector nextPos = body.get(0);

    if (direction == up) {
      nextPos.y -=1;
      if (nextPos.y < 0) {
        nextPos.y = h - 1;
      }
    } else if (direction == left) {
      nextPos.x -= 1;
      if (nextPos.x < 0) {
        nextPos.x = w - 1;
      }
    } else if (direction == down) {      
      nextPos.y += 1;
      if (nextPos.y >=  h) {
        nextPos.y = 0;
      }
    } else if (direction == right) {
      nextPos.x +=1;
      if (nextPos.x >= w) {
        nextPos.x = 0;
      }
    }
    
    //check if body crosses itself
    for(int i = body.size() - 1; i > 0; i --){
      PVector section = body.get(i);
      if(section.x == nextPos.x && section.y == nextPos.y){
        die();
        break;
      }
    }

    body.set(0, nextPos);
  }

  void show() {
    pushStyle();
     
    for (int i = body.size() -1; i >=0; i --) {
      PVector section = body.get(i);
      int grey = floor(map(i, 0, body.size(), 255, 100));
      fill(grey);
      rect(section.x * scale, section.y * scale, scale, scale);
    }

    update();
    popStyle();
  }
}