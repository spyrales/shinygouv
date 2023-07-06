const updatedate = function(inputId){
    var start = $("#"+inputId+"-start").val();
    var end = $("#"+inputId+"-end").val();
  
    Shiny.setInputValue(inputId, {start: start, end: end})
  }