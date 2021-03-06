class User < ApplicationRecord
	has_secure_password

	validates :username, :email, uniqueness: true
	has_many :ideas
	has_many :authentications, dependent: :destroy
  has_many :comments

    def self.create_with_auth_and_hash(authentication, auth_hash)
      user = self.create!(
        username: auth_hash["username"],
        email: auth_hash["extra"]["raw_info"]["email"],
        password: SecureRandom.hex(3)
      )
      user.authentications << authentication
      return user
    end

    # grab fb_token to access Facebook for user data
    def fb_token
      x = self.authentications.find_by(provider: 'facebook')
      return x.token unless x.nil?
    end

end
