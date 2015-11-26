class CreateRepetitions < ActiveRecord::Migration
  def change
    create_table :repetitions do |t|
      t.references :user, null: false, index: true, foreign_key: true
      t.references :card, null: false, index: true, foreign_key: true

      t.datetime :due
      t.float :easiness_factor
      t.integer :interval
      t.integer :iteration
      t.boolean :repeat, null: false, default: false
      t.integer :answers_count, null: false, default: 0

      t.timestamps null: false
    end

    add_index :repetitions, [:user_id, :card_id], unique: true

    add_column :users, :remembered_cards_count, :integer, null: false, default: 0
    add_column :cards, :remembered_by_count, :integer, null: false, default: 0
  end
end
