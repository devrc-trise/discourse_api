require 'csv'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require File.expand_path('../../lib/discourse_api', __FILE__)

# UPDATE CONFIG
client = DiscourseApi::Client.new("https://octopus-discourse.mobonapps.com")
client.api_key = "99039d4340cbf205fa72ecb43058836452027b03cc6d971a0a921e0dcaaf2ebd"
client.api_username = "techadmin"
emails = ['newuser1@mail.com', 'newuser2@mail.com']
# END

invite_links = {}
emails.each do |email|
  invite_links[email] = client.invite_user_link(email: email)
end

# write to CSV file
CSV.open(File.expand_path("../invite_links.csv", __FILE__), "w") do |csv|
  invite_links.each do |email, link|
    csv << [email, link]
  end
end
