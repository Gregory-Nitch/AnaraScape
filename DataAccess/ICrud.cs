using DataAccess.Models;

namespace DataAccess
{
    public interface ICrud
    {
        void InsertTile(DungeonTileModel tile);
        void DeleteAllTiles();
    }
}