function mapIt(person, place, mapDiv, panelDiv, elevationDiv){

  var request = {
    origin: person,
    destination: place,
    travelMode: google.maps.TravelMode.WALKING
  };

  var directionsService = new google.maps.DirectionsService();

  var directionsDisplay = new google.maps.DirectionsRenderer();

  directionsService.route(request, function(result, status){
    if (status == google.maps.DirectionsStatus.OK){

      var mapOptions = {
      zoom: 8,
      center: result.request.destination
      }

      var map = new google.maps.Map(document.getElementById(mapDiv), mapOptions);

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
  return map;
}
