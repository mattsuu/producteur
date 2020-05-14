class Talkroom < ApplicationRecord
  belongs_to :receiver
  belongs_to :advisor

  has_many :messages
end
