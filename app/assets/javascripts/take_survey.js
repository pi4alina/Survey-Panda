$(document).ready(function (){

  $('.question').on('submit', function(event){
    event.preventDefault();
    var $target = $(event.target);
    $.ajax({
      url: $target[0].action, 
      method: $target[0].method, 
      data: $target.serialize()
    }).done(function(question){
      console.log(question);
      $('.question').replaceWith(question);
    }).fail(function(error){ 
      console.log(error, "fail");
    });

  });
  
});