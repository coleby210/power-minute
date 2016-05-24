require 'twilio-ruby'

module TwilioHelper
  def send_sms(user_phone, message)
    p "Rails.application.secrets.twilio_account_sid::::::::"
    p Rails.application.secrets.twilio_account_sid
    p "Rails.application.secrets.twilio_auth_token:::::::::"
    p Rails.application.secrets.twilio_auth_token
    client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
    message = client.messages.create from: '+16508352013', to: user_phone, body: message
  end
end
