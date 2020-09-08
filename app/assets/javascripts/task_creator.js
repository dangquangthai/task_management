var TaskCreator = {
  init: function() {
    this._onFormError();
    this._onFormSuccess();
  },

  _onFormError: function() {
    $( document ).ajaxError(function( event, jqxhr, settings, thrownError ) {
      $('#new-task-form').html(jqxhr.responseText)
    });
  },

  _onFormSuccess: function() {
    $( document ).ajaxSuccess(function( event, xhr, settings ) {
      window.location = '/backlogs'
    });
  }
}
