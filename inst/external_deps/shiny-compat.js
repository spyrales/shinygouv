$(document).ready(function () {

  Shiny.addCustomMessageHandler('show_dsfr_modal', function (args) {
    elt = $(args.ui);
    elt = elt.addClass("fr-modal-shiny");
    $(document.body).append(elt);
    // We offset & wait for the DOM to be ready before showing the modal
    // We do this small manip so that the dsfr fun is able to find the modal
    $(elt).offset();
    $(function () {
      const element = document.getElementById(args.inputId);
      dsfr(element).modal.disclose();
      // triggering shiny events that might be contained in the modal
      // by forcing shiny to rebind all the inputs
      Shiny.bindAll();
    });
  });

  Shiny.addCustomMessageHandler('hide_dsfr_modal', function (inputId) {
    const element = document.getElementById(inputId); // Reference à l'element du DOM
    dsfr(element).modal.conceal(); // Méthode pour fermer manuellement la modale
  });
});


