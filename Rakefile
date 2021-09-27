# frozen_string_literal: true

require 'sqlite3'

namespace :db do # rubocop:disable Metrics/BlockLength
  desc 'Create datebase'
  task :create do
    db = SQLite3::Database.new 'db/development.db'
    db_test = SQLite3::Database.new 'db/test.db'

    db.execute <<-SQL
      create table if not exists products (
        product_name text not null unique,
        price integer,
        count_product integer not null default 0
      );
    SQL

    db.execute <<-SQL
      create table if not exists vending_machine_money (
        denomination text not null unique,
        count_denomination integer not null default 0
      )
    SQL

    db_test.execute <<-SQL
      create table if not exists products (
        product_name text not null unique,
        price integer,
        count_product integer not null default 0
      );
    SQL

    db_test.execute <<-SQL
      create table if not exists vending_machine_money (
        denomination text not null unique,
        count_denomination integer not null default 0
      )
    SQL
  end
end
