# frozen_string_literal: true

module Exceptions
  class EntityError < StandardError
    def initialize(msg = 'Cannot create object')
      super
    end
  end
end
