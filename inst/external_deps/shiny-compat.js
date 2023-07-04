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

  Shiny.addCustomMessageHandler('activate_toggle', function (args) {
    const element = document.getElementById(args.inputId).parentNode.children[1]; // Reference à l'element du DOM
    element.setAttribute('data-fr-checked-label', args.activate) // Méthode pour fermer manuellement la modale
  });

  Shiny.addCustomMessageHandler('deactivate_toggle', function (args) {
    const element = document.getElementById(args.inputId).parentNode.children[1]; // Reference à l'element du DOM
    element.setAttribute('data-fr-unchecked-label', args.deactivate) // Méthode pour fermer manuellement la modale
  });

  Shiny.addCustomMessageHandler('inline', function (inputId) {
    setTimeout(function () {
      console.log("inline");
      var elt = $("#" + inputId).find(".shiny-options-group");
      elt.children().addClass("fr-fieldset__element--inline");
      elt.find(".shiny-options-group").css("display", "flex");
    }, 10)

  });

  Shiny.addCustomMessageHandler('not_inline', function (inputId) {
    setTimeout(function () {
      console.log("noinline");
      var elt = $("#" + inputId).find(".shiny-options-group");
      elt.children().removeClass("fr-fieldset__element--inline");
      elt.find(".shiny-options-group").css("display", "block");
    }, 10)
  });

});


