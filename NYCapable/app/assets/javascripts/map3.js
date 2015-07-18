var directionsDisplay;
var directionsService = new google.maps.DirectionsService();
var map;
var union_square = new google.maps.LatLng(40.7356,-73.9906);
var dbc = new google.maps.LatLng(40.706363,-74.009096);
var elevator;
var chart;
var geocoder1 = new google.maps.Geocoder();
var geocoder2;

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


function drawPath(){

  elevator = new google.maps.ElevationService();

  chart = new google.visualization.ColumnChart(document.getElementById('elevation_chart'));

  var path = [union_square, dbc];

  var pathRequest = {
    path: path,
    samples: 500
  }

  elevator.getElevationAlongPath(pathRequest, plotElevation)
}



function initialize() {
  // geocoder1 = new google.maps.Geocoder();
  geocoder2 = new google.maps.Geocoder();
  directionsDisplay = new google.maps.DirectionsRenderer();

  var mapOptions = {
    zoom: 8,
    center: union_square
  };

  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
  directionsDisplay.setMap(map);

  elevator = new google.maps.ElevationService();
}




function getEnd() {
  var end = document.getElementById('end').value;
  var promise = new Promise(function(resolve, reject){
    geocoder1.geocode( { 'address': end}, function(results, status) {
      // console.log("status", status);
      if (status == google.maps.GeocoderStatus.OK) {
        pointB = results[0].geometry.location
        resolve(pointB)
      } else {
        alert('Geocode was not successful for the following reason: ' + status);
        reject(Error(status))
      }
    })
  })

  promise.then(function(data){
    // console.log(data)
    return data
  }, function(error){
    console.log("something went wrong", error)
  });
}

function getStart() {
  var start = document.getElementById('start').value;
  var promise = new Promise(function(resolve, reject){
    geocoder1.geocode( { 'address': start}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        pointA = results[0].geometry.location
        resolve(pointA)
        calcRoute()
        drawPath()
      } else {
        alert('Geocode was not successful for the following reason: ' + status);
        reject(Error(status))
      }
    })
  });

  promise.then(function(data){
    console.log(data)m
  }, function(error){
    console.log("something went wrong", error)
  });
}

function calcRoute(){
  var request = {
    origin: pointA,
    destination: dbc,
    travelMode: google.maps.TravelMode.DRIVING,
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
      directionsDisplay.setMap(map);
      directionsDisplay.setDirections(result);
      directionsDisplay.setPanel(document.getElementById("directionsPanel"));
    }
  });
}




google.maps.event.addDomListener(window, 'load', initialize);
