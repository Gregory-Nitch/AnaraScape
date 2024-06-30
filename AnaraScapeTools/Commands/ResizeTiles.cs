
using Library59.ImageProcessing;

namespace AnaraScapeTools.Commands;

public class ResizeTiles : IToolCommand
{
    public void Job()
    {
        Console.WriteLine("Tile output scale (0.1 - 0.9)||> ");
        bool validScale = false;
        double scale = 0.0;
        while (!validScale)
        {
            if (!double.TryParse(Console.ReadLine(), out scale))
            {
                Console.WriteLine("ERR: Invalid scale input...");
            }
            else
            {
                if (scale > 0.9 || scale < 0.1)
                {
                    Console.WriteLine("ERR: Invalid scale input...");
                }
                else
                {
                    validScale = true;
                }
            }
        }

        string[] images = Directory.GetFileSystemEntries("./TileStaging"); // In exe directory
        foreach (string img in images)
        {
            string outPath = img.Replace("./TileStaging/", "./ResizedTilesOut/");
            JpegResizer.ResizeImgAndSaveToJpeg(img, outPath, scale);
        }
    }
}
