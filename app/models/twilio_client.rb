class TwilioClient
    require 'twilio-ruby'

    def initialize
        @client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
    end

    def notify_weekly
        all_users_numbers.each do |number|
            @client.messages.create(
                from: '+16508352013',
                to: number,
                body: weekly_text
            )
        end
    end

    def user_notify_hourly
    end

    private

    def weekly_text
        return "Hey! Don't forget to update your schedule for the week!"
    end

    def all_users_numbers
        new_array = []
        User.pluck(:phone_number).each do |number|
            if number
                new_array << number
            end
        end
        return new_array
    end

    def all_users
    end

end
