$(document).ready(function () {
  $(".navbarPanel_dsfr").hide();
  $(".navbarPanel_dsfr:first").show();
  $(".navbarPanel_dsfr:first").trigger("show");
  $(".navbarPanel_dsfr:first").trigger("shown");
});

const showTab = function (that) {
  $(".fr-nav__link").removeAttr("aria-current");
  $(that).attr("aria-current", "page");
  $(".navbarPanel_dsfr").hide();
  $("#" + $(that).data("id")).show();
  $("#" + $(that).data("id")).trigger("show");
  $("#" + $(that).data("id")).trigger("shown");
}