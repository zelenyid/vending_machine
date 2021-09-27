# frozen_string_literal: true

class SelectProductState
  include Singleton

  class << self
    def call
      new.call
    end
  end

  def call
    @products = VendingMachine.new.products

    product_list_message
    PaymentState.call(choice_product)
  end

  private

  def product_list_message
    print I18n.t(:choice_msg)
    table = Terminal::Table.new headings: ['Product Name', 'Price', 'Count'], rows: @products.map(&:values)
    puts table
  end

  def choice_product
    print I18n.t(:your_choice_msg)
    product_name = gets.chomp.downcase

    product = find_product(product_name)
    if product && (product[:count]).positive?
      product
    elsif product_name == 'exit'
      FinishState.call
    else
      repeat_choice
    end
  end

  def repeat_choice
    puts I18n.t(:not_found_product_msg)
    call
  end

  def product_titles
    @products.map { |product| product.values.first }
  end

  def find_product(product_name)
    @products.each do |product|
      return product if product[:name] == product_name
    end

    nil
  end
end
