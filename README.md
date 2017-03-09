# README

This is a super-simple Rails 5 application that demonstrates a methodology for structuring JavaScript files for better optimisation with Turbolinks 5.

All of the action happens within the `app/assets/javascripts` directory.

1. Each page is given a data attribute that represents the controller and action names. This value corresponds to a JavaScript *View Object* for that value. e.g. "HomeShow" would be the value for the `show` action in the `HomeController`, and the corresponding javascript view would be `HomeShowView` in the javascripts/views folder.

2. Where a JavaScript view object is available, it is loaded as the `currentPage` value. Where a JavaScript view object is not available, the page loads an instance of the default `Application.View` base class.

3. Whether a page-specific view object, or a general `Application.View` instance, the object will be set up via the `setup()` function when the page is loaded, and torn down via the `teardown()` function when the page is cached.
