class ChatStreamJob < ApplicationJob
  include ActionView::RecordIdentifier

  queue_as :default

  def perform(chat_id, user_content)
    chat = Chat.find(chat_id)

    message = nil

    chat.ask(user_content) do |chunk|
      message = chat.messages.last

      if message && chunk.content.present?
        message.broadcast_append_chunk(chunk.content)
      end
    end

    Turbo::StreamsChannel.broadcast_replace_later_to(
      [chat, "messages"],
      target: dom_id(message),
      partial: "messages/message",
      locals: {message: message}
    )
  end
end
