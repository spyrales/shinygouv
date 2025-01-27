$( document ).ready(function() {

Shiny.addCustomMessageHandler('updateNavlistPanelDsfr', function(message) {

  var IDsLinks = [];
  var linksTitles = [];
  var allTabs = $("#" + message.navlistPanelId).find("a");

  allTabs.each(function(){ IDsLinks.push(this.id); });
  allTabs.each(function(){ linksTitles.push(this.title); });

  let i = 0;
  let sel = message.titleToDisplay;

  do {
    //recherche id list
    let str = IDsLinks[i];
    let idwons = str.substr(str.length - sel.length, sel.length);
    if(linksTitles[i] == sel || idwons == sel) {
          $("#" + IDsLinks[i]).click();
    }
    i++;
  } while (i < IDsLinks.length);

});
});
