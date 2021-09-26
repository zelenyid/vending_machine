# frozen_string_literal: true

class AppEnvironment
  def self.development?
    ENV['APP_ENVIRONMENT'].to_sym == :development
  end

  def self.test?
    ENV['APP_ENVIRONMENT'].to_sym == :test
  end
end
