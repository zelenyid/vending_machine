# frozen_string_literal: true

class PaymentState
  include Singleton

  attr_reader :product

  class << self
    def call(product)
      new(product).call
    end
  end

  def initialize(product)
    @product         = product
    @coins_paid      = Money.all.transform_values { |_| 0 }
    @coins_to_return = Money.all.transform_values { |_| 0 }
  end

  def call
    take_coins
    give_product
    return_money

    FinishState.call
  end

  private

  def take_coins
    while amount_of(@coins_paid) < product[:price]
      print I18n.t(:waiting_a_coin)
      coin = gets.chomp

      update_coins_paid(coin)
      payment_info
    end

    update_coins(@coins_paid)
  end

  def update_coins_paid(coin)
    if @coins_paid.keys.include?(coin)
      @coins_paid[coin] += 1
    else
      coin_error_message
    end
  end

  def payment_info
    amount_paid = amount_of(@coins_paid)
    puts I18n.t(:payment_info_msg, paid_coins: amount_paid, remaining_amount: (product[:price] - amount_paid))
  end

  def update_coins(coins_stack, return_coins: false)
    old_denomination_count = Money.all

    coins_stack.each do |key, value|
      new_coins = return_coins ? old_denomination_count[key] - value : old_denomination_count[key] + value
      Database.instance.db.execute('UPDATE vending_machine_money SET count_denomination=? WHERE denomination = ?',
                                   new_coins, key)
    end
  end

  def give_product
    Database.instance.db.execute('UPDATE products SET count_product=? WHERE product_name = ?', product[:count] - 1,
                                 product[:name])
  end

  def return_money
    old_denomination = Money.all
    need_to_return = amount_of(@coins_paid) - product[:price]

    @coins_to_return.each do |k, _|
      coins_and_count_of_coins = need_to_return.divmod(k.to_f)

      avalible = old_denomination[k]
      @coins_to_return[k], need_to_return = coins_and_count_of_coins if avalible > coins_and_count_of_coins.first
    end

    return_info_failed if need_to_return != 0
    return_info
    update_coins(@coins_to_return, return_coins: true)
  end

  def return_info_failed
    puts I18n.t(:return_info_failed_msg)
  end

  def return_info
    puts I18n.t(:return_info)
    puts @coins_to_return.select { |_, v| v.positive? }.map { |k, v| "#{v}x#{to_usd_format(k.to_f)}" }.join(' ')
  end

  def amount_of(coins_stack)
    coins_stack.keys.map { |key| key.to_f * coins_stack[key] }.sum
  end

  def coin_error_message
    puts I18n.t(:coin_error_msg)
  end

  def to_usd_format(value)
    value < 1 ? "#{(value * 100).to_i}c" : "#{value.to_i}$"
  end
end
