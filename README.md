# loudr

Loudr is an audio streaming platform where artists can sign up and create content that users from all around the world can enjoy. The app is written with Ruby on Rails and includes many different features such as sign up, login, album creation, playlist creation, listening to and liking songs.

----

## Getting Started

Clone the repo

Run ```bundle install``` to install the required dependencies.

Run ```rake db:migrate``` to create the database.

Run ```thin start --ssl``` to start the server locally which will also allow testing Google login.

Open ```https://localhost:3000/``` in your browswer.


-----

## Sign up

Navigate to ```https://localhost:3000/``` and click the **User Sign Up**, **Creator Sign Up** or **User Google Log In** buttton on the home page to create an account.


-----
## Home Page - User
Once signed up / logged in as a user you'll be taken to the main page ```https://localhost:3000/home``` where you'll have the abiilty to see all albums that are available for listening to.

-----
## Home Page - Creator - Create an album

Once signed up / logged in as a creator you'll be taken to the main page ```https://localhost:3000/home-creator``` where you'll have the ability to click on any album and view the details of that album along with a button to click that will allow you to add a song to that album.

-----
## Edit an Album 
TODO - Build this out

Here on the edit page ```https://localhost:3000/album/:id/edit``` there are options to change the album name, category, released value and released date. If you make changes and save those changes you'll be taken to a album detail page, if you delete the album you'll be taken back to the album index page.

-----
## Delete an Album
TODO - Build this out

This is covered in the above text the controller will just handle the delete request after they've been authenticated one more time before processing the delete request.

---
## Add a song to an album
When you're viewing an album detail page there is a button on the bottom of the page with the label **Add Song to Album** which will take you to the song form and allow you to create a new song which will be tied to the album page that you were just on. Once you create a new song you'll be taken back to the album show page where that new song will now be displayed.


-----
## Edit your account
TODO - Build this out

This page can be accessed anywhere throughout the app once you've logged in click the **Account** selection in the header or navigate to ```https://localhost:3000/users/:id/``` if you're a user and navigate to ```https://localhost:3000/creators/:id/``` if you're a creator. Here you'll see your current username and email and below there's a button "Edit Account" where you can change your username, password, email address or if you're done with the app you can delete your account from here.

-----
## Delete your account
TODO - Build this out

You can get to this page from the **Account** and then clicking on the **Edit Account** link or visit using the direct link which is ```https://localhost:3000/users/:id/edit```. Here you can make changes to username, email or password. Also if you'd like to delete your account you can by clicking the light grey text at the bottom of the form.


TODO - Go back through and add more authentication for each route sending the user / creator back if they try to access a resource that isn't theirs or if they're not logged in.

TODO - Add Recents
TODO - Add Podcasts
TODO - Add Favorites
TODO - Add Playlists
TODO - Add ability to play audio

