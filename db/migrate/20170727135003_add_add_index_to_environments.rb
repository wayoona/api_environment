class AddAddIndexToEnvironments < ActiveRecord::Migration[5.0]
  def change
    add_index :environments, :name
  end
end
