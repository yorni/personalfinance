class ChangeColumn < ActiveRecord::Migration
def up
    change_column :transactions, :sum, :float
  end

  def down
    change_column :transactions, :sum, :integer
  end
end
