class MessagesController < ApplicationController
  before_action :set_chat, only: %i[create]

  def create
    ChatStreamJob.perform_later(@chat.id, params.expect(:content))

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @chat }
    end
  end

  private

  def set_chat
    @chat = Chat.where(user: Current.user).find(params.expect(:chat_id))
  end
end
