class User < ActiveRecord::Base

  has_many :lists
  has_many :items

  has_secure_password validations: false # supresses default validations

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true, format: {
    with: /(\w+)(@)(\w+)(.)(\w+)/, message: "invalid email"
  } #checks email format ***@***.***

  validates :password, presence: true, on: :create, length: {minimum: 5}
  before_save :generate_token

  private

  def generate_token
    begin
      self[:auth_token] = SecureRandom.urlsafe_base64
    end while User.exists?(auth_token: self[:auth_token])
  end
end
