class CreateCashBoxes < ActiveRecord::Migration
  def change
    create_table :cash_boxes do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
