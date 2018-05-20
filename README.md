# IdeaBox

Let’s create an app to record your ideas. Host your app live on Heroku.

# Ideas

An idea can be created by a user.
An idea can be edited/updated only by the user that created it.
An idea can be destroyed only by the user that created it.
When a user types a new idea into the form, there is a selection dropdown for choosing the correct category. See Categories below for more information.

# Categories

Ideas belong to a category.
Categories can be created AND destroyed by a logged-in admin user (regular logged in users cannot create categories).

# Images

Users can add an image to their own idea.
An image can have many ideas and an idea can have many images.
Images can only be created by an admin user.
The most simplistic way to implement images is to store a url to an online image. If you’re feeling fancy and want to upload your own images, check out Carrierwave or Paperclip.

# Authentication and Authorization

Users need to log in to see their ideas.
Users can only see their own ideas – they should not be able to visit another user’s page.
Users cannot create ideas for other users.
Users cannot create new categories – only the admin can do that.
Users cannot create images – only the admin can do that; however, a user can assign an image to their idea.
Visitors can create user accounts.

# User Experience

The application has been styled.
The application uses a balanced, considered color scheme.
The application implements a font (that is not the default font).
The application utilizes a nav bar.
The style shows evidence of intentional layout.
Space and text is balanced. White space is used to visually separate content.
The application is easily usable. The user can intuitvely navigate between different portions of the application without manually entering the URL into the nav-bar or using the back button on their browser.

# Database

Properly implements a one-to-many relationship
Properly implements a many-to-many relationship
Utilizes primary and foreign keys appropriately

# Code Quality

Logic lives in the appropriate files
Methods are refactored and follow SRP
Naming follows convention

# Testing

Project has a running test suite
Test suite includes robust feature tests
Test suite includes tests for validations
Test suite includes tests for methods that they have created on the models

# Optional Extensions

Implement Twitter, Github, or Facebook OAuth login
Use HAML for your views
TDD using RSpec instead of Test::Unit
