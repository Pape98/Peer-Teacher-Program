class User < ActiveRecord::Base

	has_secure_password

	# Make sure email exists/is unique
	validates :email, presence: true, uniqueness: true
	
end