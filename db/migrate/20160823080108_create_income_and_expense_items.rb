class CreateIncomeAndExpenseItems < ActiveRecord::Migration
  def change
    create_table :income_and_expense_items do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
