package exceptions;

/**
 * Represents an exceptional state where no dungeon tiles could be found given
 * the passed paramteres
 */
public class NoTilesMatchedException extends Exception {

    /**
     * Constructs a new exception for when a tile could not be matched.
     * 
     * @param message error message to display
     */
    public NoTilesMatchedException(String message) {
        super(message);
    }
}
