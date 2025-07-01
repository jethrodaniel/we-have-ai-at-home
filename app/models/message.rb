class Message < ApplicationRecord
  acts_as_message

  belongs_to :chat
  belongs_to :tool_call

  validates :role, presence: true
end
