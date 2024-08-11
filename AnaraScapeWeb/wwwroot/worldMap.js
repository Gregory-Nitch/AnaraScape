// Used for Blazor JSInterOp
class WorldMapComponent {
    static requestWorldMap = (mapFilename) => {
        WMObj.init(mapFilename);
        WMObj.addCanvasEvents();
    };
}

window.WorldMapComponent = WorldMapComponent;
let WMObj = {

    MAX_ZOOM: 2,
    ZOOM_SENS: 0.00005,

    init: function(mapFilename) {
        WMObj.mapImg = new Image();
        WMObj.mapImg.src = mapFilename;
        WMObj.canvas = document.getElementById("geomap-canvas");
        WMObj.canvasContext = WMObj.canvas.getContext("2d");
        WMObj.canvas.width = window.innerWidth * .85;
        WMObj.canvas.height = window.innerHeight * .6;
        WMObj.clickedLoc = { x: null, y: null };
        WMObj.canvasCamOffset = { x: WMObj.canvas.width / 2, y: WMObj.canvas.height / 2 };
        WMObj.draggingMap = false;
        WMObj.dragStart = { x: 0, y: 0 };
        WMObj.mapImg.onload = function () {
            WMObj.zoom = WMObj.canvas.height / WMObj.mapImg.naturalHeight;
            WMObj.MIN_ZOOM = WMObj.zoom;
            WMObj.drawCord = { 
                x: -(WMObj.mapImg.naturalWidth / 2), 
                y: -(WMObj.mapImg.naturalHeight / 2) 
            };
            WMObj.draw();
        };
    },

    addCanvasEvents: function () {
        WMObj.canvas.addEventListener("wheel", (evt) =>
            WMObj.adjustZoom(evt, evt.deltaY * WMObj.ZOOM_SENS));
        WMObj.canvas.addEventListener("mousedown", WMObj.onPointerDown);
        WMObj.canvas.addEventListener("mousemove", WMObj.onPointerMove)
        WMObj.canvas.addEventListener("mouseup", WMObj.onPointerUp);
    },

    draw: function () {
        // Resize to keep dimensions based on window
        WMObj.canvas.width = window.innerWidth * .85;
        WMObj.canvas.height = window.innerHeight * .6;

        // Clear canvas for next frame
        WMObj.canvasContext.fillRect(0, 0, WMObj.canvas.width, WMObj.canvas.height);

        // Move to center of map & set zoom
        WMObj.canvasContext.translate(WMObj.canvas.width / 2, WMObj.canvas.height / 2);
        WMObj.canvasContext.scale(WMObj.zoom, WMObj.zoom);
        WMObj.canvasContext.translate(-WMObj.canvas.width / 2 + WMObj.canvasCamOffset.x,
            -WMObj.canvas.height / 2 + WMObj.canvasCamOffset.y);

        // Redraw
        WMObj.canvasContext.drawImage(WMObj.mapImg, WMObj.drawCord.x, WMObj.drawCord.y);

        // Get next frame
        requestAnimationFrame(WMObj.draw);
    },

    adjustZoom: function (evt, zoomAmnt) {
        evt.preventDefault();
        if (WMObj.zoom > .35) {
            WMObj.zoom += zoomAmnt * 2;
        } else {
            WMObj.zoom += zoomAmnt;
        }

        WMObj.zoom = Math.min(WMObj.zoom, WMObj.MAX_ZOOM);
        WMObj.zoom = Math.max(WMObj.zoom, WMObj.MIN_ZOOM);
    }, 

    onPointerDown: function (evt) {
        evt.preventDefault();
        WMObj.draggingMap = true;
        WMObj.dragStart.x = evt.clientX / WMObj.zoom - WMObj.canvasCamOffset.x;
        WMObj.dragStart.y = evt.clientY / WMObj.zoom - WMObj.canvasCamOffset.y;
    },

    onPointerMove: function (evt) {
        evt.preventDefault();
        if (WMObj.draggingMap) {

            // Keep a portion of the map in the canvas at all times.
            let newX = evt.clientX / WMObj.zoom - WMObj.dragStart.x;
            let newY = evt.clientY / WMObj.zoom - WMObj.dragStart.y;
            if (newX - WMObj.canvas.width / 2 < -WMObj.mapImg.naturalWidth / 2 ||
                newX - WMObj.canvas.width / 2 > WMObj.mapImg.naturalWidth / 2 ||
                newY - WMObj.canvas.height / 2 < -WMObj.mapImg.naturalHeight / 2 ||
                newY - WMObj.canvas.height / 2 > WMObj.mapImg.naturalHeight / 2) {
                return;
            }

            // Move map
            WMObj.canvasCamOffset.x = newX;
            WMObj.canvasCamOffset.y = newY;
        }
    },

    onPointerUp: function (evt) {
        evt.preventDefault();
        WMObj.draggingMap = false;
    },
};
