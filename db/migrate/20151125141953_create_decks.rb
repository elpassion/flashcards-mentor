class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.integer :author_id, null: false, index: true

      t.string :name
      t.text :description

      t.timestamps null: false
    end

    add_foreign_key :decks, :users, column: :author_id

    add_column :users, :authored_decks_count, :integer, null: false, default: 0
  end
end
