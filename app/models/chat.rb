class Chat < ApplicationRecord
  acts_as_chat

  belongs_to :user
  validates :model_id, presence: true

  broadcasts_to ->(chat) { [chat, "messages"] }
end
