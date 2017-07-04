class User < ApplicationRecord
	has_secure_password

	validates :username, :email, uniqueness: true
	has_many :ideas
end
