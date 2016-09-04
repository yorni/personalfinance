class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :sum
      t.string :transactiontype
      t.belongs_to :cash_box, index: true, foreign_key: true
      t.belongs_to :income_and_expense_item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
