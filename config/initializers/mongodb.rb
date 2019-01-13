# frozen_string_literal: true

mongo_log_url  = ENV.fetch('MONGO_LOG_URL', 'mongodb://127.0.0.1:27017/log')
mongo_log_size = ENV.fetch('MONGO_LOG_SIZE', 1024.megabytes)
mongo_log_app  = ENV.fetch('MONGO_LOG_APP', Rails.application.class.name)

Mongo::Client.new(mongo_log_url)

appender = SemanticLogger::Appender::MongoDB.new(
  uri:             mongo_log_url,
  collection_size: mongo_log_size,
  application:     mongo_log_app
)

SemanticLogger.add_appender(appender: appender)
