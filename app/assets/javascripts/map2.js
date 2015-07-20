google.load('visualization', '1', {packages: ['columnchart']});


function calcRoute(){
  var userLocation = new google.maps.LatLng($('.testing').data("user")[0],$('.testing').data("user")[1]);
  var station1 = new google.maps.LatLng($('.testing').data("stations")[0].station.latitude,$('.testing').data("stations")[0].station.longitude);
  var station2 = new google.maps.LatLng($('.testing').data("stations")[1].station.latitude,$('.testing').data("stations")[1].station.longitude);
  var station3 = new google.maps.LatLng($('.testing').data("stations")[2].station.latitude,$('.testing').data("stations")[2].station.longitude);
  var station4 = new google.maps.LatLng($('.testing').data("stations")[3].station.latitude,$('.testing').data("stations")[3].station.longitude);
  var station5 = new google.maps.LatLng($('.testing').data("stations")[4].station.latitude,$('.testing').data("stations")[4].station.longitude)

mapIt(userLocation, station1, 'station1Map','station1DirectionsPanel', 'station1Elevation')
mapIt(userLocation, station2, 'station2Map','bensDirectionsPanel', 'bens_elevation_chart')
mapIt(userLocation, station3, 'station3Map','station3DirectionsPanel', 'station3Elevation')
mapIt(userLocation, station4, 'station4Map','station4DirectionsPanel', 'station4Elevation')
mapIt(userLocation, station5, 'station5Map','station5DirectionsPanel', 'station5Elevation')
}



function mapIt(person, place, mapDiv, panelDiv, elevationDiv){

  var request = {
    origin: person,
    destination: place,
    travelMode: google.maps.TravelMode.WALKING
  };

  var mapOptions = {
    zoom: 8,
    center: person
  }

  var map = new google.maps.Map(document.getElementById(mapDiv), mapOptions);

  var directionsService = new google.maps.DirectionsService();

  var directionsDisplay = new google.maps.DirectionsRenderer();

  directionsService.route(request, function(result, status){
    if (status == google.maps.DirectionsStatus.OK){
      directionsDisplay.setMap(map);
      directionsDisplay.setDirections(result);
      directionsDisplay.setPanel(document.getElementById(panelDiv))
    }
  });

  var elevator = new google.maps.ElevationService();

  var chart = new google.visualization.ColumnChart(document.getElementById(elevationDiv));

  var path = [person, place];

  var pathRequest = {
    path: path,
    samples: 200
  }

  elevator.getElevationAlongPath(pathRequest, plotElevation)

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

    document.getElementById(elevationDiv).style.display = 'block';
    chart.draw(data, {
      height: 150,
      legend: 'none',
      titleY: 'Elevation (m)'
    });
  }

}

