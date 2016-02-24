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
                body: "Hey! Don't forget to update your schedule for the week!"
            )
        end
    end

    def notify_hourly

        hours = {
            "1": "one",
            "2": "two",
            "3": "three",
            "4": "four",
            "5": "five",
            "6": "six",
            "7": "seven",
            "8": "eight",
            "9": "nine",
            "10": "ten",
            "11": "eleven",
            "12": "twelve",
            "13": "thirteen",
            "14": "fourteen",
            "15": "fifteen",
            "16": "sixteen",
            "17": "seventeen",
            "18": "eighteen",
            "19": "nineteen",
            "20": "twenty",
            "21": "twenty-one",
            "22": "twenty-two",
            "23": "twenty-three"
        }

        all_users.each do |user|
            user.schedule.days.each do |day|
                if day.name == Date.today.strftime('%A')
                    current_hour = Time.now.hour.to_s
                    if day[hours[:"#{current_hour}"]]
                        @client.messages.create(
                            from: '+16508352013',
                            to: user.phone_number,
                            body: "Hey! This is an hourly text!"
                        )
                    end
                end
            end
        end
    end

    private

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
        text_users = []
        users = User.all.each do |user|
            text_users << user if user.phone_number
        end
        return text_users
    end

end
