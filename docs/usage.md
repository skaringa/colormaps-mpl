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

The argument **val** must no exceed the range of ```0``` to ```cmap.size()-1```. For most colormaps, this is the range from 0 to 255 (inclusive). However, colormaps from the _Qualitative_ category often have fewer colors, so be sure to use Processing's  ```map``` function to map your data range to the number of available colors..

The result is a 32-bit value ordered as AAAAAAAARRRRRRRRGGGGGGGGBBBBBBBB, which can be fed directly into Processing's ```fill```, ```stroke``` or ```background``` functions, if the default **RGB** color model is active.

**Example usage:**

For example, if we have a variable ```val``` with values in the range ```minVal..maxVal``` and want to represent this variable as a fill color, we would use:

    colorMode(RGB); // can be omitted as this is the default setting
    
    int icol = (int)map(val, minVal, maxVal, 0, cmap.size()-1);
    fill(cmap.getColor(icol));
