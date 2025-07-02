class ChatsController < ApplicationController
  before_action -> { helpers.load_models_if_needed }
  before_action :set_chat, only: %i[show]

  def show
  end

  def new
    @chat = Chat.new
  end

  def create
    @chat = Chat.create!(model_id: Current.model, user: Current.user)

    if (system_prompt = params[:system_prompt]).present?
      @chat.with_instructions(system_prompt)
    end

    redirect_to @chat
  end

  private

  def set_chat
    @chat = Chat.find(params.expect(:id))
  end
end
