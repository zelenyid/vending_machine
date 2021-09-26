# frozen_string_literal: true

module Validator
  def empty_string?(value)
    !value.is_a?(String) && value.empty?
  end

  def positive_integer?(value)
    value.is_a?(Integer) && value >= 0
  end

  def positive_number?(value)
    value.is_a?(Numeric) && value >= 0
  end
end
