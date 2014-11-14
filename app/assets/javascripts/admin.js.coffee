$ ->
  $('#admin_address_select').on 'change', ->
    addressValue = $(@).val()
    if addressValue != 'blank'
      match = /\/work_logs_by_address.*/.test($(@).val())
      window.location.href = $(@).val() if match
