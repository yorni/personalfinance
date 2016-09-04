class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :cash_boxes
  has_many :transactions
  has_many :income_and_expense_items
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
