class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  def self.find_or_create(auth)
    user = User.where(uid: auth[:uid], provider: auth[:provider]).first

    unless user
      puts auth.inspect.to_s
      user = User.create!(
        uid: auth[:uid],
        provider: auth[:provider],
        password: Devise.friendly_token[0, 20],
        email: User.dummy_email(auth),
        name: auth[:info][:name]
      )
    end
    user
  end

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
