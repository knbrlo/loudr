# spec

- [x] Use the Ruby on Rails framework.
    - Used rails to create the app.

- [x] Include at least one has_many.
    - There are two has_many relationships in my app, users and creators both of which have many albums.

- [x] At least one belongs_to.
    - This is covered in the album model where the album belongs_to the creator.

- [x] At least two has_many :through relationships
    - This is coverd in the user model and the creator model. 
    - A user has_many :creators, through: :albums
    - A creator has_many :users, through: :albums

- [x] Include a many-to-many relationship implemented with has_many :through associations. The join table must include a user-submittable attribute — that is to say, some attribute other than its foreign keys that can be submitted by the app's user
    - This is covered with the albums table where I've got two has_many through relationships with users and creators.

- [x] Your models must include reasonable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data.
    - This is covered under the max length for albums and songs.

- [x] You must include at least one class level ActiveRecord scope method. a. Your scope method must be chainable, meaning that you must use ActiveRecord Query methods within it (such as .where and .order) rather than native ruby methods (such as #find_all or #sort).

- [x] Your application must provide standard user authentication, including signup, login, logout, and passwords.
    - This is covered as the users can sign up, login, logout and secure passwords are used.
     - This is covered as the creators can sign up, login, logout and secure passwords are used.

- [x] Your authentication system must also allow login from some other service. Facebook, Twitter, Foursquare, Github, etc...
    - User can sign in with omniauth-google-oauth2

- [x] You must include and make use of a nested resource with the appropriate RESTful URLs.
    - This is covered with the use of albums that have a nested songs resource where they can see a new form, create a new song and then be taken back to the album page to see all the songs for that album.


- [x] You must include a nested new route with form that relates to the parent resource.
    - This is covered with being able to create an album, then on that album page being able to create a song for that album where the song form is nested within the album form after an album has been created (also it's late when I wrote that so hopefully it makes sense.)

- [x] You must include a nested index or show route.
    - This is covered with an album and song index page within that album url.
    ```
    http://127.0.0.1:3000/albums/1/songs
    ```

- [x] Your forms should correctly display validation errors.
    - Validation errors are displayed on the Album creation form.
    - Validation errors are displayed on the Song creation form.


- [x] Your fields should be enclosed within a fields_with_errors class.
    - Looks like this is passing when  there are errors, then the "field_with_errors" surrounds the element.

- [x] Error messages describing the validation failures must be present within the view.
    - This is completed with the sign up forms for creators and users, if the username or email has already been taken it'll display an error on the screen.

- [x] Your application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app.
    - This is complete with the use of error partial.

- [x] Logic present in your controllers should be encapsulated as methods in your models.
    - Don't have any custom logic in the controllers that needs to be moved. 

- [x] Your views should use helper methods and partials when appropriate.
    - I've got helper methods included in my application_helper.rb file to assist with standard login checks for users and creators.
    - I'm using partials for my errors and will be using them for my forms later on.

- [x] Follow patterns in the Rails Style Guide and the Ruby Style Guide.
    - An example of this is covered in the use of nested routes 


- [x] Do not use scaffolding to build your project. Your goal here is to learn. Scaffold is a way to get up and running quickly, but learning a lot is not one of the benefits of scaffolding.
    - This is covered as the only command that I've used are ones to create the app and ones to create models as I need them.

- [x] Record at least a 30 min coding session (I'll keep this on Dropbox if needed.)
