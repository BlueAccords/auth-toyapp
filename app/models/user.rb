class User < ActiveRecord::Base
	validates :username, presence: true, length: { within: 3..24 }, uniqueness: true
	validates :email, presence: true, uniqueness: true
	validates :password, presence: true, length: { within: 6..30 }
	has_secure_password
end
