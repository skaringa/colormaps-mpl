package de.kompf.colormapsmpl;

/**
 * A color map.
 *
 * It consists of a name and all of its colors.
 * Each color is a 32 bit value ordered as AAAAAAAARRRRRRRRGGGGGGGGBBBBBBBB.
 */
public class ColorMap {
  private String name;
  private int[] colors;
  
  /**
   * Construct a color map.
   * @param name The name of the color map.
   * @param colors The array of color values.
   */
  public ColorMap(String name, int[] colors) {
    this.name = name;
    this.colors = colors;
  }
  
  /**
   * Get the name of the color map.
   * @return The name.
   */
  public String getName() {
    return name;
  }
  
  /**
   * Get the size (number of colors) of the color map.
   * @return The size.
   */
  public int size() {
    return colors.length;
  }
  
  /**
   * Get the color for a given index.
   * @param index The index from 0 to size-1.
   * @return The color as 32 bit value.
   */
  public int getColor(int index) {
    return colors[index];
  }
}
