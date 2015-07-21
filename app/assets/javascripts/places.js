var placeSearch, autocomplete;
var userInputLocation

function search() {

  autocomplete = new google.maps.places.Autocomplete(
     (document.getElementById('autocomplete')));

  google.maps.event.addListener(autocomplete, 'place_changed', function() {
    var userInputLocation = [autocomplete.getPlace().geometry.location.lat(),autocomplete.getPlace().geometry.location.lng()]
    window.location = "https://blooming-citadel-7327.herokuapp.com/routes?variable=" + userInputLocation;
  });

}

function geolocate(){
  if (navigator.geolocation){
    navigator.geolocation.getCurrentPosition(function(position){
      var location = [position.coords.latitude, position.coords.longitude]
      console.log(location)
      $( "#geolocate" ).click(function(){
        window.location = "http://localhost:3000/routes?variable=" + location;
      })
    })
  } else {
    alert('Please allow geolocation')
  }
}

function directions(){

  $('#find').click(function(){
    $('#autocomplete').hide()
    $('#geolocate').hide()
    $('#origin').show()
    $('#destination').show()
    $('#directions').show()
    $('#find').hide()
  })

  var destinationPath = []
  var origin = new google.maps.places.Autocomplete(
     (document.getElementById('origin')));

  var destination = new google.maps.places.Autocomplete(
     (document.getElementById('destination')));

  var promise = new Promise(function(resolve, reject){
    google.maps.event.addListener(origin, 'place_changed', function(){
      var userOrigin = [origin.getPlace().geometry.location.lat(),origin.getPlace().geometry.location.lng()];
      resolve(userOrigin)
    });
  })

  promise.then(function(data){
    destinationPath.push(data)
    console.log(destinationPath)
  }, function(error){
    console.log("something went wrong", error)
  });

  var promise1 = new Promise(function(resolve, reject){
    google.maps.event.addListener(destination, 'place_changed', function(){
      var userDestination = [destination.getPlace().geometry.location.lat(),destination.getPlace().geometry.location.lng()];
      resolve(userDestination)
    });
  })

  promise1.then(function(data){
    destinationPath.push(data)
    console.log(destinationPath)
  }, function(error){
    console.log("something went wrong", error)
  });

  $('#directions').click(function(){
    if(destinationPath.length < 2){
      alert("please fill out an origin and destination")
    } else{
      console.log(destinationPath)
      // window.location = "http://localhost:3000/directions?variable=" + destinationPath;
    }
  });


}