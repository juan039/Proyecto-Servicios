class AddColumnToContract < ActiveRecord::Migration
  def change
    add_column :contracts, :score, :integer
    add_column :contracts, :finished_contract, :boolean, default: false
  end
end
