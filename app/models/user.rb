class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	before_create :create_remember_token
	validates :username, presence: true, length: { within: 3..24 }, uniqueness: true
	validates :email, presence: true, uniqueness: true
	has_secure_password
	validates :password, presence: true, length: { within: 6..30 }

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.digest(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private

		def create_remember_token
			self.remember_token = User.digest(User.new_remember_token)
			# self.update_attribute(:remember_token, User.digest(remember_token))
		end
end
