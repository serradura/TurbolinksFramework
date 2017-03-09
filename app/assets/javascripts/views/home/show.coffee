class @HomeShowView extends Application.View

  setup: ->
    super()
    console.debug("HomeShowView.setup()")

    $("form.input_form").on "submit", (e) ->
      e.preventDefault()
      $input      = $(this).find("input[type='text']")
      $submit     = $("input[type='submit']")
      $outputList = $("ol.output_list")
      value       = $input.val()
      $("<li >", html: value).appendTo($outputList)
      $submit.removeProp("disabled")
      $input.val("")

  teardown: ->
    super()
    console.debug("HomeShowView.teardown()")