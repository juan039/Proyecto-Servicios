class AddColumnToScore < ActiveRecord::Migration
  def change
    add_reference :scores, :user, index: true 
    add_reference :scores, :service, index: true
    add_column :scores, :rankingUsers, :decimal
  end
end
