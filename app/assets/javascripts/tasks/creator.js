var TaskCreator = {
  init: function() {
    this._onNewTaskFormError();
    this._onNewTaskFormSuccess();
  },

  _onNewTaskFormError: function() {
    $( document ).ajaxError(function( event, jqxhr, settings, thrownError ) {
      $('#new-task-form').html(jqxhr.responseText)
    });
  },

  _onNewTaskFormSuccess: function() {
    $( document ).ajaxSuccess(function( event, xhr, settings ) {
      window.location = '/backlogs'
    });
  }
}
