class MemberChat < ApplicationRecord
  belongs_to :receiver, optional: true
  belongs_to :advisor, optional: true

  validates :content, presence: true, unless: :image?

  mount_uploader :image, ImageUploader
end
