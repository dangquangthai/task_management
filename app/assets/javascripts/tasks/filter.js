var TaskFilter = {
  init: function() {
    $('#include-closed').on('click', function(){
      if (this.checked) {
        window.location = '/backlogs?show_all=true'
      } else {
        window.location = '/backlogs'
      }
    })
  }
}
