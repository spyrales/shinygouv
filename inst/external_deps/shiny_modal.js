$( document ).ready(function() {

console.log("Coucou")

Shiny.addCustomMessageHandler('show_dsfr_modal', function(inputId) {
      const element = document.getElementById(inputId); // Reference à l'element du DOM
      dsfr(element).modal.disclose();
  });

  Shiny.addCustomMessageHandler('hide_dsfr_modal', function(inputId) {
    const element = document.getElementById(inputId); // Reference à l'element du DOM
    dsfr(element).modal.conceal(); // Méthode pour fermer manuellement la modale
  });

});
