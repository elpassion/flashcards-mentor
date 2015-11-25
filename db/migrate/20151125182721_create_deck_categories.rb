class CreateDeckCategories < ActiveRecord::Migration
  def change
    create_table :deck_categories do |t|
      t.references :deck, null: false, index: true, foreign_key: true
      t.references :category, null: false, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_index :deck_categories, [:deck_id, :category_id], unique: true

    add_column :decks, :categories_count, :integer, null: false, default: 0
    add_column :categories, :decks_count, :integer, null: false, default: 0
  end
end
