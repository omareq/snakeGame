Snake snake;
Food food;
int prevLength;
int timeDelay;
int timeStep;
int minTimeDelay;
int growStep;

void setup() {
  //size(600, 600);
  fullScreen();
  prevLength = 1;
  timeDelay = 75;
  timeStep = 5;
  minTimeDelay = 40;
  growStep = 5;
  int scale = 20;
  snake = new Snake(scale);
  food = new Food(scale);
}

void draw() {
  background(0);
  food.show();
  if (snake.eat(food)) {
    food.newLocation();
  }
  snake.show();
  
  if(prevLength < snake.getLength() && snake.getLength() % growStep == 0){
    timeDelay -= timeStep;
    println("Changing time dealy to: " + str(timeDelay));
    if(timeDelay < minTimeDelay){
      timeDelay = minTimeDelay;
      }
  }
  delay(timeDelay);
}

void keyPressed() {
  if (keyCode == UP) {
    snake.changeDirection(snake.up);
  } else if (keyCode == LEFT) {
    snake.changeDirection(snake.left);
  } else if (keyCode == DOWN) {
    snake.changeDirection(snake.down);
  } else if (keyCode == RIGHT) {
    snake.changeDirection(snake.right);
  }
}