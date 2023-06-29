$(document).ready(function () {
  debugger;
  $(".navbarPanel_dsfr").hide();

  // window.location.hash
  hash = window.location.hash;

  // Get all nav links
  if (hash != '') {
    idArray = [];
    $('.navbarPanel_dsfr').each(function () {
      idArray.push(this.id);
    });
    hash = hash.replace('#', '');
    if (idArray.includes(hash)) {
      console.log(hash);
      showTabFromHash(hash);
    } else {
      showFirstTab();
    }
  } else {
    showFirstTab();
  }


});

const showTab = function (that) {
  $(".fr-nav__link").removeAttr("aria-current");
  $(that).attr("aria-current", "page");
  $(".navbarPanel_dsfr").hide();
  $("#" + $(that).data("id")).show();
  $("#" + $(that).data("id")).trigger("show");
  $("#" + $(that).data("id")).trigger("shown");
}

const showTabFromHash = function (hash) {
  $(".fr-nav__link").removeAttr("aria-current");
  $(".navbarPanel_dsfr").hide();
  $("#" + hash).show();
  $("#" + hash).trigger("show");
  $("#" + hash).trigger("shown");
  $(`a[href$='#${hash}']`).attr("aria-current", "page")
}

const showFirstTab = function () {
  $(".fr-nav__link").removeAttr("aria-current");
  $(".navbarPanel_dsfr").hide();
  $(".navbarPanel_dsfr:first").show();
  $(".navbarPanel_dsfr:first").trigger("show");
  $(".navbarPanel_dsfr:first").trigger("shown");
  $(".fr-nav__link:first").attr("aria-current", "page");
}