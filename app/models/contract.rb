class Contract < ActiveRecord::Base
  belongs_to :client, :class_name => "User", :foreign_key => "client_id"
  

  belongs_to :service
end
