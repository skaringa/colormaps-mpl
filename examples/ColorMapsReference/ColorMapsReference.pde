import de.kompf.colormapsmpl.*;

ColorMapRegistry creg = new ColorMapRegistry();

float h = 20;
float wi = 200;
float tl = 80;

void setup() {
  size(1000, 1000);

  noStroke();
  noLoop();  // Run once and stop
}

void drawColormap(String mapName, float x0, float y0) {
  fill(0);
  text(mapName, x0+tl, y0+15);
  String[] names = creg.getAllNamesSorted();
  float y = y0+25;
  for (String name : names) {
    ColorMap cmap = creg.getColorMap(name);
    float x = x0+tl;
    float w = wi/cmap.size();
    fill(0);
    text(cmap.getName(), x0+10, y+h/2);
    for (int i = 0; i < cmap.size(); ++i) {
      fill(cmap.getColor(i));
      rect(x, y, w+1, h);
      x+=w;
     }
     y+=(h+5);
  }
}

void draw() {
  creg.registerCategorySequential();
  drawColormap("Sequential", 0, 0);
  creg.clear();
  
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
