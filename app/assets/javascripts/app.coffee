# Base class for a JavaScript framework for the entire application.

# https://github.com/turbolinks/turbolinks/#detecting-when-a-preview-is-visible
TurbolinksCachePreview =
  isON: -> document.documentElement.hasAttribute("data-turbolinks-preview")
  getPrefix: -> if @isON() then "[CACHE] " else ""

Logger =
  LEVEL: "debug"
  treatMessage: (msg) -> "#{TurbolinksCachePreview.getPrefix()}#{msg}"
  perform: (msg) -> console[@LEVEL] @treatMessage(msg)

ViewFinder =
  getClassName: -> $("body[data-page-class]").data().pageClass
  getViewName: -> "#{@getClassName()}View"
  getCurrent: -> window[@getViewName()] || Application.View
  find: -> new (@getCurrent())()

class @Application
  @setup: ->
    @currentPage = ViewFinder.find()
    @currentPage.setup()

  @teardown: -> @currentPage.teardown()

  # Base class for a JavaScript page view. Subclass this to add custom behaviour for a
  #   a specific page.
  #
  #   Important! Subclasses MUST define setup() and teardown() and call super() within
  #     both of those functions.
  class @View
    constructor: ->
      @logger = Logger

    # # Set up global widgets here.
    # # Example:
    # $(".lightbox").lightbox()
    setup: ->
      @logger.perform("Application.View.setup()")

    # # Tear down global widgets here.
    # # Example:
    # $(".lightbox").lightbox().delete()
    teardown: ->
      @logger.perform("Application.View.teardown()")


# Add listeners to implement the above code when Turbolinks has updated the page.
document.addEventListener 'turbolinks:load',          Application.setup, {once: true}
document.addEventListener 'turbolinks:render',        Application.setup
document.addEventListener 'turbolinks:before-render', Application.teardown
