# frozen_string_literal: true

RSpec.describe Money do
  describe '#save' do
    context 'when valid params' do
      it 'save product to db' do
        expect { described_class.new('5', 3).save }.to change { described_class.all.count }.from(0).to(1)
      end
    end

    context 'when invalid params' do
      it 'raise error' do
        expect { described_class.new('', -10).save }.to raise_error(Exceptions::EntityError)
      end
    end
  end

  describe '#to_h' do
    let(:returned_hash) do
      {
        denomination: '5',
        count: 2
      }
    end

    it 'returns hash' do
      expect(described_class.new('5', 2).to_h).to eq(returned_hash)
    end
  end

  describe '.all' do
    let(:expected_result) do
      {
        '5' => 3,
        '2' => 4
      }
    end

    before do
      create_money('5', 3)
      create_money('2', 4)
    end

    it 'return array of products' do
      expect(described_class.all).to eq(expected_result)
    end
  end
end
