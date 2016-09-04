module IncomeAndExpenseItemsHelper
	  def new_or_edit_income_and_expense_item_path(income_and_expense_item)
    income_and_expense_item ? edit_income_and_expense_item_path(income_and_expense_item) : new_income_and_expense_item_path(income_and_expense_item)
  end

end
