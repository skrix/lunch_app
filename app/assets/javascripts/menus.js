(function() {
  $(function() {
    $(document).on('click', '.nav-link', function(e) {
      e.preventDefault ? e.preventDefault() : (e.returnValue = false);

      let url = e.currentTarget.getAttribute('href');

      return $.ajax({
        url:     url,
        type:    'GET',
        success: function(result) {
          $('.tab-content').html(result)
        }
      });
    });
  });
}).call(this);

