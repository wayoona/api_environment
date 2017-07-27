class AddPmToEnvironments < ActiveRecord::Migration[5.0]
  def change
    add_column :environments , :pm , :string
  end
end
