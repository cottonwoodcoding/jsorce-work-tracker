$ ->
  $('#new_work_log').on 'submit', (e) ->
    if $('#address_select').val() == 'blank'
      e.preventDefault()
      alert('You need to pick an address!')