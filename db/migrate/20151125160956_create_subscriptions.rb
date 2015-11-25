class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :user, null: false, index: true, foreign_key: true
      t.references :deck, null: false, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_index :subscriptions, [:user_id, :deck_id], unique: true

    add_column :users, :subscribed_decks_count, :integer, null: false, default: 0
    add_column :decks, :subscribed_users_count, :integer, null: false, default: 0
  end
end
