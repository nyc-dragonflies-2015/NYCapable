function geolocate(){
  var promise = new Promise(function(resolve, reject){
    if (navigator.geolocation){
      navigator.geolocation.getCurrentPosition(function(position){
        var location = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
        resolve(location)
      })
    } else {
      alert('did not work')
    }
  })
  promise.then(function(data){
    console.log(data) // this is the latlong object
    // here i reverse geocode to get a formatted address...which we prob dont have to do but i was playing around
    // what we can do once we have this data is **THEN** send it to the controller and get all our maps
    var geocoder = new google.maps.Geocoder();
    geocoder.geocode({'location': data}, function(results, status){
      if (status == google.maps.GeocoderStatus.OK){
        if(results[1]){
          console.log(results[1].formatted_address)
        } else {
          window.alert('no results found');
        }
      } else {
        window.alert('Geocoder failed due to: ' + status);
      }
    })
  }, function(error){
    console.log("omg")
  });
}