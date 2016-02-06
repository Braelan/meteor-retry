class Authentication < ActiveRecord::Base
  belongs_to :user

  def self.from_omniauth(omniauth)
    where(uid: omniauth['uid'], provider: omniauth['provider']).first || nil
  end

  def self.create_from_omniauth(omniauth, user)

    Authentication.create!(uid: omniauth['uid'],
    image: omniauth['info']['image'],
    provider: omniauth['provider'],
    user_id: user.id)
  end
end
