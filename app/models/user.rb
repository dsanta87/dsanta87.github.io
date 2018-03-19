class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook twitter instagram]

  #NOTE:  https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview
        # http://tgib23.github.io/blog/2016/11/10/how-to-use-omniauth-plus-devise-on-rails5/

  def self.find_for_oauth(auth)
    # first exists check
    user = User.where(uid: auth.uid, provider: auth.provider).first

    # second exists check
    if user.nil? && auth.provider != "instagram"
      user = User.select{ |u| u.email == auth.info.email.downcase}.first
    end

    # create new user
    unless user

      auth.provider == "instagram" ? email = auth.uid + "@instagram.com" : email = auth.info.email

      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        name: auth.info.name,
        email:    email,
        password: Devise.friendly_token[0, 20]
          )
    end

    user
  end

  def self.new_with_session(params, session)
   super.tap do |user|
     if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
       user.email = data["email"] if user.email.blank?
         end
   end
  end

  private
end
