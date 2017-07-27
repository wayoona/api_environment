class CreateEnvironments < ActiveRecord::Migration[5.0]
  def change
    create_table :environments do |t|
      t.string :juhe_id
      t.string :name
      t.string :pinyin

      t.timestamps
    end
    add_index :environments, :juhe_id
  end
end
