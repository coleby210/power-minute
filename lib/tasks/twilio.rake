namespace :twilio do
  desc "Send a text to all users"
  task text_all_users: :environment do
    client = TwilioClient.new
    notify = client.notify_weekly
  end

end
