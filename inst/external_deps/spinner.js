$( document ).ready(function() {

  Shiny.addCustomMessageHandler('show_spinner', function(arg) {
    document.getElementById(arg).style.display='block';
    $( "#" + arg ).children().trigger("show");
    $( "#" + arg ).children().trigger("shown");
  });

  Shiny.addCustomMessageHandler('hide_spinner', function(arg) {
    document.getElementById(arg).style.display='none';
  });

});
