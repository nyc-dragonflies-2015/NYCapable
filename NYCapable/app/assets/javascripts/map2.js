var directionsDisplay;
var directionsService = new google.maps.DirectionsService();
var map;
var union_square = new google.maps.LatLng(40.7356,-73.9906);
var dbc = new google.maps.LatLng(40.706363,-74.009096);
var bensDirectionsDisplay;
var bensDirectionsService = new google.maps.DirectionsService();
var bensMap
var fordham = new google.maps.LatLng(40.771683,-73.984778);
var les =new google.maps.LatLng(40.722546,-73.988382);
var elevator;
var chart;
var bensElevator;
var bensChart;

google.load('visualization', '1', {packages: ['columnchart']});


function plotElevation(results, status){
  if(status != google.maps.ElevationStatus.OK){
    return;
  }

  var elevations = results;

  var elevationPath = [];
  for(var i = 0; i < results.length; i++){
    elevationPath.push(elevations[i].location);
  }

  var data = new google.visualization.DataTable();
  data.addColumn('string', 'Sample');
  data.addColumn('number', 'Elevation');
  for(var i = 0; i < results.length; i++){
    data.addRow(['', elevations[i].elevation]);
  }

  document.getElementById('elevation_chart').style.display = 'block';
  chart.draw(data, {
    height: 150,
    legend: 'none',
    titleY: 'Elevation (m)'
  });

}

function bensPlotElevation(results, status){
  if(status != google.maps.ElevationStatus.OK){
    return;
  }

  var elevations = results;

  var elevationPath = [];
  for(var i = 0; i < results.length; i++){
    elevationPath.push(elevations[i].location);
  }

  var data = new google.visualization.DataTable();
  data.addColumn('string', 'Sample');
  data.addColumn('number', 'Elevation');
  for(var i = 0; i < results.length; i++){
    data.addRow(['', elevations[i].elevation]);
  }

  document.getElementById('bens_elevation_chart').style.display = 'block';
  bensChart.draw(data, {
    height: 150,
    legend: 'none',
    titleY: 'Elevation (m)'
  });

}


function drawPath(){
  console.log("hi")

  elevator = new google.maps.ElevationService();

  chart = new google.visualization.ColumnChart(document.getElementById('elevation_chart'));

  var path = [union_square, dbc];

  var pathRequest = {
    path: path,
    samples: 500
  }

  elevator.getElevationAlongPath(pathRequest, plotElevation)
  // bensDrawPath()
}


function bensDrawPath(){
  bensElevator = new google.maps.ElevationService();

  bensChart = new google.visualization.ColumnChart(document.getElementById('bens_elevation_chart'));

  var bensPath = [les, dbc];

  var pathRequest = {
    path: bensPath,
    samples: 500
  }

  bensElevator.getElevationAlongPath(pathRequest, bensPlotElevation)
}


function initialize() {

  directionsDisplay = new google.maps.DirectionsRenderer();
  bensDirectionsDisplay = new google.maps.DirectionsRenderer();

  var mapOptions = {
    zoom: 8,
    center: union_square
  }

  var bensMapOptions = {
    zoom: 8,
    center: les
  }

  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
  directionsDisplay.setMap(map);

  bensMap = new google.maps.Map(document.getElementById('map-canvas2'), bensMapOptions);
  bensDirectionsDisplay.setMap(bensMap);

  // var marker = new google.maps.Marker({
  //   position: union_square,
  //   map: map,
  //   title: 'Hello World'
  // });

  // var bensMarker = new google.maps.Marker({
  //   position: les,
  //   map: bensMap,
  //   title: 'Hello World'
  // });
}

function calcRoute(){
  var request = {
    origin: union_square,
    destination: dbc,
    travelMode: google.maps.TravelMode.WALKING,
    // provideRouteAlternatives: true
  };

  var mapOptions = {
    zoom: 8,
    center: union_square
  };

  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
  directionsService.route(request, function(result, status){
  directionsDisplay = new google.maps.DirectionsRenderer();
    if (status == google.maps.DirectionsStatus.OK){
      // console.log(status)
      directionsDisplay.setMap(map);
      directionsDisplay.setDirections(result);
      directionsDisplay.setPanel(document.getElementById("directionsPanel"));
    }
  });

bensCalcRoute();

}


function bensCalcRoute(){

  var bensRequest = {
    origin: les,
    destination: dbc,
    travelMode: google.maps.TravelMode.WALKING,
    // provideRouteAlternatives: true
  };

   var bensMapOptions = {
    zoom: 8,
    center: les
  };

  bensMap = new google.maps.Map(document.getElementById('map-canvas2'), bensMapOptions);

  bensDirectionsService.route(bensRequest, function(result, status){
    bensDirectionsDisplay = new google.maps.DirectionsRenderer();
    if (status == google.maps.DirectionsStatus.OK){
        bensDirectionsDisplay.setMap(bensMap);
        bensDirectionsDisplay.setDirections(result);
      bensDirectionsDisplay.setPanel(document.getElementById("bensDirectionsPanel"));
    }
  });

}

google.maps.event.addDomListener(window, 'load', initialize);
