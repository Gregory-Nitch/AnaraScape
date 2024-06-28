
// Used to call non static methods on component instance
class DotNetRef {
    static ref;

    static getBCompReference = (compRef) => {
        DotNetRef.ref = compRef;
    };

    // Gets map Design data from server
    static requestMapDesign = () => {
        this.displayProcessingOverlay(true, "Loading...");
        DotNetRef.ref.invokeMethodAsync("SendDesignAsync")
            .then(mapDesign => {
                displayMatrix = [];
                tileMatrix = [];
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
                    displayMatrix.push(displayRow);
                    tileMatrix.push(tileRow);
                }

                imageMap = mapDesign.imageMap;
                mapWidth = displayMatrix[0].length;
                mapHeight = displayMatrix.length;
                initMapGenPageState();
                loadTiles();
                addMapWrapperEvents();
                initMap();
                drawMap();
                this.confirmImagesLoaded();
            });
    };

    static requestMapDownload = () => {
        this.displayProcessingOverlay(true, "Downloading...");

        // Create temp canvas for drawing
        let tmpCanvas = document.createElement("canvas");
        let tmpCvsContext = tmpCanvas.getContext("2d");
        tmpCanvas.width = BASE_TILE_SIZE * mapWidth;
        tmpCanvas.height = BASE_TILE_SIZE * mapHeight;

        // Draw current rendered map to it
        let tmpX = 0;
        let tmpY = 0;
        for (const row of displayMatrix) {
            for (const tileId of row) {
                tmpCvsContext.drawImage(renderingTiles[tileId], tmpX, tmpY);
                tmpX += BASE_TILE_SIZE;
            }
            tmpX = 0;
            tmpY += BASE_TILE_SIZE;
        }

        // Create blob and download
        tmpCanvas.toBlob( async (blob) => {

            // If blob is null its too big for the browser
            if (blob == null) {
                await DotNetRef.ref.invokeMethodAsync("SendImageBlobAsync", displayMatrix).then(blobFromServer => {
                    blob = new Blob([blobFromServer], { type: "image/png" });
                });
            } 

            let link = await document.createElement("a");
            link.href = await window.URL.createObjectURL(blob);
            link.download = await "AnaraScape-Dungeon-" + mapWidth + "x" + mapHeight;
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
}

window.DotNetRef = DotNetRef;

// Map Design variables (to be filled on page load)
let displayMatrix;
let tileMatrix;
let imageMap;
let mapWidth;
let mapHeight;
// Setup canvas, div overlay "mapOverlay"
const MAX_ZOOM = 1;
const ZOOM_SENS = 0.0001;
const BASE_TILE_SIZE = 2048;
let MIN_ZOOM;// Not a constant but should only be changed at map init
let mapCanvas;
let canvasContext;
let mapOverlay;
let mapWrapper;
let clickedLoc;
let zoom;
let canvasCamOffset;
let draggingMap;
let dragStart;
let winCntrX;
let winCntrY;
let scaleTileSize;
let scaleMapSizeX;
let scaleMapSizeY;
let mapStartX;
let mapStartY;
let waitForMap;
let renderingTiles;
let mapScaler;
let winScaler;
let DivStartX;
let DivStartY;

function initMapGenPageState() {
    MIN_ZOOM = 0.025;// Not a constant but should only be changed at map init
    mapCanvas = document.getElementById("mapCanvas");
    canvasContext = mapCanvas.getContext("2d");
    mapOverlay = document.getElementById("mapOverlay");
    mapWrapper = document.getElementById("mapWrapper");
    clickedLoc = { x: null, y: null };
    zoom = 0.3;
    canvasCamOffset = { x: window.innerWidth / 2, y: window.innerHeight / 2 };
    draggingMap = false;
    dragStart = { x: 0, y: 0, divX: 0, divY: 0 };
    mapCanvas.height = window.innerHeight;
    mapCanvas.width = window.innerWidth;
    winCntrX = null;
    winCntrY = null;
    scaleTileSize = null;
    scaleMapSizeX = null;
    scaleMapSizeY = null;
    mapStartX = null;
    mapStartY = null;
    waitForMap = false;
    renderingTiles = {};
    mapScaler = 0;
    winScaler = 0;
    DivStartX = 0;
    DivStartY = 0;
};

function addMapWrapperEvents() {
    mapWrapper.addEventListener("wheel", (evt) => adjustZoom(evt.deltaY * ZOOM_SENS));
    mapWrapper.addEventListener("mousedown", onPointerDown);
    mapWrapper.addEventListener("mousemove", onPointerMove)
    mapWrapper.addEventListener("mouseup", onPointerUp);
    window.addEventListener("resize", (evt) => resizeCanvas());
};

function addColumnListeners() {
    let cols = document.getElementsByClassName("column");
    for (let col of cols) {
        col.addEventListener("click", flipTile);
    }
};

// Beginning of map gen logic
function initMap() {

    setStartingZoom();

    // Get center of window
    winCntrX = window.innerWidth / 2;
    winCntrY = window.innerHeight / 2;

    // Get X & Y of map top left for div
    scaleTileSize = BASE_TILE_SIZE * zoom;
    scaleMapSizeX = scaleTileSize * mapWidth;
    scaleMapSizeY = scaleTileSize * mapHeight;

    DivStartX = winCntrX - (scaleMapSizeX / 2);
    DivStartY = winCntrY - (scaleMapSizeY / 2);

    // Get start of map, center should be 0px, 0px
    mapStartX = -(BASE_TILE_SIZE * mapWidth / 2);
    mapStartY = -(BASE_TILE_SIZE * mapHeight / 2);

    // Gen Divs
    mapOverlay.style.left = DivStartX + "px";
    mapOverlay.style.top = DivStartY + "px";
    mapOverlay.style.width = scaleMapSizeX + "px";
    mapOverlay.style.height = scaleMapSizeY + "px";
    dragStart.divX = DivStartX;
    dragStart.divY = DivStartY;

    setmapOverlaySizes();
    addColumnListeners();
};

function setStartingZoom() {
    // Get shortest window dimension, use it in formula
    if (window.innerHeight > window.innerWidth)
        winScaler = window.innerWidth;
    else
        winScaler = window.innerHeight;

    // Get the longest dimension of the map, use it in formula if it is hitting window width
    if (mapWidth > mapHeight && window.innerWidth < (mapWidth * BASE_TILE_SIZE) * (winScaler / (mapHeight * BASE_TILE_SIZE))) {
        winScaler = window.innerWidth;
        mapScaler = mapWidth;
    }
    else {
        mapScaler = mapHeight;
    }

    /* Calcualte the starting zoom value for the canvas -> zoom = winScaler / (mapScaler * 2048)
     This will set the zoom so that every portion of the generated map is visable at the start. 
     .25 gives starting padding around map and mapOverlay*/
    zoom = winScaler / ((mapScaler + .25) * BASE_TILE_SIZE);
    // Prevent zoom from going to far out based on map size
    MIN_ZOOM = zoom; // Not a constant but should only be changed here!
};

function setmapOverlaySizes() {
    // Resizes each col and row in the mapOverlay
    let rows = document.getElementsByClassName("mapRow");
    for (let currentRow of rows) {
        currentRow.style.height = scaleTileSize + "px";
        currentRow.style.width = scaleMapSizeX + "px";
        for (let currentSec of currentRow.children) {
            currentSec.style.height = (scaleTileSize * .75) + "px";
            currentSec.style.width = (scaleTileSize * .75) + "px";
            currentSec.style.margin = (scaleTileSize * .125) + "px";
        }
    }
};

function loadTiles() {
    for (const row of tileMatrix) {
        for (const col of row) {
            for (const id of col) {
                renderingTiles[id] = new Image();
                renderingTiles[id].src = "/static/Tiles/" + imageMap[id];
            }
        }
    }
}

function drawMap() {
    // Resize to window
    mapCanvas.width = window.innerWidth;
    mapCanvas.height = window.innerHeight;

    // Move to center of map & set zoom
    canvasContext.translate(winCntrX, winCntrY)
    canvasContext.scale(zoom, zoom);
    canvasContext.translate(-winCntrX + canvasCamOffset.x, -winCntrY + canvasCamOffset.y);

    // Clear canvas for next frame
    canvasContext.clearRect(0, 0, window.innerWidth, window.innerHeight);

    // Redraw map
    let imgX = mapStartX;
    let imgY = mapStartY;

    for (const row of displayMatrix) {
        for (const tileId of row) {
            canvasContext.drawImage(renderingTiles[tileId],
                imgX, imgY);
            imgX += BASE_TILE_SIZE;
        }
        imgX = mapStartX;
        imgY += BASE_TILE_SIZE;
    }
    // Get next frame
    requestAnimationFrame(drawMap);
};

function adjustZoom(zoomAmnt) {
    // Get new zoom
    if (!draggingMap)
        if (zoomAmnt)
            if (zoom > .35)
                zoom += zoomAmnt * 2;// Increases sensitivity at high zoom levels
            else
                zoom += zoomAmnt;

    zoom = Math.min(zoom, MAX_ZOOM);
    zoom = Math.max(zoom, MIN_ZOOM);

    // Get new map scaling
    scaleTileSize = BASE_TILE_SIZE * zoom;
    scaleMapSizeX = scaleTileSize * mapWidth;
    scaleMapSizeY = scaleTileSize * mapHeight;

    // Resize Divs, rows, cols
    mapOverlay.style.left = ((-winCntrX + canvasCamOffset.x) * zoom) + (winCntrX - scaleMapSizeX / 2) + "px";
    mapOverlay.style.top = ((-winCntrY + canvasCamOffset.y) * zoom) + (winCntrY - scaleMapSizeY / 2) + "px";
    mapOverlay.style.width = scaleMapSizeX + "px";
    mapOverlay.style.height = scaleMapSizeY + "px";
    setmapOverlaySizes();
};

function resizeCanvas() {
    canvasCamOffset.x = window.innerWidth / 2;
    canvasCamOffset.y = window.innerHeight / 2;
    initMap();
};

function onPointerDown(evt) {
    evt.preventDefault();
    if (evt.button == 2) {// Drag with right mouse only
        draggingMap = true;
        dragStart.x = evt.clientX / zoom - canvasCamOffset.x;
        dragStart.y = evt.clientY / zoom - canvasCamOffset.y;
        dragStart.divX = evt.clientX;
        dragStart.divY = evt.clientY;
    };
}

function onPointerMove(evt) {
    if (draggingMap) {
        evt.preventDefault();

        // Move mapOverlay with map
        let transX = dragStart.divX - evt.clientX;
        let transY = dragStart.divY - evt.clientY;

        // Keep a portion of the map in the window at all times
        if (mapOverlay.offsetLeft - transX < -scaleMapSizeX + 200 ||
            mapOverlay.offsetLeft - transX > window.innerWidth - 200 ||
            mapOverlay.offsetTop - transY < -scaleMapSizeY + 200 ||
            mapOverlay.offsetTop - transY > window.innerHeight - 200) {
            return;
        }

        dragStart.divX = evt.clientX;
        dragStart.divY = evt.clientY;
        mapOverlay.style.left = mapOverlay.offsetLeft - transX + "px";
        mapOverlay.style.top = mapOverlay.offsetTop - transY + "px";

        // Move map
        canvasCamOffset.x = evt.clientX / zoom - dragStart.x;
        canvasCamOffset.y = evt.clientY / zoom - dragStart.y;
    }
};

function onPointerUp(evt) {
    evt.preventDefault();
    draggingMap = false;
}

function flipTile(evt) {
    // Get 2d index of section
    let secId = parseInt(this.id, 10)
    let row = Math.ceil(secId / mapWidth);
    let col = secId - (row - 1) * mapWidth;
    // Decrement for proper array indexing
    row--;
    col--;

    // Get tile id of current tile
    let cTileId = displayMatrix[row][col];


    // Find current tile in tileMatrix, get next tile id
    let nextTileId = cTileId;
    for (let i = 0; i < tileMatrix[row][col].length; i++) {
        if (tileMatrix[row][col][i] == cTileId) {
            if (i == tileMatrix[row][col].length - 1) {
                nextTileId = tileMatrix[row][col][0];
                break;
            }
            else {
                nextTileId = tileMatrix[row][col][i + 1];
                break;
            }
        }
    };

    // Place next tile id into presenting tiles
    displayMatrix[row][col] = nextTileId;
};