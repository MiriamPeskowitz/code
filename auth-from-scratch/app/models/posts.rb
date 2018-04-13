class Post < ActiveRecord::Base
	belongs_to :user



end 

# ?validations - make sure my models have data 
# u = User.new
# u.errors.full_messages 

