# Base class for a JavaScript framework for the entire application.
class @Application

  @setup: =>
    @currentPage = try
      pageClassName = $("body[data-page-class]").data().pageClass
      eval("new #{pageClassName}View()")
    catch
      new Application.View()
    @currentPage.setup()


  @teardown: =>
    @currentPage.teardown()

  # Base class for a JavaScript page view. Subclass this to add custom behaviour for a
  #   a specific page.
  #
  #   Important! Subclasses MUST define setup() and teardown() and call super() within
  #     both of those functions.
  class @View

    # # Set up global widgets here.
    # # Example:
    # $(".lightbox").lightbox()
    setup: ->
      console.debug("Application.View.setup()")

    # # Tear down global widgets here.
    # # Example:
    # $(".lightbox").lightbox().delete()
    teardown: ->
      console.debug("Application.View.teardown")


# Add listeners to implement the above code when Turbolinks has updated the page.
document.addEventListener 'turbolinks:load',          Application.setup, {once: true}
document.addEventListener 'turbolinks:render',        Application.setup
document.addEventListener 'turbolinks:before-render', Application.teardown
