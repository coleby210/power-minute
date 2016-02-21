class Group < ActiveRecord::Base
  validates :name, :admin_id, presence: true
  belongs_to :admin, class_name: "User", foreign_key: :admin_id
  has_many :groups_users
  has_many :members, through: :groups_users, source: :member

end

# class GroupsUsers < ActiveRecord::Migration
#   def change
#     create_table :groups_users do |t|
#       t.integer :member_id, null: false, presence: true
#       t.references :group, index: true, null: false

#       t.timestamps null: false
#     end
#   end
# end
