class Post < ApplicationRecord
  belongs_to :user

  has_one_attached :icatch

  def encoded_icatch
    "data:image/png;base64,#{Base64.encode64(icatch.download)}" if icatch.attached?
  end
end
