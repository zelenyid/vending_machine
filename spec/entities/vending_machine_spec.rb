# frozen_string_literal: true

RSpec.describe VendingMachine do
  subject(:vending_machine) { described_class.new }

  describe '#products' do
    context 'when we have products' do
      let!(:product_a) { create_product('pepsi', 5, 2) }
      let!(:product_b) { create_product('chips', 5.25, 3) }

      it 'return array of products' do
        expect(vending_machine.products).to match_array([product_a, product_b])
      end
    end

    context 'when we dont have products' do
      it 'return array of products' do
        expect(vending_machine.products).to match_array([])
      end
    end
  end
end
