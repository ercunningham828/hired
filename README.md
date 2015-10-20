== HIRED!
Hi Hireology,

Thank you for taking the time to look at my Rails app in action. "Hired!" is a simple job board platform for posting and applying for jobs.  I hope you enjoy reviewing the code and I am happy to answer any questions you may have.

Best,
Emily

==HOW TO RUN HIRED
1. Start by opening the terminal on your computer.
2. Pull this repository on to your local computer, into the directory of your choice, by entering the following prompt:
```
git clone https://github.com/ercunningham828/hired.git
```
3. Once the repository has been downloaded, move into the app directory through this command:
```
cd hired
```
4. From the app directory, run the setup file with this command:
```
./bin/setup
```

The setup file will run the remaining setup steps, as well as open a web browser window for viewing the app.  You may have to manually refresh the web browser after the server has started to see the home page for "Hired!".

==LOGGING IN AS AN ADMIN
By default, Hired! comes with one Admin user.  To log in as the admin user, go to the "/admin" path in the web broswer (i.e "localhost:3000/admin").  This will take you to a login screen where you can enter the following credentials:

**email:** admin@example.com
**password:** helloworld

After you have successfully logged in, you will be brought back to the home page.  A few things will be different:

* *Jobs page*- This page will now allow you to edit current listings or to add a new listing
* *Manage Applications page*- This page will be available at the top left when you are logged in as an admin user.  This page lets you review applications for all jobs.  

==TESTING WITH RSPEC
A basic set of RSPEC tests have been built in for testing the job and application models.  You can run these tests from the command line with the following prompt:
```rspec spec```

==DEPENDENCIES

==GEMS

* **Better Errors and Binding of Caller**- Provides a more information error page, as well as a live console, for troubleshooting.
* **Rspec and FactoryGirl**- These gems provide easier testing mechanisms.
* **Bootstrap**- Bootstrap provides an easy grid template and advance CSS for the app.
* **Font Awesome**- Font Awesome provides icons for downloads and other items.
* **Rails ERD**- Rails ERD provides a PDF visual of the app models. 
* **Faker**- Faker creates random data when seeding test users.
* **Devise**- Devise provided the user authentication framework for the admin user.
* **Pundit**- Pundit policies were created to prevent non-admin users from viewing application information through guessing URLs.
* **Carrierwave**- This gem provides the methods and structure for easily uploading resumes and coverletters.
* **Friendly ID**- This gem was used to convert the id-based URLs to more intuitive, name-based URLs.

