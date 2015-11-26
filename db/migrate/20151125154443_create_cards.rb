class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.references :deck, null: false, index: true, foreign_key: true

      t.text :front
      t.text :back
      t.integer :position, null: false, default: 1

      t.timestamps null: false
    end

    add_column :decks, :cards_count, :integer, null: false, default: 0
  end
end
