class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 	has_many :scores
	has_many :services, :through => :scores


  after_create :set_role

  def set_role
  	current_user.add_role :contratista
  end
end
