json.extract! income_and_expense_item, :id, :title, :created_at, :updated_at
json.url income_and_expense_item_url(income_and_expense_item, format: :json)