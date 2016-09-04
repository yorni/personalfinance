class AddUserIdToIncomeAndExpenseItems < ActiveRecord::Migration
  def change
    add_column :income_and_expense_items, :user_id, :integer
    add_index :income_and_expense_items, :user_id
  end
end
