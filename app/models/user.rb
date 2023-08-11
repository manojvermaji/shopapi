class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true


#   def generate_password_token!
#     self.reset_password_token = generate_token
#     self.reset_password_sent_at = Time.now.utc
#     save!
#   end

#   def password_token_valid?
#    (self.reset_password_sent_at + 4.hours) > Time.now.utc
#   end

#   def reset_password!(password)
#    self.reset_password_token = nil
#    self.password = password
#    save!
#   end

#   private

#   def generate_token
#     SecureRandom.hex(10)
#   end
 
 has_many :orders, dependent: :destroy

end
