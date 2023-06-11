class User < ApplicationRecord
    before_validation :ensure_session_token
    attr_reader :password

    validates :username, :session_token, presence: true
    validates :password_digest, presence: {message: "Password can't be blank"}
    validates :password, length: {minimum: 6, allow_nil: true}

    def create
        @user = User.new(user_params)
    
        if @user.save
          render json: @user
        else
          render json: @user.errors.full_messages
        end
    end

    def new
        render :new
    end
    

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        BCrypt::Password.new(password_digest).is_password?(password)
      end

    def ensure_session_token
        self.session_token ||= generate_unique_session_token
    end

    def generate_unique_session_token
        loop do
          session_token = SecureRandom::urlsafe_base64(16)
          return session_token unless User.exists?(session_token: session_token)
        end
    end

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        return nil if user.nil?
        user.is_password?(password) ? user : nil
    end


    private
    
    def user_params
      params.require(:user).permit(:username, :password)
    end
end