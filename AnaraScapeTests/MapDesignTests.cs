using Xunit;
using MapDesignLibrary;
using DataAccess.Models.DungeonModels;

namespace AnaraScapeTests;

public class MapDesignTests
{
    private static readonly uint PermutationCount = 100;

    /// <summary>
    /// Tests if invalid constructor parameters properly throw on object construction.
    /// </summary>
    /// <param name="height">height of map</param>
    /// <param name="width">width of map</param>
    /// <param name="style">style of the map</param>
    /// <param name="level">level of the map</param>
    /// <param name="needStairs">bool if the map needs stairs going down to next level</param>
    /// <param name="DBTiles">dungeon tile objects used to build the map
    /// (the null for all tests is ok as the collection is tested last)</param>
    [Theory]
    [InlineData(0, 3, "fort", "top", false, null)]
    [InlineData(3, 0, "fort", "top", false, null)]
    [InlineData(3, 21, "fort", "top", false, null)]
    [InlineData(21, 3, "fort", "top", false, null)]
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

    /// <summary>
    /// Loads all tiles that match a style in a given directory into a list.
    /// </summary>
    /// <param name="targetStyle">style that all tiles should conform to</param>
    /// <returns>list of Dungeon Tiles that match a particular style in the given directory
    /// </returns>
    private static List<DungeonTileModel> LoadTilesForTest(string targetStyle)
    {
        // Images from web app static files directory
        string[] images = Directory.GetFileSystemEntries(
            "../../../../AnaraScapeWeb/wwwroot/static/Tiles");
        List<DungeonTileModel> tiles = [];

        for (int i = 0; i < images.Length; i++)
        {
            images[i] = images[i].Replace("../../../../AnaraScapeWeb/wwwroot/static/Tiles", "")
                .Replace(".jpg", "");
        }

        int id = 1;
        foreach (string image in images)
        {
            string[] imageData = image.Split('^');
            string name = imageData[0];
            string style = imageData[1];
            List<string> connections = [.. imageData[2].Split(',')];
            string isEntranceText = imageData[3];
            string isStairs = imageData[4];

            // Validate|sanitize data
            style = style.ToLower();

            if (!style.Equals(targetStyle))
            {// Skip non style conforming tiles
                continue;
            }

            connections.Sort();
            bool connectionsFailed = false;
            foreach (var c in connections)
            {
                if (c.Length > 2)
                {
                    connectionsFailed = true;
                    break;
                }
            }
            if (connectionsFailed)
            {
                continue;
            }

            if (!bool.TryParse(isEntranceText, out bool isEntrance))
            {
                continue;
            }

            isStairs = isStairs.ToLower();
            if (isStairs != "up" && isStairs != "down" && isStairs != "false")
            {
                continue;
            }

            StoredDungeonTileModel tile = new(
                id,
                name,
                style,
                string.Join(",", connections),
                isEntrance,
                isStairs,
                image + ".jpg" // Add file extention
                );

            DungeonTileModel trueTile = new(tile);

            tiles.Add(trueTile);
            id++;
        }

        return tiles;
    }

    /// <summary>
    /// Tests for map design flaws by making designs based on various states. This count is
    /// determined by this test class' Permutations attribute. NOTE that this does not mean the 
    /// designer is bug free, only that the tests did not find a bug on the particular test run.
    /// Either up the permutation count or use the CLI map design tool for large iterations of 
    /// testing.
    /// </summary>
    /// <param name="height">height of the map</param>
    /// <param name="width">width of the map</param>
    /// <param name="style">style of the map</param>
    /// <param name="level">level of the map</param>
    /// <param name="needStairs">bool which indicates if a map design should have stairs down
    /// to the next level</param>
    [Theory]
    [InlineData(2, 2, "fort", "top", false)]
    [InlineData(3, 3, "fort", "top", false)]
    [InlineData(4, 4, "fort", "top", false)]
    [InlineData(5, 5, "fort", "top", false)]
    [InlineData(10, 10, "fort", "top", false)]
    [InlineData(20, 20, "fort", "top", false)]
    [InlineData(2, 20, "fort", "top", false)]
    [InlineData(20, 2, "fort", "top", false)]
    [InlineData(2, 2, "fort", "top", true)]
    [InlineData(3, 3, "fort", "top", true)]
    [InlineData(4, 4, "fort", "top", true)]
    [InlineData(5, 5, "fort", "top", true)]
    [InlineData(10, 10, "fort", "top", true)]
    [InlineData(20, 20, "fort", "top", true)]
    [InlineData(20, 2, "fort", "top", true)]
    [InlineData(2, 20, "fort", "top", true)]
    [InlineData(2, 2, "fort", "middle", true)]
    [InlineData(3, 3, "fort", "middle", true)]
    [InlineData(4, 4, "fort", "middle", true)]
    [InlineData(5, 5, "fort", "middle", true)]
    [InlineData(10, 10, "fort", "middle", true)]
    [InlineData(20, 20, "fort", "middle", true)]
    [InlineData(2, 20, "fort", "middle", true)]
    [InlineData(20, 2, "fort", "middle", true)]
    [InlineData(2, 2, "fort", "bottom", false)]
    [InlineData(3, 3, "fort", "bottom", false)]
    [InlineData(4, 4, "fort", "bottom", false)]
    [InlineData(5, 5, "fort", "bottom", false)]
    [InlineData(10, 10, "fort", "bottom", false)]
    [InlineData(20, 20, "fort", "bottom", false)]
    [InlineData(2, 20, "fort", "bottom", false)]
    [InlineData(20, 2, "fort", "bottom", false)]
    public void TestMapDesigner(int height,
                                int width,
                                string style,
                                string level,
                                bool needStairs)
    {
        List<DungeonTileModel> Tiles = LoadTilesForTest(style);
        Assert.NotEmpty(Tiles);
        MapDesigner designer = new(height, width, style, level, needStairs, Tiles);
        for (int i = 0; i < PermutationCount; i++)
        {
            designer.Generate();
        }
    }
}