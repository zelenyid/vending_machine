# frozen_string_literal: true

class ValidatableEntity
  include Validator

  def initialize
    @errors = []
  end

  def save
    raise Exceptions::EntityError, @errors unless valid?

    save_to_db
  end

  protected

  def valid?
    validate
    @errors.empty?
  end

  def validate
    raise NotImplementedError
  end

  def save_to_db
    raise NotImplementedError
  end
end
