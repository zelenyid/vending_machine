# frozen_string_literal: true

class Database
  include Singleton

  attr_reader :db

  def initialize
    database_name = AppEnvironment.test? ? 'db/test.db' : 'db/development.db'

    @db = SQLite3::Database.new database_name
  end
end
