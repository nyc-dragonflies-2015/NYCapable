var userLocation;

// STATION 1 VARS
var station1;
var directionsDisplay;
var directionsService = new google.maps.DirectionsService();
var map;
var elevator;
var chart;

// STATION 2 VARS
var station2;
var bensDirectionsDisplay;
var bensDirectionsService = new google.maps.DirectionsService();
var bensMap;
var bensElevator;
var bensChart;

// STATION 3 VARS
var station3;
var station3DirectionsDisplay;
var station3DirectionsService = new google.maps.DirectionsService();
var station3Map;
var station3Elevator;
var station3Chart;

// STATION 4 VARS
var station4;
var station4DirectionsDisplay;
var station4DirectionsService = new google.maps.DirectionsService();
var station4Map;
var station4Elevator;
var station4Chart;

//STATION 5 VARS
var station5;
var station5DirectionsDisplay;
var station5DirectionsService = new google.maps.DirectionsService();
var station5Map;
var station5Elevator;
var station5Chart;


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

  document.getElementById('station1Elevation').style.display = 'block';
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


function drawPath(person,place){
  elevator = new google.maps.ElevationService();
  chart = new google.visualization.ColumnChart(document.getElementById('station1Elevation'));
  var path = [person, place];
  var pathRequest = {
    path: path,
    samples: 200
  }
  elevator.getElevationAlongPath(pathRequest, plotElevation);
}


function bensDrawPath(person,place){
  bensElevator = new google.maps.ElevationService();

  bensChart = new google.visualization.ColumnChart(document.getElementById('bens_elevation_chart'));

  var bensPath = [person, place];

  var pathRequest = {
    path: bensPath,
    samples: 200
  }

  bensElevator.getElevationAlongPath(pathRequest, bensPlotElevation)
}

function calcRoute(){
  var userLocation = new google.maps.LatLng($('.testing').data("user")[0],$('.testing').data("user")[1]);
  var station1 = new google.maps.LatLng($('.testing').data("stations")[0].latitude,$('.testing').data("stations")[0].longitude);
  var station2 = new google.maps.LatLng($('.testing').data("stations")[1].latitude,$('.testing').data("stations")[1].longitude);
  var station3 = new google.maps.LatLng($('.testing').data("stations")[2].latitude,$('.testing').data("stations")[2].longitude);
  var station4 = new google.maps.LatLng($('.testing').data("stations")[3].latitude,$('.testing').data("stations")[3].longitude);
  var station5 = new google.maps.LatLng($('.testing').data("stations")[4].latitude,$('.testing').data("stations")[4].longitude);

  var request = {
    origin: userLocation,
    destination: station1,
    travelMode: google.maps.TravelMode.WALKING,
    // provideRouteAlternatives: true
  };

  var mapOptions = {
    zoom: 8,
    center: userLocation
  };

  map = new google.maps.Map(document.getElementById('station1Map'), mapOptions);
  var directionsService = new google.maps.DirectionsService();
  directionsService.route(request, function(result, status){
  directionsDisplay = new google.maps.DirectionsRenderer();
    if (status == google.maps.DirectionsStatus.OK){
      directionsDisplay.setMap(map);
      directionsDisplay.setDirections(result);
      directionsDisplay.setPanel(document.getElementById('station1DirectionsPanel'));
    }
  });

drawPath(userLocation,station1);
bensCalcRoute(userLocation,station2);
bensDrawPath(userLocation,station2);
station3CalcRoute(userLocation,station3);
station3DrawPath(userLocation,station3);
station4CalcRoute(userLocation,station4);
station5CalcRoute(userLocation,station5);
}


function bensCalcRoute(person,place){
  var bensRequest = {
    origin: person,
    destination: place,
    travelMode: google.maps.TravelMode.WALKING,
    // provideRouteAlternatives: true
  };

   var bensMapOptions = {
    zoom: 8,
    center: person
  };

  bensMap = new google.maps.Map(document.getElementById('station2Map'), bensMapOptions);

  bensDirectionsService.route(bensRequest, function(result, status){
    bensDirectionsDisplay = new google.maps.DirectionsRenderer();
    if (status == google.maps.DirectionsStatus.OK){
        bensDirectionsDisplay.setMap(bensMap);
        bensDirectionsDisplay.setDirections(result);
      bensDirectionsDisplay.setPanel(document.getElementById("bensDirectionsPanel"));
    }
  });

}

// ________________________STATION 3___________________________________________________________________________

function station3CalcRoute(person,place){
  var station3Request = {
    origin: person,
    destination: place,
    travelMode: google.maps.TravelMode.WALKING,
    // provideRouteAlternatives: true
  };

   var station3MapOptions = {
    zoom: 8,
    center: person
  };

  station3Map = new google.maps.Map(document.getElementById('station3Map'), station3MapOptions);

  station3DirectionsService.route(station3Request, function(result, status){
    station3DirectionsDisplay = new google.maps.DirectionsRenderer();
    if (status == google.maps.DirectionsStatus.OK){
        station3DirectionsDisplay.setMap(station3Map);
        station3DirectionsDisplay.setDirections(result);
      station3DirectionsDisplay.setPanel(document.getElementById("station3DirectionsPanel"));
    }
  });
}

function station3DrawPath(person,place){
  station3Elevator = new google.maps.ElevationService();

  station3Chart = new google.visualization.ColumnChart(document.getElementById('station3Elevation'));

  var station3Path = [person, place];

  var pathRequest = {
    path: station3Path,
    samples: 200
  }

  station3Elevator.getElevationAlongPath(pathRequest, station3PlotElevation)
}

function station3PlotElevation(results, status){
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

  document.getElementById('station3Elevation').style.display = 'block';
  station3Chart.draw(data, {
    height: 150,
    legend: 'none',
    titleY: 'Elevation (m)'
  });
}

// ________________________STATION 4___________________________________________________________________________

function station4CalcRoute(person,place) {
  var station4Request = {
    origin: person,
    destination: place,
    travelMode: google.maps.TravelMode.WALKING,
    // provideRouteAlternatives: true
  };

   var station4MapOptions = {
    zoom: 8,
    center: person
  };

  station4Map = new google.maps.Map(document.getElementById('station4Map'), station4MapOptions);

  station4DirectionsService.route(station4Request, function(result, status){
    station4DirectionsDisplay = new google.maps.DirectionsRenderer();
    if (status == google.maps.DirectionsStatus.OK){
        station4DirectionsDisplay.setMap(station4Map);
        station4DirectionsDisplay.setDirections(result);
      station4DirectionsDisplay.setPanel(document.getElementById("station4DirectionsPanel"));
    }
  });
  station4DrawPath(person,place);
}

function station4DrawPath(person,place){
  station4Elevator = new google.maps.ElevationService();

  station4Chart = new google.visualization.ColumnChart(document.getElementById('station4Elevation'));

  var station4Path = [person, place];

  var pathRequest = {
    path: station4Path,
    samples: 200
  }
  station4Elevator.getElevationAlongPath(pathRequest, station4PlotElevation)
}

function station4PlotElevation(results, status){
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

  document.getElementById('station4Elevation').style.display = 'block';
  station4Chart.draw(data, {
    height: 150,
    legend: 'none',
    titleY: 'Elevation (m)'
  });
}

// ________________________STATION 5___________________________________________________________________________

function station5CalcRoute(person,place) {
  var station5Request = {
    origin: person,
    destination: place,
    travelMode: google.maps.TravelMode.WALKING,
    // provideRouteAlternatives: true
  };

   var station5MapOptions = {
    zoom: 8,
    center: person
  };

  station5Map = new google.maps.Map(document.getElementById('station5Map'), station5MapOptions);

  station5DirectionsService.route(station5Request, function(result, status){
    station5DirectionsDisplay = new google.maps.DirectionsRenderer();
    if (status == google.maps.DirectionsStatus.OK){
        station5DirectionsDisplay.setMap(station5Map);
        station5DirectionsDisplay.setDirections(result);
      station5DirectionsDisplay.setPanel(document.getElementById("station5DirectionsPanel"));
    }
  });
  station5DrawPath(person,place);
}

function station5DrawPath(person,place){
  station5Elevator = new google.maps.ElevationService();

  station5Chart = new google.visualization.ColumnChart(document.getElementById('station5Elevation'));

  var station5Path = [person, place];

  var pathRequest = {
    path: station5Path,
    samples: 200
  }
  station5Elevator.getElevationAlongPath(pathRequest, station5PlotElevation)
}

function station5PlotElevation(results, status){
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

  document.getElementById('station5Elevation').style.display = 'block';
  station5Chart.draw(data, {
    height: 150,
    legend: 'none',
    titleY: 'Elevation (m)'
  });
}
