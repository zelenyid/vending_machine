# frozen_string_literal: true

RSpec.describe Product do
  describe '#save' do
    context 'when valid params' do
      it 'save product to db' do
        expect { described_class.new('test', 3, 2).save }.to change { VendingMachine.new.products.count }.from(0).to(1)
      end
    end

    context 'when invalid params' do
      it 'raise error' do
        expect { described_class.new('', -10, -1).save }.to raise_error(Exceptions::EntityError)
      end
    end
  end

  describe '#to_h' do
    let(:returned_hash) do
      {
        name: 'test',
        price: 3,
        count: 2
      }
    end

    it 'returns hash' do
      expect(described_class.new('test', 3, 2).to_h).to eq(returned_hash)
    end
  end

  describe '.all' do
    let!(:product_a) { create_product('pepsi', 5, 2) }
    let!(:product_b) { create_product('chips', 5.25, 3) }

    it 'return array of products' do
      expect(described_class.all).to match_array([product_a, product_b])
    end
  end
end
