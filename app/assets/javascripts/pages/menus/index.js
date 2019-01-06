document.addEventListener('turbolinks:load', function() {
  function ajaxMenuLoad(url) {
    return $.ajax({
      url:     url,
      type:    'GET',
      success: function(result) {
        $('.tab-content').html(result)
      }
    });
  }

  $('body').on('click', '.nav-tabs .nav-link', function(e) {
    e.preventDefault ? e.preventDefault() : (e.returnValue = false);

    let url = e.currentTarget.getAttribute('href');

    $('.nav-link').removeClass('active');
    $(this).addClass('active');

    return ajaxMenuLoad(url);
  });

  $(window).on('load', function(){
    let $menu = $('.nav-tabs .nav-link:last');

    $menu.addClass('active');

    if ($menu.prevObject.length) {
      ajaxMenuLoad($menu.attr('href'));
    }
  });
});

