class CreateTrades < ActiveRecord::Migration[7.1]
  def change
    create_table :trades do |t|
      t.string :name
      t.integer :amount

      t.timestamps
    end
  end
end
