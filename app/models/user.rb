class User < ActiveRecord::Base
  devise :two_factor_authenticatable,
         :otp_secret_encryption_key => Rails.application.credentials.devise_two_factor[:ENCRYPTION_KEY]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :posts, dependent: :destroy
end
