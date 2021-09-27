# frozen_string_literal: true

class Product < ValidatableEntity
  attr_reader :name, :price, :count

  def initialize(name, price, count)
    super()

    @name  = name
    @price = price
    @count = count
  end

  def to_h
    {
      name: name,
      price: price,
      count: count
    }
  end

  def self.all
    Database.instance.db.execute('SELECT * FROM products;').map { |params| new(*params).to_h }
  end

  private

  def validate
    @errors << I18n.t('errors.empty_string') if empty_string?(name)
    @errors << I18n.t('errors.positive_number') unless positive_number?(price)
    @errors << I18n.t('errors.positive_integer') unless positive_integer?(count)
  end

  def save_to_db
    Database.instance.db.execute('INSERT OR IGNORE INTO products (product_name, price, count_product) VALUES (?, ?, ?)',
                                 [name, price, count])
  end
end
