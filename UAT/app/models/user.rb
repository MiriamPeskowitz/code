class User < ActiveRecord::Base
	has_many :addresses
	belongs_to :team 
end
