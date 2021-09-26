# frozen_string_literal: true

RSpec.describe FinishState do
  let(:finish_msg) do
    <<~PUBLISHED
      #{I18n.t(:finish_msg)}
    PUBLISHED
  end

  describe '#call' do
    it 'prints finish message' do
      expect do
        expect { described_class.call }.to output(finish_msg).to_stdout
      end.to raise_error(SystemExit)
    end
  end
end
