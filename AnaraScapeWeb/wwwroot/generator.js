
// Used to call non static methods on map generator component instance
class MapGenComponent {
    static ref;

    static getMapGenCompReference = (mapGenCompRef) => {
        MapGenComponent.ref = mapGenCompRef;
    };

    // Gets map Design data from server
    static requestMapDesign = () => {
        this.displayProcessingOverlay(true, "Loading...");
        MapGenComponent.ref.invokeMethodAsync("SendDesignAsync")
            .then(mapDesign => {
                MGObj.displayMatrix = [];
                MGObj.tileMatrix = [];
                for (let i = 0; i < mapDesign.displayMatrix.length; i++) {
                    let displayRow = [];
                    let tileRow = [];
                    for (let j = 0; j < mapDesign.displayMatrix[i].length; j++) {
                        displayRow.push(mapDesign.displayMatrix[i][j]);
                        let tileCol = [];
                        for (let k = 0; k < mapDesign.tileMatrix[i][j].length; k++) {
                            tileCol.push(mapDesign.tileMatrix[i][j][k]);
                        }
                        tileRow.push(tileCol);
                    }
                    MGObj.displayMatrix.push(displayRow);
                    MGObj.tileMatrix.push(tileRow);
                }

                MGObj.imageMap = mapDesign.imageMap;
                MGObj.mapWidth = MGObj.displayMatrix[0].length;
                MGObj.mapHeight = MGObj.displayMatrix.length;
                MGObj.initMapGenPageState();
                MGObj.loadTiles();
                MGObj.addMapWrapperEvents();
                MGObj.initMap();
                MGObj.drawMap();
                this.confirmImagesLoaded();
            });
    };

    static requestMapDownload = () => {
        this.displayProcessingOverlay(true, "Downloading...");

        // Create temp canvas for drawing
        let tmpCanvas = document.createElement("canvas");
        let tmpCvsContext = tmpCanvas.getContext("2d");
        tmpCanvas.width = MGObj.BASE_TILE_SIZE * MGObj.mapWidth;
        tmpCanvas.height = MGObj.BASE_TILE_SIZE * MGObj.mapHeight;

        // Draw current rendered map to it
        let tmpX = 0;
        let tmpY = 0;
        for (const row of MGObj.displayMatrix) {
            for (const tileId of row) {
                tmpCvsContext.drawImage(MGObj.renderingTiles[tileId], tmpX, tmpY);
                tmpX += MGObj.BASE_TILE_SIZE;
            }
            tmpX = 0;
            tmpY += MGObj.BASE_TILE_SIZE;
        }

        // Create blob and download
        tmpCanvas.toBlob(async (blob) => {
            
            // If blob is null its too big for the browser
            if (blob == null) {
                await MapGenComponent.ref.invokeMethodAsync(
                    "SendImageBlobAsync",
                    MGObj.displayMatrix).then(blobFromServer => {
                        blob = new Blob([blobFromServer], { type: "image/png" });
                });
            }

            let link = await document.createElement("a");
            link.href = await window.URL.createObjectURL(blob);
            link.download = await "AnaraScape-Dungeon-" + MGObj.mapWidth + "x" + MGObj.mapHeight;
            link.style.display = await "none";
            await document.body.appendChild(link);
            link.click();

            // Remove added elements
            await URL.revokeObjectURL(link.href);
            link.remove();
            tmpCanvas.remove();
            this.displayProcessingOverlay(false, "");
        }, "image/png");
    };

    static displayProcessingOverlay = (needToDisplay, msg) => {
        let procDiv = document.getElementById("processing-overlay-div");
        let procMsg = document.getElementById("processing-message");
        if (needToDisplay) {
            procDiv.style.display = "flex";
            procMsg.innerHTML = msg;
        } else {
            procDiv.style.display = "none";
        }
    };

    static confirmImagesLoaded = () => {
        Promise.all(Array.from(document.images).map(img => {
            if (img.complete) {
                return Promise.resolve(img.naturalHeight !== 0);
            }
            return new Promise(resolve => {
                img.addEventListener("load", () => resolve(true));
                img.addEventListener("error", () => resolve(false));
            });
        })).then(results => {
            if (results.every(result => result)) {
                this.displayProcessingOverlay(false, "");
            } else {
                this.displayProcessingOverlay(true, "ERR!!!");
            }
        })
    };
};

window.MapGenComponent = MapGenComponent;
let MGObj = {

    MAX_ZOOM: 2, 
    ZOOM_SENS: 0.00005,
    BASE_TILE_SIZE: 512,

    initMapGenPageState: function() {
        MGObj.MIN_ZOOM = 0.025;// Not a constant but should only be changed at map init
        MGObj.mapCanvas = document.getElementById("mapCanvas");
        MGObj.canvasContext = mapCanvas.getContext("2d");
        MGObj.mapOverlay = document.getElementById("mapOverlay");
        MGObj.mapWrapper = document.getElementById("mapWrapper");
        MGObj.clickedLoc = { x: null, y: null };
        MGObj.zoom = 0.3;
        MGObj.canvasCamOffset = { x: window.innerWidth / 2, y: window.innerHeight / 2 };
        MGObj.draggingMap = false;
        MGObj.dragStart = { x: 0, y: 0, divX: 0, divY: 0 };
        MGObj.mapCanvas.height = window.innerHeight;
        MGObj.mapCanvas.width = window.innerWidth;
        MGObj.winCntrX = null;
        MGObj.winCntrY = null;
        MGObj.scaleTileSize = null;
        MGObj.scaleMapSizeX = null;
        MGObj.scaleMapSizeY = null;
        MGObj.mapStartX = null;
        MGObj.mapStartY = null;
        MGObj.waitForMap = false;
        MGObj.renderingTiles = {};
        MGObj.mapScaler = 0;
        MGObj.winScaler = 0;
        MGObj.DivStartX = 0;
        MGObj.DivStartY = 0;
    },

    addMapWrapperEvents: function() {
        MGObj.mapWrapper.addEventListener("wheel", (evt) =>
            MGObj.adjustZoom(evt.deltaY * MGObj.ZOOM_SENS));
        MGObj.mapWrapper.addEventListener("mousedown", MGObj.onPointerDown);
        MGObj.mapWrapper.addEventListener("mousemove", MGObj.onPointerMove)
        MGObj.mapWrapper.addEventListener("mouseup", MGObj.onPointerUp);
        window.addEventListener("resize", (evt) => MGObj.resizeCanvas());
    },

    addColumnListeners: function() {
        let cols = document.getElementsByClassName("column");
        for (let col of cols) {
            col.addEventListener("click", MGObj.flipTile);
        }
    },

// Beginning of map gen logic
    initMap: function() {
    
        MGObj.setStartingZoom();
        
        // Get center of window
        MGObj.winCntrX = window.innerWidth / 2;
        MGObj.winCntrY = window.innerHeight / 2;
    
        // Get X & Y of map top left for div
        MGObj.scaleTileSize = MGObj.BASE_TILE_SIZE * MGObj.zoom;
        MGObj.scaleMapSizeX = MGObj.scaleTileSize * MGObj.mapWidth;
        MGObj.scaleMapSizeY = MGObj.scaleTileSize * MGObj.mapHeight;
    
        MGObj.DivStartX = MGObj.winCntrX - (MGObj.scaleMapSizeX / 2);
        MGObj.DivStartY = MGObj.winCntrY - (MGObj.scaleMapSizeY / 2);
    
        // Get start of map, center should be 0px, 0px
        MGObj.mapStartX = -(MGObj.BASE_TILE_SIZE * MGObj.mapWidth / 2);
        MGObj.mapStartY = -(MGObj.BASE_TILE_SIZE * MGObj.mapHeight / 2);
    
        // Gen Divs
        MGObj.mapOverlay.style.left = MGObj.DivStartX + "px";
        MGObj.mapOverlay.style.top = MGObj.DivStartY + "px";
        MGObj.mapOverlay.style.width = MGObj.scaleMapSizeX + "px";
        MGObj.mapOverlay.style.height = MGObj.scaleMapSizeY + "px";
        MGObj.dragStart.divX = MGObj.DivStartX;
        MGObj.dragStart.divY = MGObj.DivStartY;
    
        MGObj.setmapOverlaySizes();
        MGObj.addColumnListeners();
    },

    setStartingZoom: function() {
        // Get shortest window dimension, use it in formula
        if (window.innerHeight > window.innerWidth)
            MGObj.winScaler = window.innerWidth;
        else
            MGObj.winScaler = window.innerHeight;
    
        // Get the longest dimension of the map, use it in formula if it is hitting window width
        if (MGObj.mapWidth > MGObj.mapHeight &&
                window.innerWidth < (MGObj.mapWidth * MGObj.BASE_TILE_SIZE) *
                (MGObj.winScaler / (MGObj.mapHeight * MGObj.BASE_TILE_SIZE))) {
            MGObj.winScaler = window.innerWidth;
            MGObj.mapScaler = MGObj.mapWidth;
        }
        else {
            MGObj.mapScaler = MGObj.mapHeight;
        }
    
        /* Calcualte the starting zoom value for the canvas -> zoom = winScaler / (mapScaler * 512)
         This will set the zoom so that every portion of the generated map is visable at the start. 
         .25 gives starting padding around map and mapOverlay*/
        MGObj.zoom = MGObj.winScaler / ((MGObj.mapScaler + .25) * MGObj.BASE_TILE_SIZE);
        // Prevent zoom from going to far out based on map size
        MGObj.MIN_ZOOM = MGObj.zoom; // Not a constant but should only be changed here!
    },

    setmapOverlaySizes: function() {
        // Resizes each col and row in the mapOverlay
        let rows = document.getElementsByClassName("mapRow");
        for (let currentRow of rows) {
            currentRow.style.height = MGObj.scaleTileSize + "px";
            currentRow.style.width = MGObj.scaleMapSizeX + "px";
            for (let currentSec of currentRow.children) {
                currentSec.style.height = (MGObj.scaleTileSize * .75) + "px";
                currentSec.style.width = (MGObj.scaleTileSize * .75) + "px";
                currentSec.style.margin = (MGObj.scaleTileSize * .125) + "px";
            }
        }
    },

    loadTiles: function() {
        for (const row of MGObj.tileMatrix) {
            for (const col of row) {
                for (const id of col) {
                    MGObj.renderingTiles[id] = new Image();
                    MGObj.renderingTiles[id].src = "/static/Tiles/" + MGObj.imageMap[id];
                }
            }
        }
    },

    drawMap: function() {
        // Resize to window
        MGObj.mapCanvas.width = window.innerWidth;
        MGObj.mapCanvas.height = window.innerHeight;
    
        // Move to center of map & set zoom
        MGObj.canvasContext.translate(MGObj.winCntrX, MGObj.winCntrY)
        MGObj.canvasContext.scale(MGObj.zoom, MGObj.zoom);
        MGObj.canvasContext.translate(-MGObj.winCntrX + MGObj.canvasCamOffset.x,
            -MGObj.winCntrY + MGObj.canvasCamOffset.y);
    
        // Clear canvas for next frame
        MGObj.canvasContext.clearRect(0, 0, window.innerWidth, window.innerHeight);
    
        // Redraw map
        let imgX = MGObj.mapStartX;
        let imgY = MGObj.mapStartY;
    
        for (const row of MGObj.displayMatrix) {
            for (const tileId of row) {
                MGObj.canvasContext.drawImage(MGObj.renderingTiles[tileId],
                    imgX, imgY);
                imgX += MGObj.BASE_TILE_SIZE;
            }
            imgX = MGObj.mapStartX;
            imgY += MGObj.BASE_TILE_SIZE;
        }
        // Get next frame
        requestAnimationFrame(MGObj.drawMap);
    },

    adjustZoom: function(zoomAmnt) {
        // Get new zoom
        if (!MGObj.draggingMap)
            if (zoomAmnt)
                if (MGObj.zoom > .35)
                    MGObj.zoom += zoomAmnt * 2;// Increases sensitivity at high zoom levels
                else
                    MGObj.zoom += zoomAmnt;
    
        MGObj.zoom = Math.min(MGObj.zoom, MGObj.MAX_ZOOM);
        MGObj.zoom = Math.max(MGObj.zoom, MGObj.MIN_ZOOM);
    
        // Get new map scaling
        MGObj.scaleTileSize = MGObj.BASE_TILE_SIZE * MGObj.zoom;
        MGObj.scaleMapSizeX = MGObj.scaleTileSize * MGObj.mapWidth;
        MGObj.scaleMapSizeY = MGObj.scaleTileSize * MGObj.mapHeight;
    
        // Resize Divs, rows, cols
        MGObj.mapOverlay.style.left = ((-MGObj.winCntrX + MGObj.canvasCamOffset.x) * MGObj.zoom) +
            (MGObj.winCntrX - MGObj.scaleMapSizeX / 2) + "px";
        MGObj.mapOverlay.style.top = ((-MGObj.winCntrY + MGObj.canvasCamOffset.y) * MGObj.zoom) +
            (MGObj.winCntrY - MGObj.scaleMapSizeY / 2) + "px";
        MGObj.mapOverlay.style.width = MGObj.scaleMapSizeX + "px";
        MGObj.mapOverlay.style.height = MGObj.scaleMapSizeY + "px";
        MGObj.setmapOverlaySizes();
    },

    resizeCanvas: function() {
        MGObj.canvasCamOffset.x = window.innerWidth / 2;
        MGObj.canvasCamOffset.y = window.innerHeight / 2;
        MGObj.initMap();
    },

    onPointerDown: function(evt) {
        evt.preventDefault();
        if (evt.button == 2) {// Drag with right mouse only
            MGObj.draggingMap = true;
            MGObj.dragStart.x = evt.clientX / MGObj.zoom - MGObj.canvasCamOffset.x;
            MGObj.dragStart.y = evt.clientY / MGObj.zoom - MGObj.canvasCamOffset.y;
            MGObj.dragStart.divX = evt.clientX;
            MGObj.dragStart.divY = evt.clientY;
        };
    },

    onPointerMove: function(evt) {
        if (MGObj.draggingMap) {
            evt.preventDefault();
    
            // Move mapOverlay with map
            let transX = MGObj.dragStart.divX - evt.clientX;
            let transY = MGObj.dragStart.divY - evt.clientY;
    
            // Keep a portion of the map in the window at all times
            if (MGObj.mapOverlay.offsetLeft - transX < -MGObj.scaleMapSizeX + 200 ||
                MGObj.mapOverlay.offsetLeft - transX > window.innerWidth - 200 ||
                MGObj.mapOverlay.offsetTop - transY < -MGObj.scaleMapSizeY + 200 ||
                MGObj.mapOverlay.offsetTop - transY > window.innerHeight - 200) {
                return;
            }
    
            MGObj.dragStart.divX = evt.clientX;
            MGObj.dragStart.divY = evt.clientY;
            MGObj.mapOverlay.style.left = MGObj.mapOverlay.offsetLeft - transX + "px";
            MGObj.mapOverlay.style.top = MGObj.mapOverlay.offsetTop - transY + "px";
    
            // Move map
            MGObj.canvasCamOffset.x = evt.clientX / MGObj.zoom - MGObj.dragStart.x;
            MGObj.canvasCamOffset.y = evt.clientY / MGObj.zoom - MGObj.dragStart.y;
        }
    },

    onPointerUp: function(evt) {
        evt.preventDefault();
        MGObj.draggingMap = false;
    },

    flipTile: function(evt) {
        // Get 2d index of section
        let secId = parseInt(this.id, 10)
        let row = Math.ceil(secId / MGObj.mapWidth);
        let col = secId - (row - 1) * MGObj.mapWidth;
        // Decrement for proper array indexing
        row--;
        col--;
    
        // Get tile id of current tile
        let cTileId = MGObj.displayMatrix[row][col];
    
        // Find current tile in tileMatrix, get next tile id
        let nextTileId = cTileId;
        for (let i = 0; i < MGObj.tileMatrix[row][col].length; i++) {
            if (MGObj.tileMatrix[row][col][i] == cTileId) {
                if (i == MGObj.tileMatrix[row][col].length - 1) {
                    nextTileId = MGObj.tileMatrix[row][col][0];
                    break;
                }
                else {
                    nextTileId = MGObj.tileMatrix[row][col][i + 1];
                    break;
                }
            }
        };
    
        // Place next tile id into presenting tiles
        MGObj.displayMatrix[row][col] = nextTileId;
    }
};
