Snake snake;
Food food;

void setup(){
  size(600, 600);
  snake = new Snake(20);
  food = new Food(20);
  frameRate(30);
}

void draw(){
  background(0);
  food.show();
  snake.eat(food);
  snake.show();
  delay(100);
}

void keyPressed(){
 if(keyCode == UP){
   snake.changeDirection(snake.up);
 }
 else if(keyCode == LEFT){
   snake.changeDirection(snake.left);
 }
 else if(keyCode == DOWN){
   snake.changeDirection(snake.down);
 }
 else if(keyCode == RIGHT){
   snake.changeDirection(snake.right);
 }
}