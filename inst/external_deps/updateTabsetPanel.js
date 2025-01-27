$( document ).ready(function() {

Shiny.addCustomMessageHandler('updateTabsetPanelDsfr', function(message) {

  var IDsButtons = [];
  var buttonsTitles = [];
  var allTabs = $("#" + message.tabsetPanelId).find("button");

  allTabs.each(function(){ IDsButtons.push(this.id); });
  allTabs.each(function(){ buttonsTitles.push(this.title); });

  let i = 0;
  let sel = message.titleToDisplay;

  do {
    //recherche id list
    let str = IDsButtons[i];
    let idwons = str.substr(str.length - sel.length, sel.length);
    if(buttonsTitles[i] == sel || idwons == sel) {
          $("#" + IDsButtons[i]).click();
    }
    i++;
  } while (i < IDsButtons.length);

});
});
