var $j = jQuery.noConflict();

var stage;
var layer = new Kinetic.Layer();
var hotSpotlayer = new Kinetic.Layer();

var concept;
var newHotspot;
var deletedHotspot;
var newHotSpotLinkProduct;

var gap = 30;
var hotspotCircles = new Array();

var scale = 1/2;

var canvasHeight = 800 * scale;
var canvasWidth = 1200 * scale;

var submit = false;
var deleteFlag = false;

var action = '';

function loadConceptImage() {

	var imageObj = new Image();

	imageObj.onload = function() {
		var image = new Kinetic.Image({
			x : 0,
			y : 0,
			image : imageObj,
			width : canvasWidth,
			height : canvasHeight
		});

		layer.add(image);
		layer.draw();

		showHotSpots();
	};

	imageObj.src = concept.image;
}

function showHotSpots() {
	var hotspots = concept.hotspot_definition;

	var i;

	for (i = 0; i < hotspots.length; i++) {
		var hotspot = new Kinetic.Circle({
			x : hotspots[i].x_coordinate * scale,
			y : hotspots[i].y_coordinate * scale,
			product: hotspots[i].product_id,
			radius : 15,
			fill : "red",
			stroke : "black",
			strokeWidth : 4
		});

		hotspot.on("click", function() {
		
			url='pages/masters/concept/hotSpotDetails.jsp';
			window.open(url+"?productId="+this.product,'',
			
			'width=350,height=150,left=200,top=100,toolbar=1,status=1');
		});

		hotspotCircles.push(hotspot);
		hotSpotlayer.add(hotspot);
	}

	hotSpotlayer.draw();
}

function addNewHotSpot() {

	for ( var i = 0; i < hotspotCircles.length; i++) {
		hotspotCircles[i].off("click");
	}

	var hotspotRadius = 15;

	newHotspot = new Kinetic.Circle({
		x : (canvasWidth / 2 - hotspotRadius) * scale,
		y : (canvasHeight / 2 - hotspotRadius) * scale,
		radius : hotspotRadius,
		fill : "yellow",
		stroke : "black",
		strokeWidth : 4
	});

	newHotspot.draggable(true);

	hotSpotlayer.add(newHotspot);
	hotSpotlayer.draw();

	$j('#addNewHotspot').attr("disabled", "disabled");
	$j('#deleteHotspots').attr("disabled", "disabled");

	$j('#linkProduct').removeAttr("disabled");

	$j('#cancel').removeAttr("disabled");
	$j('#cancel').show();

	action = 'ADD';
}

function showProductSearchWindow() {

	newHotspot.draggable(false);

	window.open('pages/masters/concept/hotspot_productSearch.jsp', 'Product Search',
			'width=700,height=400,left=200,top=100,toolbar=1,status=1,scrollbars=1');
}

function addHotspot(productCode) {

	newHotspot.fill = "red";
	newHotspot.draggable(false);

	newHotSpotLinkProduct=productCode;
	
	hotSpotlayer.draw();

	hotspotCircles.push(newHotspot);

	$j('#addNewHotspot').attr("disabled", "disabled");
	$j('#linkProduct').attr("disabled", "disabled");
	$j('#deleteHotspots').attr("disabled", "disabled");

	$j('#cancel').removeAttr("disabled");
	$j('#cancel').show();
	$j('#save').removeAttr("disabled");
	$j('#save').show();
}

function cancelAdd() {

	newHotspot.fill = "yellow";
	newHotspot.draggable(true);

	$j('#save').attr("disabled", "disabled");
	$j('#save').hide();

	$j('#linkProduct').removeAttr("disabled");

	hotSpotlayer.draw();
}

function deleteHotspots() {

	$j('#addNewHotspot').attr("disabled", "disabled");
	$j('#linkProduct').attr("disabled", "disabled");

	if (deleteFlag) {
		deleteFlag = false;

		$j('#deleteHotspots').html("Delete Hotspots");
		$j('#deleteHotspots').attr("disabled", "disabled");

		$j('#save').removeAttr("disabled");
		$j('#save').show();
		$j('#cancel').removeAttr("disabled");
		$j('#cancel').show();

		action = 'DELETE';

		for ( var i = 0; i < hotspotCircles.length; i++) {
			if (deletedHotspot == hotspotCircles[i]) {
				hotSpotlayer.remove(hotspotCircles[i]);
			}

			hotspotCircles[i].off("click");

			hotSpotlayer.draw();
		}
	} else {
		deleteFlag = true;

		$j('#deleteHotspots').html("Delete");
		$j('#deleteHotspots').attr("disabled", "disabled");
		
		$j('#cancel').removeAttr("disabled");
		$j('#cancel').show();
		
		action = 'DELETE_SELECT';

		for ( var i = 0; i < hotspotCircles.length; i++) {
			hotspotCircles[i].off("click");

			hotspotCircles[i].on("click", function() {
				this.fill = 'yellow';
				deletedHotspot = this;

				for ( var i = 0; i < hotspotCircles.length; i++) {
					if (deletedHotspot != hotspotCircles[i]) {
						hotspotCircles[i].fill = 'red';
					}
				}

				hotSpotlayer.draw();

				$j('#deleteHotspots').removeAttr("disabled");
			});
		}
	}
}

function cancel() {
	window.location.href = 'concept.htm?method=listHotSpots';
}

function back() {
	window.location.href = 'concept.htm?method=getConceptList';
}

function editHotSpot() {
	window.location.href = 'concept.htm?method=redirectToEditHotSpot';
}

function editConcept() {
	window.location.href = 'concept.htm?method=redirectToEditConcept';
}

function save() {

	if (action == 'ADD') {

		var newHotspotJson = {
			x_coordinate : (newHotspot.x) * (1/scale),
			y_coordinate : (newHotspot.y) * (1/scale),
			product_id: newHotSpotLinkProduct
		};

		var conceptForm = document.concept_form;

		conceptForm.action = 'concept.htm?method=addHotSpotServlet&new_hotspot='
				+ $j.toJSON(newHotspotJson);
		conceptForm.method = 'POST';

		conceptForm.submit();
	}

	if (action == 'DELETE') {

		var deletedHotspotJson = {
			x_coordinate : (deletedHotspot.x) * (1/scale),
			y_coordinate : (deletedHotspot.y) * (1/scale)
		};

		var conceptForm = document.concept_form;

		conceptForm.action = 'concept.htm?method=deleteHotSpotServlet&deleted_hotspot='
				+ $j.toJSON(deletedHotspotJson);
		conceptForm.method = 'POST';

		conceptForm.submit();
	}

	action = '';
}

window.onload = function() {
	stage = new Kinetic.Stage("container", canvasWidth, canvasHeight);

	stage.add(layer);
	stage.add(hotSpotlayer);

	loadConceptImage();

	$j('#linkProduct').attr("disabled", "disabled");

	$j('#cancel').attr("disabled", "disabled");
	$j('#cancel').hide();
	$j('#save').attr("disabled", "disabled");
	$j('#save').hide();
};