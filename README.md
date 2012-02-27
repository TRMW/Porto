# What's Porto?

Porto is a simple visual portfolio app running on Rails 3. It provides and interface for adding and editing multiple projects, a blog section, about page, and contact details. You can even customize the section titles if you like. You can see a working demo app here: http://porto-demo.herokuapp.com.

# Setup

Setup for Porto is (hopefully) quite easy.

1. First, you'll want to create your own local Porto install:

    `git clone git@github.com:TRMW/Porto.git`
  
2. Porto uses [Paperclip](https://github.com/thoughtbot/paperclip) for attaching images, and Amazon S3 for hosting them. That being the case, you'll also want to uncomment and edit the `/config/s3.yml` so it contains the correct configuration info for your S3 account. You can set up a new S3 account [here](http://aws.amazon.com), and view your account details [here](https://aws-portal.amazon.com/gp/aws/manageYourAccount).

    If you prefer to use local storage instead of Paperclip, just delete the lines for `:storage` and `:s3_credentials` in both `/app/models/image.rb` and `/app/models/post.rb`. 

3. Deploy Porto to wherever you'll be running it from. [Heroku](http://www.heroku.com) is a great option for small sites. Make sure to run `rake db:schema:load` to set up the database.

4. Navigate to your newly deployed Porto instance in your web browser. You'll be prompted to set your admin password and begin configuring your site. It should be pretty self-explanatory from there.

Thanks for checking out Porto, and please feel free to file issues or contact me with any questions.