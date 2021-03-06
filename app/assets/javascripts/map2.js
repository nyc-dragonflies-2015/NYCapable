google.load('visualization', '1', {packages: ['columnchart']});

$(function() {
  if (!($("#data-hack").length)) return;
  var ORDER_OF_MAP_DIVS = ['station1Map', 'station2Map', 'station3Map', 'station4Map', 'station5Map'];
  var ORDER_OF_PANEL_DIVS = ['station1DirectionsPanel', 'bensDirectionsPanel', 'station3DirectionsPanel', 'station4DirectionsPanel', 'station5DirectionsPanel'];
  var ORDER_OF_ELEVATION_DIVS = ['station1Elevation', 'bens_elevation_chart', 'station3Elevation', 'station4Elevation', 'station5Elevation'];
  var userLatLong = new google.maps.LatLng(window.user[0], window.user[1]);

  $(".panel").each(function(i, elem){
    $(elem).on('click', function(e){
      var station = window.stations[i].station,
       specificLatLong = new google.maps.LatLng(station.latitude, station.longitude),
       map = mapIt(userLatLong, specificLatLong, ORDER_OF_MAP_DIVS[i], ORDER_OF_PANEL_DIVS[i], ORDER_OF_ELEVATION_DIVS[i]);
       setTimeout(function() {
        google.maps.event.trigger(map, 'resize');
       },500);
       document.getElementById(ORDER_OF_PANEL_DIVS[i]).innerHTML = ''
    });
  });
});