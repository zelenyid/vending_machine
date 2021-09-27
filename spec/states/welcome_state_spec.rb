# frozen_string_literal: true

RSpec.describe WelcomeState do
  let(:welcome_msg) do
    <<~PUBLISHED
      #{I18n.t(:welcome_msg)}
    PUBLISHED
  end

  describe '#call' do
    before do
      allow(SelectProductState).to receive(:call).and_return(nil)
    end

    it 'prints welcome message' do
      expect { described_class.call }.to output(welcome_msg).to_stdout
    end
  end
end
