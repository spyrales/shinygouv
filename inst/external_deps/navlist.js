$(document).on('click', '.nl-link', function(event) {
  event.preventDefault();
  $(".nl-link").each(function () {
    $( this ).parent().removeClass('fr-sidemenu__item--active');
    $( this ).removeAttr("aria-current");
    $(this).attr("aria-selected", "false");
  })
  $( this ).parent().addClass("fr-sidemenu__item--active");
  $(this).attr("aria-current", "page");
  $(this).attr("aria-selected", "true");

});
/*  accessibilité possibilité de changer d'item dans le menu avec les flêche du clavier */
$(document).on('keydown', '.nl-link', function(event) {
  keydownswitch(event,$( this ));
});
function keydownswitch(ev,el) {
  switch (ev.which) {
        case 37:
            // left
            switchContainer(el.parent().prev());
            break;

        case 38:
            // up
            switchContainer(el.parent().prev());
            break;

        case 39:
            // right
            switchContainer(el.parent().next());
            break;

        case 40:
            // down
            switchContainer(el.parent().next());
            break;

        default:
            return; // exit this handler for other keys
    };
    function switchContainer(el){
      if(el.length > 0){
        let myalist = el.children();
        myalist[0].focus();
        myalist.click();
      }
    }
}
