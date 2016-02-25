namespace :twilio do
  desc "Send a text to all users"
  task text_all_users: :environment do
    client = TwilioClient.new
    notify = client.notify_weekly
  end

  desc "Send a text to a user based on schedule"
  task text_users_hourly: :environment do
    client = TwilioClient.new
    notify = client.notify_hourly
  end

end
