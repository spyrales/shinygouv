const colorButton = function (buttonId) {

  var current_name = "#" + buttonId;
  var current_button = "#button-" + buttonId;
  console.log(current_name);
  console.log(current_button);

$(current_name).parent().removeClass('fr-btn--secondary');

$(current_name).parent().parent().parent().find("button").not(current_button).addClass("fr-btn--secondary");

};

const updatedate = function(inputId){
  var start = $("#"+inputId+"-start").val();
  var end = $("#"+inputId+"-end").val();

  Shiny.setInputValue(inputId, {start: start, end: end})
}
