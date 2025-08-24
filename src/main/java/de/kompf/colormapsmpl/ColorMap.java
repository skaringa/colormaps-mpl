package de.kompf.colormapsmpl;

public class ColorMap {
  private String name;
  private int[] colors;
  
  public ColorMap(String name, int[] colors) {
    this.name = name;
    this.colors = colors;
  }
  
  public String getName() {
    return name;
  }
  
  public int size() {
    return colors.length;
  }
  
  public int getColor(int index) {
    return colors[index];
  }
}
