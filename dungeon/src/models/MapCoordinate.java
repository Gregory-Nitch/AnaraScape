
package models;

public class MapCoordinate implements Comparable<MapCoordinate> {
    private short column;
    private short row;

    public MapCoordinate(short row, short column) {
        this.row = row;
        this.column = column;
    }

    public short getColumn() {
        return column;
    }

    public short getRow() {
        return row;
    }

    public void setColumn(short column) {
        this.column = column;
    }

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