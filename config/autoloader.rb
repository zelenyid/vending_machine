# frozen_string_literal: true

require 'i18n'
require 'byebug'
require 'sqlite3'
require 'singleton'
require 'terminal-table'

ENV['APP_ENVIRONMENT'] ||= 'development'

require_relative '../lib/modules/exceptions'
require_relative '../lib/modules/validator'
require_relative 'app_environment'
require_relative '../db/database'
require_relative '../lib/states/welcome_state'
require_relative '../lib/states/select_product_state'
require_relative '../lib/states/payment_state'
require_relative '../lib/states/finish_state'
require_relative '../lib/entities/validatable_entity'
require_relative '../lib/entities/money'
require_relative '../lib/entities/product'
require_relative '../lib/entities/vending_machine'

I18n.load_path << Dir["#{File.expand_path('config/locales')}/*.yml"]
