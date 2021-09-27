# frozen_string_literal: true

module CreatorHelper
  def create_product(name, price, count)
    product = Product.new(name, price, count)
    product.save

    product.to_h
  end

  def create_money(denomination, count)
    money = Money.new(denomination, count)
    money.save

    money.to_h
  end
end
