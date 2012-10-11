class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name
      t.references :job
      t.integer :strength
      t.integer :dexterity
      t.integer :magic
      t.integer :agility
      t.integer :vitality

      t.datetime :deleted_at
      t.timestamps
    end
    add_index :cards, :job_id
  end
end
