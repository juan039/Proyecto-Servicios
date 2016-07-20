class CreateUserServiceProviders < ActiveRecord::Migration
  def change
    create_table :user_service_providers do |t|

      t.timestamps null: false
    end
  end
end
