class Transaction < ActiveRecord::Base
  belongs_to :cash_box
  belongs_to :user
  belongs_to :income_and_expense_item
end
