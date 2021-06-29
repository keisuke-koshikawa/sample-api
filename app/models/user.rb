class User < ActiveRecord::Base
  EXCEPT_TOKEN_VALIDATION_RESPONSE_ATTRS = [
    :tokens,
    :created_at,
    :updated_at,
    :encrypted_otp_secret,
    :encrypted_otp_secret_iv,
    :encrypted_otp_secret_salt,
    :consumed_timestep,
    :otp_secret
  ]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :registerable, :recoverable, :rememberable, :trackable, :validatable
  devise :two_factor_authenticatable,
         :otp_secret_encryption_key => "b1b5f68809c53efc655a96a641145f41b9fa49d571a8b9885e3d1b2023229b81"
  include DeviseTokenAuth::Concerns::User

  serialize :otp_backup_codes, JSON

  has_many :posts, dependent: :destroy

  def token_validation_response
    self.as_json(except: EXCEPT_TOKEN_VALIDATION_RESPONSE_ATTRS)
  end
end