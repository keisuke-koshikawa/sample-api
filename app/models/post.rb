class Post < ApplicationRecord
  acts_as_copy_target

  include Rails.application.routes.url_helpers

  belongs_to :user

  has_one_attached :icatch

  def icatch_url
    return nil unless icatch.attached?

    url_for(icatch)
  end
end
