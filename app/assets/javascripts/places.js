var placeSearch, autocomplete, userInputLocation;


function search() {

  autocomplete = new google.maps.places.Autocomplete(
     (document.getElementById('autocomplete')));

  google.maps.event.addListener(autocomplete, 'place_changed', function() {
    var userInputLocation = [autocomplete.getPlace().geometry.location.lat(),autocomplete.getPlace().geometry.location.lng()]
    window.location = "http://localhost:3000/routes?variable=" + userInputLocation;
  });

}

