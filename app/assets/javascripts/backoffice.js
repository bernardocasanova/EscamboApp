//= require bootstrap_sb_admin_base_v2
//= require bootbox

/* Override rails data-confirm */
$.rails.allowAction = function(element) {
  var message = element.attr('data-confirm');
  if (!message) { return true; }

  var opts = {
    title: "Confirmação",
    message: message,
    buttons: {
        cancel: {
            label: 'Cancel',
            className: 'btn-danger'
        },
        confirm: {
            label: 'Confirm',
            className: 'btn-success'
        }
    },
    callback: function(result) {
      if (result) {
        element.removeAttr('data-confirm');
        element.trigger('click.rails')
      }
    }
  };

  bootbox.confirm(opts);

  return false;
}
