class AddNameToJournalists < ActiveRecord::Migration[6.1]
  def change
    add_column :journalists, :first_name, :string
    add_column :journalists, :last_name, :string
  end
end
