# frozen_string_literal: true

SemanticLogger.default_level = :trace

client   = Mongo::Client.new('mongodb://127.0.0.1:27017/test')
database = client['test']

appender = SemanticLogger::Appender::MongoDB.new(
  uri:             'mongodb://127.0.0.1:27017/test',
  collection_size: 1024**3,
  application:     Rails.application.class.name
)
SemanticLogger.add_appender(appender: appender)

logger = SemanticLogger['Example']
logger.trace "Low level trace information"
