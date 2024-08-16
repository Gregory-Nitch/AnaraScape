
// Blazor JSInterOp class
class LoreSideBarComponent {
    static ref;

    static getLoreSideBarCompReference = (loreSidBarCompRef) => {
        LoreSideBarComponent.ref = loreSidBarCompRef;
    };

    static initLoreSideBar = () => {
        LSBObj.init();
    };
};

window.LoreSideBarComponent = LoreSideBarComponent;

let LSBObj = {

    LSB_ELEMENT: null,
    subLocationMap: new Map(),
    htmlToLocNodeMap: new Map(),
    LOC_IDX: 0, // 0 = link to lore page element
    CARET_IDX: 1, // 1 = caret drop down element

    init: function () {
        // Set up location nodes
        LSBObj.LSB_ELEMENT = document.getElementById("lore-side-bar");
        let htmlLocNodes = LSBObj.LSB_ELEMENT.childNodes

        for (var i = 0; i < htmlLocNodes.length; i++) {
            let childSet = htmlLocNodes[i].children;
            LSBObj.addLocEvent(childSet[LSBObj.LOC_IDX]); 
            LSBObj.addCaretEvent(childSet[LSBObj.CARET_IDX]); 

            let locNode = new LocationNode(htmlLocNodes[i], null, 0);
            LSBObj.htmlToLocNodeMap.set(htmlLocNodes[i], locNode);
        }

        // Set up toggler
        let toggler = document.getElementById("lore-side-bar-toggler-div");
        toggler.addEventListener("click", () => LSBObj.toggle());
    },

    addCaretEvent: function (element) {
        element.addEventListener("mouseup", () => LSBObj.getSubLocations(element));
        LSBObj.addHoverEvent(element);
        
    },

    addLocEvent: function (element) {
        element.addEventListener("mouseup", () => LSBObj.goToLocation(element));
        LSBObj.addHoverEvent(element);
    },

    addHoverEvent: function (element) {
        element.addEventListener("mouseover", () => LSBObj.hoverEvent(element));
        element.addEventListener("mouseout", () => LSBObj.notHoveringEvent(element));
    },

    getSubLocations: function (caretElement) {
        let divElement = caretElement.parentElement
        let locNode = LSBObj.htmlToLocNodeMap.get(divElement);

        if (!LSBObj.subLocationMap.has(locNode)) {
            LSBObj.subLocationMap.set(locNode, new Array());

            LoreSideBarComponent.ref.invokeMethodAsync("GetSubLocationsAsync", parseInt(locNode.ref.id))
                .then(subLocations => {

                    let subArr = LSBObj.subLocationMap.get(locNode);
                    let htmlPredecessor = divElement;
                    for (var key in subLocations) {
                        let newHtml = LSBObj.createHtmlElement(key,
                                                               subLocations[key].name,
                                                               subLocations[key].hasSubLocations,
                                                               htmlPredecessor,
                                                               locNode);
                        let newNode = new LocationNode(newHtml,
                                                       divElement,
                                                       locNode.depth + 1);
                        subArr.push(newNode);
                        LSBObj.htmlToLocNodeMap.set(newHtml, newNode);
                        htmlPredecessor = newHtml;
                    }
                    locNode.showingSubLocations = true;
                    LSBObj.toggleCaret(caretElement, locNode.showingSubLocations);
                    return;
                });
        } else if (LSBObj.subLocationMap.has(locNode) && locNode.showingSubLocations) {
            LSBObj.hideAllSubNodes(locNode);
        } else {
            let subArr = LSBObj.subLocationMap.get(locNode);
            for (var i = 0; i < subArr.length; i++) {
                subArr[i].ref.hidden = false;
            }
            locNode.showingSubLocations = true;
        }
        LSBObj.toggleCaret(caretElement, locNode.showingSubLocations);
    },

    goToLocation: function (textElement) {
        let divElement = textElement.parentElement
        LoreSideBarComponent.ref.invokeMethodAsync("GoToLocation", parseInt(divElement.id));
    },

    createHtmlElement: function (id, text, hasSubLocations, htmlPredecessor, superLocNode) {
        let newDiv = document.createElement("div");
        newDiv.id = id;
        newDiv.style.paddingLeft = (superLocNode.depth + 1) * 20 + "px";
        newDiv.style.display = "flex";
        newDiv.style.paddingRight = 5 + "px";
        newDiv.classList.add("lore-side-bar-entry");
        
        let newP = document.createElement("p");
        newP.innerHTML = text;
        newP.style.fontSize = 18 + "px";
        newP.style.padding = 5 + "px";
        newP.style.margin = 0 + "px";
        newP.style.cursor = "pointer";
        newP.style.transition = "0.5s";
        newP.classList.add("lore-side-bar-txt", "text-light");
        newDiv.appendChild(newP);

        if (hasSubLocations) {
            let newI = document.createElement("i");
            newI.classList.add("bi", "bi-caret-right", "text-light", "lore-side-bar-caret");
            newI.style.fontSize = 16 + "px";
            newI.style.padding = 0 + "px";
            newI.style.lineHeight = 35 + "px";
            newI.style.cursor = "pointer";
            newI.style.transition = "0.5s";
            newDiv.appendChild(newI);
            LSBObj.addCaretEvent(newI);
        }

        LSBObj.addLocEvent(newP);

        htmlPredecessor.after(newDiv);
        return newDiv;
    },

    toggleCaret: function (caretElement, isShowing) {
        if (isShowing) {
            caretElement.classList.remove("bi-caret-right");
            caretElement.classList.add("bi-caret-down");
        } else {
            caretElement.classList.remove("bi-caret-down");
            caretElement.classList.add("bi-caret-right");
        }
    },

    hideAllSubNodes: function (locNode) {
        let nodeArr = LSBObj.subLocationMap.get(locNode);
        if (nodeArr) {
            for (var i = 0; i < nodeArr.length; i++) {
                LSBObj.hideAllSubNodes(nodeArr[i]);
                nodeArr[i].ref.hidden = true;
                let childCaret = nodeArr[i].ref.children[LSBObj.CARET_IDX];
                if (childCaret) {
                    LSBObj.toggleCaret(childCaret, false);
                }
            }
        }
   
        locNode.showingSubLocations = false;
    },

    toggle: function () {
        if (LSBObj.LSB_ELEMENT.style.maxWidth == "0px") { // show sidebar
            LSBObj.LSB_ELEMENT.style.maxWidth = "100vw";
        } else { // Hide sidebar
            LSBObj.LSB_ELEMENT.style.maxWidth = 0 + "px";
        }
    },

    hoverEvent: function (element) {
        element.classList.remove("text-light");
        element.classList.add("text-danger");
    },

    notHoveringEvent: function (element) {
        element.classList.remove("text-danger");
        element.classList.add("text-light");
    },
};

class LocationNode {

    constructor(eleRef, superEleRef, depth) {
        this.ref = eleRef;
        this.superEleRef = superEleRef;
        this.depth = depth;
        this.showingSubLocations = false;
    }
};
