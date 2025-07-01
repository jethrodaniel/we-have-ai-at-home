class Chat < ApplicationRecord
  acts_as_chat

  belongs_to :user
  validates :model_id, presence: true
end
