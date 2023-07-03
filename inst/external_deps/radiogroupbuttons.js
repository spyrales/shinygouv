const colorButton = function (buttonId) {

  /*var current_name = "#" + $(that).data("id");
  var current_button = "#button-" + $(that).data("id");*/
  var current_name = "#" + buttonId;
  var current_button = "#button-" + buttonId;
  console.log(current_name);
  console.log(current_button);

$(current_name).parent().removeClass('fr-btn--secondary');

$(current_name).parent().parent().parent().find("button").not(current_button).addClass("fr-btn--secondary");

}

/*$(document).ready(function () {
  Shiny.addCustomMessageHandler('updateRadioGroupColorButton', function (args) {
    colorButton(args.inputId);
  });
}*/
