$( document ).ready(function() {

Shiny.addCustomMessageHandler('updateTabsetPanelDsfr', function(message) {

  var IDsButtons = [];
  var buttonsTitles = [];
  var allTabs = $("#" + message.tabsetPanelId).find("button");

  allTabs.each(function(){ IDsButtons.push(this.id); });
  allTabs.each(function(){ buttonsTitles.push(this.title); });

  let i = 0;

  do {
    if(buttonsTitles[i] === message.titleToDisplay) {
          $("#" + IDsButtons[i]).click();
    }
    i++;
  } while (i < IDsButtons.length);

});
});
