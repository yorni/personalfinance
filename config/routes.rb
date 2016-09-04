Rails.application.routes.draw do
  devise_for :users
  resources :cash_boxes, :income_and_expense_items
  resources :transactions do
  	collection do
  		get 'reports'
  	end
  end
  root 'transactions#index'
end