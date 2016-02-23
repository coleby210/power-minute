
class NotificationsController < ApplicationController
  include TwilioHelper

  skip_before_action :verify_authenticity_token

  def notify
    # send_sms('+12136634691', 'TEST')
    send_sms(params['number'], 'TEST')
  end

end
