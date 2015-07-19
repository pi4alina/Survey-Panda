$(document).ready(function(){
  $(".new_survey").on('submit', function(event){
    event.preventDefault();
    var $target = $(event.target)
    $.ajax({
  	  url: $target[0].action,
  	  method: $target[0].method,
  	  data: $target.serialize()
    })
    .done(function(surveyPartial){
      $("#new_survey_div").html(surveyPartial);
    })
    .fail(function(error){
      console.log(error, "fail panda")
    })
  })
})