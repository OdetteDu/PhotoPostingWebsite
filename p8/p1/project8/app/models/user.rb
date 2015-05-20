class User < ActiveRecord::Base
	has_many :photos
	has_many :comments
	has_many :tags

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :login, uniqueness: true, presence: true
	validates :password, confirmation: true, presence: true
	validates :password_confirmation, presence: true

	def password_valid?(password)
		if self.password_digest == Digest::SHA1.hexdigest(password+self.salt.to_s) then
			return true
		else
			return false
		end
	end

	def password
		return @password
	end

	def password=(password)
		self.salt = Random.rand
		self.password_digest = Digest::SHA1.hexdigest(password+self.salt.to_s)
		@password = password
	end
end
