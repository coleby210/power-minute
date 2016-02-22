class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :workout_template

  validates :workout_template_id, uniqueness: true
end
