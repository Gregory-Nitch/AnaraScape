using DataAccess.Models;

namespace DataAccess
{
    public interface ICrud
    {
        void InsertTile(LoadingDungeonTileModel tile);
        void DeleteAllTiles();
        public List<StoredDungeonTileModel> GetAllTiles();
    }
}