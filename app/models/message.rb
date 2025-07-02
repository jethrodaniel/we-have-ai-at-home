class Message < ApplicationRecord
  include ActionView::RecordIdentifier # for `dom_id`

  acts_as_message

  belongs_to :chat
  belongs_to :tool_call, optional: true

  validates :role, presence: true

  after_create_commit -> do
    broadcast_append_later_to [chat, "messages"]
  end

  def broadcast_append_chunk(chunk_content)
    broadcast_append_to(
      [chat, "messages"],
      target: dom_id(self, "content"),
      html: chunk_content
    )
  end
end
