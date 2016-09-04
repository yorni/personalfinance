json.extract! transaction, :id, :sum, :transactiontype, :cash_box_id, :income_and_expense_item_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)