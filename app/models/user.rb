class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #
  #attr_accessor :email, :password, :password_confirmation, :remember_me, :first_name

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 	has_many :scores
	has_many :services, :through => :scores
	#has_many :requested_contracts,    :class_name => 'Contract', :foreign_key =>'client_id'
	has_many :contracts


	# def contracts
 #    	Contract.where("client_id = ? OR provider_id = ?", self.id, self.id)
 #  	end
 #  	has_many :client_contracts,    class_name: 'Contract', foreign_key: 'client_id'
 #  	has_many :provider_contracts, class_name: 'Contract', foreign_key: 'provider_id'
end
