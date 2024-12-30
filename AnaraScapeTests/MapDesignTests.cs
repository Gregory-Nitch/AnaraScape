using Xunit;
using MapDesignLibrary;
using DataAccess.Models.DungeonModels;

namespace AnaraScapeTests;

public class MapDesignTests
{
    private static readonly uint PermutationCount = 100;

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

    [Theory]
    [InlineData(2, 2, "fort", "top", false, -1)]
    [InlineData(3, 3, "fort", "top", false, -1)]
    [InlineData(4, 4, "fort", "top", false, -1)]
    [InlineData(5, 5, "fort", "top", false, -1)]
    [InlineData(10, 10, "fort", "top", false, -1)]
    [InlineData(20, 20, "fort", "top", false, -1)]
    [InlineData(2, 20, "fort", "top", false, -1)]
    [InlineData(20, 2, "fort", "top", false, -1)]
    [InlineData(2, 2, "fort", "top", true, -1)]
    [InlineData(3, 3, "fort", "top", true, -1)]
    [InlineData(4, 4, "fort", "top", true, -1)]
    [InlineData(5, 5, "fort", "top", true, -1)]
    [InlineData(10, 10, "fort", "top", true, -1)]
    [InlineData(20, 20, "fort", "top", true, -1)]
    [InlineData(20, 2, "fort", "top", true, -1)]
    [InlineData(2, 20, "fort", "top", true, -1)]
    [InlineData(2, 2, "fort", "middle", true, -1)]
    [InlineData(3, 3, "fort", "middle", true, -1)]
    [InlineData(4, 4, "fort", "middle", true, -1)]
    [InlineData(5, 5, "fort", "middle", true, -1)]
    [InlineData(10, 10, "fort", "middle", true, -1)]
    [InlineData(20, 20, "fort", "middle", true, -1)]
    [InlineData(2, 20, "fort", "middle", true, -1)]
    [InlineData(20, 2, "fort", "middle", true, -1)]
    [InlineData(2, 2, "fort", "bottom", false, -1)]
    [InlineData(3, 3, "fort", "bottom", false, -1)]
    [InlineData(4, 4, "fort", "bottom", false, -1)]
    [InlineData(5, 5, "fort", "bottom", false, -1)]
    [InlineData(10, 10, "fort", "bottom", false, -1)]
    [InlineData(20, 20, "fort", "bottom", false, -1)]
    [InlineData(2, 20, "fort", "bottom", false, -1)]
    [InlineData(20, 2, "fort", "bottom", false, -1)]
    public void TestMapDesigner(int height,
                                int width,
                                string style,
                                string level,
                                bool needStairs,
                                int expected)
    {
        List<DungeonTileModel> Tiles = LoadTilesForTest(style);
        Assert.NotEmpty(Tiles);
        MapDesigner designer = new(height, width, style, level, needStairs, Tiles);
        for (int i = 0; i < PermutationCount; i++)
        {
            MapDesign design = designer.Generate();
            foreach (var row in design.DisplayMatrix)
            {
                foreach (var col in row)
                {
                    Assert.NotEqual(col, expected);
                }
            }
        }
    }
}