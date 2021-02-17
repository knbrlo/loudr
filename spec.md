# spec

- [ ] Explain on each point how the requirement has been met.

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

- [ ] Include a many-to-many relationship implemented with has_many :through associations. The join table must include a user-submittable attribute — that is to say, some attribute other than its foreign keys that can be submitted by the app's user
- [ ] Your models must include reasonable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data.
- [ ] You must include at least one class level ActiveRecord scope method. a. Your scope method must be chainable, meaning that you must use ActiveRecord Query methods within it (such as .where and .order) rather than native ruby methods (such as #find_all or #sort).
- [x] Your application must provide standard user authentication, including signup, login, logout, and passwords.
- [ ] Your authentication system must also allow login from some other service. Facebook, Twitter, Foursquare, Github, etc...
- [ ] You must include and make use of a nested resource with the appropriate RESTful URLs.
- [ ] You must include a nested new route with form that relates to the parent resource.
- [ ] You must include a nested index or show route.
- [ ] Your forms should correctly display validation errors.
- [ ] Your fields should be enclosed within a fields_with_errors class
- [ ] Error messages describing the validation failures must be present within the view.
- [ ] Your application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app.
- [ ] Logic present in your controllers should be encapsulated as methods in your models.
- [ ] Your views should use helper methods and partials when appropriate.
- [ ] Follow patterns in the Rails Style Guide and the Ruby Style Guide.
- [x] Do not use scaffolding to build your project. Your goal here is to learn. Scaffold is a way to get up and running quickly, but learning a lot is not one of the benefits of scaffolding.
- [ ] Record at least a 30 min coding session (I'll keep this on Dropbox if needed.)
- [ ] Submit a video of how a user would interact with your working web application.
- [ ] Write a blog post about the project and process.
- [ ] When done, submit your GitHub repo's url, a link to your video demo, and a link to your blog post in the corresponding text boxes in the right rail. Hit "I'm done" to wrap it up.