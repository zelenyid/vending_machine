# frozen_string_literal: true

class FinishState
  include Singleton

  class << self
    def call
      new.call
    end
  end

  def call
    finish_message
    exit
  end

  private

  def finish_message
    puts I18n.t(:finish_msg)
  end
end
