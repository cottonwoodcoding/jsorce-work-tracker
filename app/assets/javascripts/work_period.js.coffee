$ ->
  $('.timepicker').timepicker({'scrollDefault': 'now', 'step': 30 })

  $('#address_select').on 'change', ->
      match = /\/new_address.*/.test($(@).val())
      window.location.href = $(@).val() if match