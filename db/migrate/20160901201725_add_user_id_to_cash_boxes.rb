class AddUserIdToCashBoxes < ActiveRecord::Migration
  def change
    add_column :cash_boxes, :user_id, :integer
    add_index :cash_boxes, :user_id
  end
end
