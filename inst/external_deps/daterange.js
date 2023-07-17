const inputdate = function (inputId) {


    var start = $("#"+inputId+"-start").val();
    var end = $("#"+inputId+"-end").val();


console.log(start)
console.log(end)

    Shiny.setInputValue(inputId, {start: start, end: end})
  }
