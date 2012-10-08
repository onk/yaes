class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :container_user_id, null: false
      t.string :nickname, null: false

      t.datetime :deleted_at
      t.timestamps
    end
    add_index :users, :container_user_id, unique: true
  end
end
