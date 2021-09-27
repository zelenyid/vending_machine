# frozen_string_literal: true

class Money < ValidatableEntity
  attr_reader :denomination, :count

  def initialize(denomination, count)
    super()

    @denomination = denomination
    @count        = count
  end

  def to_h
    {
      denomination: denomination,
      count: count
    }
  end

  def self.all
    Hash[
      *Database.instance.db.execute(
        'SELECT denomination, count_denomination FROM vending_machine_money'
      ).collect { |value, key| [value, key] }.flatten
    ]
  end

  private

  def validate
    @errors << I18n.t('errors.empty_string') if empty_string?(denomination)
    @errors << I18n.t('errors.positive_integer') unless positive_integer?(count)
  end

  def save_to_db
    Database.instance.db.execute(
      'INSERT OR IGNORE INTO vending_machine_money (denomination, count_denomination) VALUES (?, ?)',
      [denomination, count]
    )
  end
end
