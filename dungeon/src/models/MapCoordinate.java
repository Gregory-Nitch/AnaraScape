
package models;

/**
 * This class represents sections of the map to be worked upon by the
 * MapDesigner
 */
public class MapCoordinate implements Comparable<MapCoordinate> {
    private short column;
    private short row;

    /**
     * Constructs a MapCoordintate that represents a section of the map based on the
     * passed parameters
     * 
     * @param row    row(y) of the coordinate
     * @param column column(x) of the coordinate
     */
    public MapCoordinate(short row, short column) {
        this.row = row;
        this.column = column;
    }

    /**
     * Gets the coordinate's column(x)
     * 
     * @return the coorindate's column
     */
    public short getColumn() {
        return column;
    }

    /**
     * Gets the coordinate's row(y)
     * 
     * @return the coordinate's row
     */
    public short getRow() {
        return row;
    }

    /**
     * Sets the coordinate's column(x)
     * 
     * @param column new column for the coordinate
     */
    public void setColumn(short column) {
        this.column = column;
    }

    /**
     * Sets the coordinate's row(y)
     * 
     * @param row new row for the coordinate
     */
    public void setRow(short row) {
        this.row = row;
    }

    @Override
    public String toString() {
        return "(" + this.row + ", " + this.column + ")";
    }

    @Override
    public int compareTo(MapCoordinate other) {

        if (this.column > other.column ||
                (this.column == other.column && this.row > other.row)) {
            return 1;
        } else if (this.column < other.column ||
                (this.column == other.column && this.row < other.row)) {
            return -1;
        }

        return 0;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null || this.getClass() != obj.getClass()) {
            return false;
        } else if (this == obj) {
            return true;
        }

        MapCoordinate other = (MapCoordinate) obj;

        return this.column == other.column && this.row == other.row;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        int prime = 59;
        hash = prime * hash + column;
        hash = prime * hash + row;
        return hash;
    }
}