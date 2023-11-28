class CreateCategoryTrades < ActiveRecord::Migration[7.0]
  def change
    create_table :category_trades do |t|
      t.references :category, null: false, foreign_key: true
      t.references :trade, null: false, foreign_key: true

      t.timestamps
    end
  end
end