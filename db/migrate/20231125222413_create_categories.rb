class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false, default: 'Unknown_category'
      t.string :icon
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
