# Local Setup

$ git clone git@github.com:devrc-trise/discourse_api.git

$ cd discourse_api

$ gem install bundler

$ bundle

Update file: {environment}/generate_invite_links.rb
    
Make sure discourse url, api key, username and emails to invite are setup correctly.

$ ruby {environment}/generate_invite_links.rb
    
A CSV file will be generated after: {environment}/invite_links.csv
