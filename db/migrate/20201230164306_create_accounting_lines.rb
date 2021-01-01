class CreateAccountingLines < ActiveRecord::Migration[6.1]
  def change
    create_table :accounting_lines do |t|
      t.integer :account_number
      t.string :description
      t.bigint :debit
      t.bigint :credit
      t.references :aggregate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
