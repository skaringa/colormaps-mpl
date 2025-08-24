import de.kompf.colormapsmpl.*;

ColorMapRegistry creg = new ColorMapRegistry();

float radius = 180;
int steps = 40;
String colormap = "hsv";
//String colormap = "twilight";
//String colormap = "prism";

void setup() {
  size(800, 800, JAVA2D);
  colorMode(RGB, 255);
  creg.registerAllCategories();
  
  noLoop();  // Run once and stop
}

void draw() {
  ColorMap cmap = creg.getColorMap(colormap);

  float x0 = width/2.;
  float y0 = height/2.;
  float da = 2*PI/steps;
  
  // fill
  noStroke();
  for (int i = 0; i < steps; ++i) {
    int icol = (int)map(i, 0, steps-1, 0., cmap.size()-1);
    fill(cmap.getColor(icol));
    float a = i*da;
    float x = radius * cos(a);
    float y = radius * sin(a);
    circle(x0+x, y0+y, 2*radius);
  }
  
  // lines
  noFill();
  stroke(255, 255, 255);
  strokeWeight(2);
  for (int i = 0; i < steps; ++i) {
    float a = i*da;
    float x = radius * cos(a);
    float y = radius * sin(a);
    circle(x0+x, y0+y, 2*radius);
  }
}
