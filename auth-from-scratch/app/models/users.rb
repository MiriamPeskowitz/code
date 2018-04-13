class User < ActiveRecord::Base
	has_secure_password

	has_many :posts 
end 

# check in console -- 
# u = User.last
# u.posts 
# u.posts.to_sql
# u.posts.build(:title => "Made for mir@gmail.com")
