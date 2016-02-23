class NotificationsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def notify
    client = Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"])
    message = client.messages.create from: '+16508352013', to: '+19254374085', body: 'I LIKE BIG BOOTY'
    render plain: message.status
  end

end