class @HomeShowView extends Application.View
  constructor: ->
    super() # Call super to set the @logger
    @$form = $("form.input_form")

  setup: ->
    @logger.perform("  HomeShowView.setup()")

    @$form.on "submit", (e) ->
      e.preventDefault()
      $input      = $(this).find("input[type='text']")
      $submit     = $("input[type='submit']")
      $outputList = $("ol.output_list")
      value       = $input.val()
      $("<li >", html: value).appendTo($outputList)

      # You won't disable the submit button in this way.
      # The responsible by disable it is Rails/Jquery UJS
      # See: http://api.rubyonrails.org/classes/ActionView/Helpers/FormTagHelper.html#method-i-submit_tag
      $submit.removeProp("disabled")
      $input.val("")

  teardown: ->
    # https://github.com/turbolinks/turbolinks#building-your-turbolinks-application
    # The documentation warns: In particular, you can no longer depend on a full page load to reset your environment every time you navigate...
    # So every time you attached an event you'll need to undo it!
    @$form.off "submit"
    @logger.perform("  HomeShowView.teardown()")
