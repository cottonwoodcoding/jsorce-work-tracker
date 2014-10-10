$ ->
  $('#end_work_period').click (e) ->
    e.preventDefault()
    $.ajax
      url: $(@).attr('href')
      type: 'POST'
      success: ->
        window.location.reload()

  $('#job_select').on 'change', ->
    $value = $(@).val().trim()
    if $value != 'blank'
      window.location.href = $value

  $('.delete_work_log').click ->
    deleteConfirm = confirm('Really Delete?')
    if deleteConfirm
      $.ajax "/work_log/delete/#{$(@).attr('value')}",
        type: 'POST'
        success: (data) ->
          window.location.reload()
        error: (data) ->
          window.location.reload()

