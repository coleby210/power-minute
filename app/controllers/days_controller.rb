class DaysController < ApplicationController
  include TwilioHelper
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def update
    hours = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen", "twenty", "twentyone", "twentytwo", "twentythree"]
    today = Day.find(params["day_id"])

    if params["day"]
      difference = hours - params["day"]
      params["day"].each do |truth|
        today[truth] = true
      end
      difference.each do |falseness|
        today[falseness] = false
      end
    else
      hours.each do |hour|
        today[hour] = false
      end
    end
    today.save

    redirect_to "/schedule"
  end

end
