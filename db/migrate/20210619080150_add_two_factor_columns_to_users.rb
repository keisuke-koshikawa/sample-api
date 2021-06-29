class AddTwoFactorColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    ## Two Factor Auth
    add_column :users, :encrypted_otp_secret, :string
    add_column :users, :encrypted_otp_secret_iv, :string
    add_column :users, :encrypted_otp_secret_salt, :string
    add_column :users, :consumed_timestep, :integer
    add_column :users, :otp_required_for_login, :boolean, comment: '2要素認証の有効・無効フラグ'
    add_column :users, :otp_backup_codes, :text, comment: '暗号化された2要素認証のバックアップコード'
  end
end
