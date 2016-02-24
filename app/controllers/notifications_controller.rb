class NotificationsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def notify
        client = TwilioClient.new
        result = client.notify_weekly
        render plain: result.status
    end
end
