# Usage

**Import the library:**

    import de.kompf.colormapsmpl.*;

**Instantiate the colormap registry:**

    ColorMapRegistry creg = new ColorMapRegistry();

**Register one or multiple colormap categories:**

    creg.registerCategorySequential();
  
    creg.registerCategorySequential2();
  
    creg.registerCategoryDiverging();
  
    creg.registerCategoryQualitative();
 
    creg.registerCategoryMiscellaneous();
  
    creg.registerCategoryPerceptuallyUniformSequential();
  
    creg.registerCategoryCyclic();

**It is also possible to register all colormaps at once:**

    creg.registerAllCategories();

For a deeper explanation of the colormaps, see [Choosing Colormaps in Matplotlib](https://matplotlib.org/stable/users/explain/colors/colormaps.html#colormaps).

**Retrieve a color map by its name:**

    ColorMap cmap = creg.getColorMap("Blues");

For a reference of all names see this [reference](reference.md). All names that are currently registered in the ColorMapRegistry may be retrieved with:

    creg.getAllNames();

**Retrieve and use the colors:**

To retrieve the color for value **val**:

    int color = cmap.getColor(val);

Take care to map your data range into the number of available colors, e.g.

    int icol = (int)map(val, minVal, maxVal, 0, cmap.size()-1);
    fill(cmap.getColor(icol));
