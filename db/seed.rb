# frozen_string_literal: true

require_relative '../config/autoloader'

Product.new('coca cola', 15, 5).save
Product.new('sprite', 13, 4).save
Product.new('pepsi', 10, 2).save

Money.new('5', 5).save
Money.new('2', 5).save
Money.new('1', 5).save
Money.new('0.5', 5).save
Money.new('0.25', 5).save
