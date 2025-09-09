/**
 * Example for library 'ColorMaps from Matplotlib'.
 *
 * See https://skaringa.github.io/colormaps-mpl/
 * 
 * This sketch generates a sheet with all available colormaps.
 */
 
// Import the library
import de.kompf.colormapsmpl.*;

// Instantiate the colormap registry
ColorMapRegistry creg = new ColorMapRegistry();

float h = 20;
float wi = 200;
float tl = 80;

/**
 * Setup.
 */
void setup() {
  size(1000, 1000);

  noStroke();
  background(190, 190, 190);
  noLoop();  // Run once and stop
}

/**
 * Draw the name and all colors of a colormap.
 * @param mapName The name of the colormap.
 * @param x0 The x position to start drawing.
 * @param y0 The y position to start drawing.
 */
void drawColormap(String mapName, float x0, float y0) {
  fill(0);
  text(mapName, x0+tl, y0+15);
  String[] names = creg.getAllNamesSorted();
  float y = y0+25;
  for (String name : names) {
    // Retrieve a colormap by its name
    ColorMap cmap = creg.getColorMap(name);
    float x = x0+tl;
    float w = wi/cmap.size();
    fill(0);
    // Draw the colormap's name
    text(cmap.getName(), x0+10, y+h/2);
    // Iterate through the colormap
    for (int i = 0; i < cmap.size(); ++i) {
      // Retrieve a color from the colormap and use it as fill color
      fill(cmap.getColor(i));
      rect(x, y, w+1, h);
      x+=w;
     }
     y+=(h+5);
  }
}

/**
 * Draw.
 */
void draw() {
  // Register one colormap category
  creg.registerCategorySequential();
  // Draw the colormap:
  drawColormap("Sequential", 0, 0);
  // Clear the colormap registry
  creg.clear();
  
  // Register the next colormap category...
  creg.registerCategorySequential2();
  drawColormap("Sequential 2", width/3, 0);
  creg.clear();
  
  creg.registerCategoryDiverging();
  drawColormap("Diverging",  2*width/3, 0);
  creg.clear();

  creg.registerCategoryQualitative();
  drawColormap("Qualitative", 0, height/2);
  creg.clear();

  creg.registerCategoryMiscellaneous();
  drawColormap("Miscellaneous", width/3, height/2);
  creg.clear();
  
  creg.registerCategoryPerceptuallyUniformSequential();
  drawColormap("Perceptually uniform sequential", 2*width/3, height/2);
  creg.clear();
  
  creg.registerCategoryCyclic();
  drawColormap("Cyclic", 2*width/3, 2*height/3);
  creg.clear();
}