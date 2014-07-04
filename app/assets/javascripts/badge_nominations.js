var ready = function() {

  $(".cancel-btn").click(function(event) {
    cleanAddNominationForm();
  });

};

function cleanAddNominationForm() {
  $('.add-nomination-input').val('');
}

$(document).ready(ready);
