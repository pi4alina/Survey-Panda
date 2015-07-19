$(document).ready(function(){
  $(".new_question_button").on("submit", function(event){
  	event.preventDefault();
  	var $target = $(event.target);
  	$.ajax({
      url: $target[0].action,
      data: $target.serialize()
  	})
  	.done(function(questionForm){
  		$(".new_question_button").toggle(false);
  		$("#questions_div").append(questionForm);
  	})
  	.fail(function(error){
  		console.log(error, "sad panda")
  	})
  	$("body").on("submit", ".new_question_form", function(event){
  		event.preventDefault();
  	  var $target = $(event.target);
  	  $.ajax({
  	  	url: $target[0].action,
  	  	method: $target[0].method,
  	  	data: $target.serialize()
  	  })
  	  .done(function(questionPartial){
  	  	$("#content").prepend(questionPartial);
  	  	$(".new_question_form").remove();
  	  	$(".new_question_button").toggle(true);
  	  })
  	  .fail(function(error){
  	  	console.log(error, "fail panda")
  	  })
  	})
  })
})