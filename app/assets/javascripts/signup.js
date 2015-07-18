$(document).ready(function(){
  $(".signup").on("submit", function(event){
    event.preventDefault();
    var $target = $(event.target);
    $.ajax({
      url: $target[0].action,
      method: $target[0].method,
      data: $target.serialize()
    })
    .done(function(signupForm){
      $(".signup").toggle(false);
      $(".login").toggle(true);
      $("#forms").html(signupForm);
    })
    .fail(function(error){
      console.log(error, "fail panda")
    });
  })
});