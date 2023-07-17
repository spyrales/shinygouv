$(document).ready(function () {
  Shiny.addCustomMessageHandler('updateDateRangeInputLabel', function (args) {
           document.getElementById(args.inputId + "-label").innerHTML
                = args.label;
  });

  Shiny.addCustomMessageHandler('updateDateRangeInputStart', function (args) {
           document.getElementById(args.inputId + "-start").value = args.start;
          Shiny.setInputValue(args.inputId, {start: args.start, end: document.getElementById(args.inputId + "-end").value});
  });

  Shiny.addCustomMessageHandler('updateDateRangeInputEnd', function (args) {
           document.getElementById(args.inputId + "-end").value = args.end;
           Shiny.setInputValue(args.inputId, {start: document.getElementById(args.inputId + "-start").value, end: args.end});

  });
});

