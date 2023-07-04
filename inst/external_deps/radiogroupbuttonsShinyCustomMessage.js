$(document).ready(function () {
  Shiny.addCustomMessageHandler('updateRadioGroupColorButton', function (args) {
    colorButton(args.inputId);
  });
});
