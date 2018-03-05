include ActiveModel::SecurePassword

class User < ActiveRecord::Base
    has_secure_password
    validates :email, uniqueness: {case_sensitive: false}
    validates_presence_of :email
    validates_presence_of :name
    validates_presence_of :password
    validates_length_of :password, :minimum => 5
    validates_presence_of :password_confirmation

    def self.authenticate_with_credentials(email, password)
      email_auth = email.squish.downcase
      @user = User.find_by_email(email_auth)
      if @user && @user.authenticate(password)
        @user
      else
        nil
      end
    end
end

