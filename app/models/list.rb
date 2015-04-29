class List < ActiveRecord::Base
  belongs_to :creator, class_name: "User", foreign_key: "user_id"
  has_many :items
  accepts_nested_attributes_for :items, allow_destroy: true

  validates :name, presence: true

end
