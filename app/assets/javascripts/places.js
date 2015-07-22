var placeSearch, autocomplete;
var userInputLocation

function search() {

  autocomplete = new google.maps.places.Autocomplete(
     (document.getElementById('autocomplete')));

  google.maps.event.addListener(autocomplete, 'place_changed', function() {
    var userInputLocation = [autocomplete.getPlace().geometry.location.lat(),autocomplete.getPlace().geometry.location.lng()]
    window.location = "https://nycapable.herokuapp.com/routes?variable=" + userInputLocation;
  });

}

function geolocate(){
  if (navigator.geolocation){
    navigator.geolocation.getCurrentPosition(function(position){
      var location = [position.coords.latitude, position.coords.longitude]
      console.log(location)
      $( "#geolocate" ).click(function(){
        window.location = "https://nycapable.herokuapp.com/routes?variable=" + location;
      })
    })
  } else {
    alert('Please allow geolocation')
  }
}
