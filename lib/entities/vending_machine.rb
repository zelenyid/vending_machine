# frozen_string_literal: true

class VendingMachine
  attr_reader :products

  def initialize
    @products = Product.all
  end
end
