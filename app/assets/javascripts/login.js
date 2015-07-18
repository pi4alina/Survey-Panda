$(document).ready(function(){
  $(".login").on("submit", function(event){
    event.preventDefault();
    var $target = $(event.target);
    $.ajax({
      url: $target[0].action,
      method: $target[0].method,
      data: $target.serialize()
    })
    .done(function(loginForm){
      $(".login").toggle(false);
      $(".signup").toggle(true);
      $("#forms").html(loginForm);
    })
    .fail(function(error){
      console.log(error, "fail panda")
    });
  })
});