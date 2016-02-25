class WorkoutTemplate < ActiveRecord::Base
	belongs_to :creator, class_name: "User", foreign_key: :creator_id
	belongs_to :category
  has_many :workouts
  has_many :favorites

  validates :category_id, presence: true
end
