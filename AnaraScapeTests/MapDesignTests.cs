using Xunit;
using MapDesignLibrary;
using DataAccess.Models.DungeonModels;

namespace AnaraScapeTests;

public class MapDesignTests
{
    [Theory]
    [InlineData(0, 3, "fort", "top", false, null)]
    [InlineData(3, 0, "fort", "top", false, null)]
    [InlineData(3, 3, "INVALID", "top", false, null)]
    [InlineData(3, 3, "fort", "INVALID", false, null)]
    [InlineData(3, 3, "fort", "bottom", true, null)]
    [InlineData(3, 3, "fort", "bottom", false, null)] // Null ref should throw
    public void TestInvalidConstructorParameters(int height,
                                         int width,
                                         string style,
                                         string level,
                                         bool needStairs,
                                         List<DungeonTileModel> DBTiles)
    {
        Assert.Throws<MapDesignException>(() => new MapDesigner(height,
                                                                width,
                                                                style,
                                                                level,
                                                                needStairs,
                                                                DBTiles));
    }
}