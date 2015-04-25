class Item < ActiveRecord::Base
  belongs_to :creator, class_name: "User", foreign_key: "user_id"
  belongs_to :list

  validates :name, presence: true
  validates :description, presence: true
  validates :quantity, presence: true
end
