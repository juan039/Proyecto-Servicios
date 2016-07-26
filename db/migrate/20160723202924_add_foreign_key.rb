class AddForeignKey < ActiveRecord::Migration
  def change
  	add_foreign_key :contracts, :users, column: :client_id, primary_key: "id"
  	add_foreign_key :contracts, :users, column: :provider_id, primary_key: "id"
  end
end
