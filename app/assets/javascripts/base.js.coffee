$ ->
  setTimeout (->
    $('.alert').slideToggle()
    return
  ), 3000

  $('.datepicker').datepicker()