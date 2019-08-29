$(document).on('turbolinks:load', function() {
//hover in
  $('#unfollow_btn').hover(function(){ 
    $(this).removeClass('btn-primary');
    $(this).addClass('btn-danger');
    $(this).html("Unfollow");
//hover out
  }, function(){ 
    $(this).html("Following");
    $(this).removeClass('btn-danger');
    $(this).addClass('btn-primary');
  });
})
//(this) is our hyperlink