google.load('visualization', '1', {packages: ['columnchart']});

$(function() {
  debugger
  var ORDER_OF_MAP_DIVS = ['route1Map', 'route2Map', 'route3Map', 'route4Map', 'route5Map','route6Map', 'route7Map', 'route8Map', 'route9Map', 'route10Map'];
  var ORDER_OF_PANEL_DIVS = ['route1DirectionsPanel', 'route2DirectionsPanel', 'route3DirectionsPanel', 'route4DirectionsPanel', 'route5DirectionsPanel','route6DirectionsPanel', 'route7DirectionsPanel', 'route8DirectionsPanel', 'route9DirectionsPanel', 'route10DirectionsPanel'];
  var ORDER_OF_ELEVATION_DIVS = ['route1Elevation', 'route2Elevation', 'route3Elevation', 'route4Elevation', 'route5Elevation','route6Elevation', 'route7Elevation', 'route8Elevation', 'route9Elevation', 'route10Elevation'];
  // var userData = $('.testing').data("user");
  // var userLatLong = new google.maps.LatLng(userData[0], userData[1]);
  var stations = eval($('.testing').data('routes'))

  $(".panel2 h3").each(function(i, elem){
    $(elem).on('click', function(e){
      debugger;
      var startingPosition = stations[i/2][i%2][0];
      var startingLatLong = new google.maps.LatLng(startingPosition[0], startingPosition[1]);

      var endingPosition = stations[i/2][i%2][1];
      var endingLatLong = new google.maps.LatLng(endingPosition[0], endingPosition[1]);

       map = mapIt(startingLatLong, endingLatLong, ORDER_OF_MAP_DIVS[i], ORDER_OF_PANEL_DIVS[i], ORDER_OF_ELEVATION_DIVS[i]);
       setTimeout(function() {
        google.maps.event.trigger(map, 'resize');
       },500);
    });
  });
});