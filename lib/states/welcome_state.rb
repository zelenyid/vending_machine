# frozen_string_literal: true

class WelcomeState
  include Singleton

  class << self
    def call
      new.call
    end
  end

  def call
    welcome_message
    SelectProductState.call
  end

  private

  def welcome_message
    puts I18n.t(:welcome_msg)
  end
end
