var ready = function() {
  $("#modal-submit").click(function(event) {
    event.preventDefault();
    $("#new_badge_nomination").submit();
    $("#add-nomination-modal").modal('hide');
  });
}

$(document).ready(ready);
