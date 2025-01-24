$( document ).ready(function() {

Shiny.addCustomMessageHandler('updateAccordionDsfr', function(message) {

  var IDsLinks = [];
  var linksTitles = [];
  var allTabs = $("#" + message.accordionId).find("button");
  if(message.open == "t"){
  allTabs.each(function(){ IDsLinks.push(this.id); });
  allTabs.each(function(){ linksTitles.push(this.innerText); });

  let i = 0;
  let sel = message.titleToDisplay;

  do {
    //recherche id list
    if(linksTitles[i] === sel) {
      $("#" + IDsLinks[i]).attr("aria-expanded","true");
    }
    i++;
  } while (i < IDsLinks.length);
  } else {
    allTabs.each(function(){ $( this ).attr("aria-expanded","false"); });
  }

});
});
