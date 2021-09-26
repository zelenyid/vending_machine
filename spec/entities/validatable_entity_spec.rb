# frozen_string_literal: true

RSpec.describe ValidatableEntity do
  subject(:validatable_entity) { described_class.new }

  describe '#save' do
    it 'raise NotImplementedError' do
      expect { validatable_entity.save }.to raise_error(NotImplementedError)
    end
  end
end
