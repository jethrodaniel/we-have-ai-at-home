class Current < ActiveSupport::CurrentAttributes
  attribute :session
  delegate :user, to: :session, allow_nil: true

  def model = "ggml-org/Qwen3-1.7B-GGUF"
end
