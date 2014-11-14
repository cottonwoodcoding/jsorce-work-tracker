$ ->
  $('#admin_address_select').on 'change', ->
    addressValue = $(@).val()
    if addressValue != 'blank'
      match = /\/work_logs_by_address.*/.test($(@).val())
      window.location.href = $(@).val() if match

  $('#end_active_work_periods').click ->
    end = confirm('Really end all active work periods? This cannot be undone.')
    if end
      $.ajax "/end_active_work_periods",
        type: 'POST'
        data: {'user_ids': $(@).attr('value')}
        success: (data) ->
          window.location.reload()
        error: (data) ->
          window.location.reload()
