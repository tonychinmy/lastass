class User < ApplicationRecord
	has_secure_password

	attr_accessor :username, :email, :password, :password_confirmation
	validates :username, :email, uniqueness: true
end
