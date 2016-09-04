class CashBox < ActiveRecord::Base
	has_many :transactions
	belongs_to :user
  def self.search(term)
    where('LOWER(title) LIKE :term', term: "%#{term.downcase}%")
  end
  
end
