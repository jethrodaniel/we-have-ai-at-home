require "test_helper"

class ChatStreamJobTest < ActiveJob::TestCase
  def setup
    @chat = Chat.create!(user: users(:one), model_id: Current.model)
  end

  test "should output chunks" do
    skip "need to mock LLM server response"

    assert_not @chat.messages.present?

    perform_enqueued_jobs do
      ChatStreamJob.perform_later(@chat.id, "what's your favorite food?")
    end

    assert_equal 2, @chat.reload.messages.count
  end
end
