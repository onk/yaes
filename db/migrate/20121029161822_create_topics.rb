class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :category, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.datetime :published_at, null: false
      t.boolean :published, null: false, default: false

      t.datetime :deleted_at
      t.timestamps
    end
    add_index :topics, :published_at
  end
end
