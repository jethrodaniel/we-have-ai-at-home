require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chat = Chat.create!(user: users(:one), model_id: Current.model)

    login_as users(:one)
  end

  test "should trigger the job" do
    content = "tell me a story"

    assert_enqueued_with(job: ChatStreamJob, args: [@chat.id, content]) do
      post chat_messages_url(@chat), params: {content:}
    end

    assert_redirected_to @chat
  end
end
