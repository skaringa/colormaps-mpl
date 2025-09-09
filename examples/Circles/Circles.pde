/**
 * Example for library 'ColorMaps from Matplotlib'.
 *
 * See https://skaringa.github.io/colormaps-mpl/
 * 
 * This sketch draws some circles and fills them with colors from a colormap.
 */

// Import the library
import de.kompf.colormapsmpl.*;

// Instantiate the colormap registry
ColorMapRegistry creg = new ColorMapRegistry();

// radius of a circle
float radius = 180;
// number of circles
int steps = 40;

// Choose one nice colormap.
// For a list of available colormaps see https://skaringa.github.io/colormaps-mpl/reference.html
// or run the example 'ColorMapsReference'.
String colormap = "hsv";
//String colormap = "twilight";
//String colormap = "prism";

/**
 * Setup.
 */
void setup() {
  size(800, 800, JAVA2D);
  colorMode(RGB, 255);
  
  // Register all colormaps in the registry
  creg.registerAllCategories();
  
  noLoop();  // Run once and stop
}

/**
 * Draw.
 */
void draw() {
  ColorMap cmap = creg.getColorMap(colormap);

  float x0 = width/2.;
  float y0 = height/2.;
  float da = 2*PI/steps;
  
  // draw the circle's fill colors
  noStroke();
  for (int i = 0; i < steps; ++i) {
  	// Map the data range of i to the number of available colors
    int icol = (int)map(i, 0, steps-1, 0., cmap.size()-1);
    // Retrieve a color from the colormap and use it as fill color
    fill(cmap.getColor(icol));
    float a = i*da;
    float x = radius * cos(a);
    float y = radius * sin(a);
    circle(x0+x, y0+y, 2*radius);
  }
  
  // draw the circle's borders
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
