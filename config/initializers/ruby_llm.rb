RubyLLM.configure do |config|
  config.openai_api_key = SecureRandom.uuid
  config.openai_api_base = "http://127.0.0.1:8080"
  config.logger = Rails.logger
  config.log_level = :debug if Rails.env.development?
end

Rails.application.config.before_initialize do
  RubyLLM.models.refresh!
end
