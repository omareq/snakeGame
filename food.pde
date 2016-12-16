
class Food {
  int scale; 
  int w, h;
  PVector pos;

  Food(int s) {
    scale = s;
    w = floor(width / scale) - 1;
    h = floor(height/ scale) - 1;

    pos = new PVector(random(w), random(h));
  }

  void show() {
    pushStyle();
    fill(255, 0, 0);
    rect(pos.x * scale, pos.y*scale, scale, scale);
    popStyle();
  }
}