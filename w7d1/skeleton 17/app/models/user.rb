class User < ApplicationRecord
    after_initialize :ensure_session_token
    attr_reader :password 

    validates :user_name, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :session_token, presence: true, uniqueness: true 

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token
    
    end 

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64

    end 

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password 

    end 

    def is_password?(password)
        password_object = BCrypt::Password.new(self.password_digest)
        password_object.is_password?(password)

    end 

    def self.find_by_credentials(user_name, password)
        user = User.find_by(user_name: user_name)
        if user && user.is_password?(password)
            return user 
        else 
            return nil 
        end 


    end 
       
end
