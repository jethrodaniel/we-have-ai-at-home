class ChatsController < ApplicationController
  before_action :set_chat, only: %i[show edit update destroy]

  def index
    @chat = Chat.new
    @chats = Chat.all # TODO: scope to user's chats
  end

  def show
  end

  def new
    @chat = Chat.new
  end

  def edit
  end

  def create
    @chat = Chat.new(model_id: Current.model, user: Current.user)

    respond_to do |format|
      if @chat.save
        format.html { redirect_to @chat, notice: "Chat was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @chat.update(chat_params)
        format.html { redirect_to @chat, notice: "Chat was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @chat.destroy!

    respond_to do |format|
      format.html { redirect_to chats_path, status: :see_other, notice: "Chat was successfully destroyed." }
    end
  end

  private

  def set_chat
    @chat = Chat.find(params.expect(:id))
  end

  def chat_params
    params.expect(chat: [:model_id]).merge(user: Current.user)
  end
end
