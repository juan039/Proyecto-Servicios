class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.integer :client_id
      t.references :service, index: true, foreign_key: true
      t.integer :provider_id
      t.date :date_request
      t.text :description
      t.timestamps null: false
    end
  end
end
