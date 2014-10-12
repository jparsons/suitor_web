$(function(){
  $( "#send_message" ).submit(function( event ) {
    $.post('/send_message', $(this).serialize(), function(response) {
      console.log("Response: "+response);
      $("#message").html(response);
    });
    $(this).trigger("reset");
    event.preventDefault();
  });
});