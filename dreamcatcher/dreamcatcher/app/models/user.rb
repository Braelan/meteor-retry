class User < ActiveRecord::Base
    attr_reader :password

    after_initialize :ensure_session_token
    has_one :xuser
    has_many :authentications

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def self.find_by_credentials(name, password)
    user= User.find_by(name: name)
    user.try(:is_password?, password) ? user :nil
  end

  def is_password?(unencrypted_password)
    BCrypt::Password.new(self.password_digest).is_password?(unencrypted_password)
  end

  def password=(unencrypted_password)
    if unencrypted_password.present?
      @password = unencrypted_password
      self.password_digest = BCrypt::Password.create(unencrypted_password)
    end
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  def self.from_omniauth(omniauth)
    @authentication =  Authentication.from_omniauth(omniauth)
      if @authentication
        @user = @authentication.user
      else
        @user = User.create!(
        name: omniauth['info']['nickname'],
        password: omniauth['credentials']['secret']
        )
      @authentication = Authentication.create_from_omniauth(omniauth, @user)
     end
     @user
  end

  private

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

end
