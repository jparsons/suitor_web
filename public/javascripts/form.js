$(function(){
  $( "#send_message" ).submit(function( event ) {
    $.post('/send_message', $(this).serialize(), function(response) {
      $("#message").html(response);
    });
    $(this).trigger("reset");
    event.preventDefault();
  });

  $("#get_random_subreddit").click(function( event ){
    $.post('/get_random_subreddit', null, function(response) {
      $("#subreddit").val(response);
    });
    event.preventDefault();
  });
});