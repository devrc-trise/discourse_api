require 'csv'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require File.expand_path('../../lib/discourse_api', __FILE__)

# UPDATE CONFIG
client = DiscourseApi::Client.new("https://forum.octopus.energy")
client.api_key = "GENERATE_AND_COPY_API_KEY_ON_DISCOURSE_ADMIN"
client.api_username = "DISCOURSE_ADMIN_USERNAME"
emails = ['sampleuser1@mail.com', 'sampleuser2@mail.com']
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
