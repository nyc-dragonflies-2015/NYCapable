$(document).ready(function(){
  $('.mta-resources').on('click', function(event){
    event.preventDefault();
    $('#mta-resources').toggle()
  })

  $('.nyc-resources').on('click', function(event){
    event.preventDefault();
    $('#nyc-resources').toggle()
  })

  $('.government-resources').on('click', function(event){
    event.preventDefault();
    $('#government-resources').toggle()
  })

  $('.route-info').on('click', function(event){
    event.preventDefault();
    $('#route-info').toggle()
  })
});