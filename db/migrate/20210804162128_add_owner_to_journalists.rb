class AddOwnerToJournalists < ActiveRecord::Migration[6.1]
  def change
    add_column :journalists, :owner, :boolean, default: false, null: false
  end
end
