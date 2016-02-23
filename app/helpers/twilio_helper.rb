require 'twilio-ruby'

module TwilioHelper
  def send_sms(user_phone, message)
    client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, ENV['TWILIO_AUTH_TOKEN']
    message = client.messages.create from: '+16508352013', to: user_phone, body: message
    render plain: message.status
  end

end

# helpers do
#   def send_sms(user_phone, message)
#     client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, ENV['TWILIO_AUTH_TOKEN']
#     message = client.messages.create from: '+16508352013', to: user_phone, body: message
#     render plain: message.status
#   end
# end


  # def notify
  #   # p "&&&&&&&&&&&&&&&&&&&&&&&&"
  #   # p "PRINT FROM RAILS.APPLICATION.SECRETS SID & TOKEN"
  #   # p Rails.application.secrets.twilio_account_sid
  #   # p Rails.application.secrets.twilio_auth_token
  #   # p "&&&&&&&&&&&&&&&&&&&&&&&&"
  #   # p "PRINT FROM ENV BELOW: SID & TOKEN"
  #   # p ENV['TWILIO_ACCOUNT_SID']
  #   # p ENV['TWILIO_AUTH_TOKEN']
  #   # Grabbing the SID from application.secrets and the AUTH token from .ENV file to make authentication work below
  #   p params
  #   client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, ENV['TWILIO_AUTH_TOKEN']
  #   message = client.messages.create from: '+16508352013', to: '+19097308585', body: 'I LIKE BIG BOOTs'
  #   render plain: message.status