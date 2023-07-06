$(document).ready(function() {

 Shiny.addCustomMessageHandler('dateRangeInput_dsfr_js', function(message) {
console.log("coucou")

    var start = $("#"+message.id+"-start").val();
    var end = $("#"+message.id+"-end").val();

    Shiny.setInputValue(message.id, {start: start, end: end})
});

