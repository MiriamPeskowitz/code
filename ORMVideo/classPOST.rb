# Now that this is written, what' the problem with it? 
# 1. proportionality -- say I want to add a new column to post -- author name. there should be a symmetry between concept and implemtnation -- ie, I add one column, I should be able to make one change. In this code. I'd need to make tons of changes. 
#2. If I wanted to give author class all my Post functionality, I could copy, but then I'd have to change many things. The logic isn't transferable. The implementation is too literal. I taught posts about how databases work but in doing so, i built a hard-to0change model that's not expandale. 
# my post model needs to know its attributes. Introspection. Patterns. Now -- it works because it sees the : symbol. Give the attrs and introspection point, a first principle, something it can look at and get what it needs. . class is a good introspection point -- MAKE ONE -- a hash that contains my schema. PUT THE SCHEMA IN As attributes, then everything can flow from this. 
# metaprogramming -- center is introspection -- 

WHEN DONE -- copy this and make it into a module and see if the abstraction is right -- 
class Post < ActiveRecord::Base
	ATTRIBUTES = {
		:id => "INTEGER PRIMARY KEY",
		:title => "TEXT",
		:content => "TEXT",
		:author_name => "TEXT"
	}
	include Persistable::InstanceMethods
	extend Persistable::ClassMethods
end 

#make this -- find every literal reference to these ideas, and replace them with a reference to these attributes 


# 	# replace this with: attr_accessor :id, :title, :content
# 	ATTRIBUTES.keys.each do |key|
# 		attr_accessor key

# 	def destroy
# 		sql = <<-SQL
# 			DELETE FROM #{self.class.table_name} WHERE id = ?
# 		SQL

# 		DB[:conn].execute(sql, self.id)

# 	end 	

# 	def self.table_name 
# 		# "#{Post.to_d.downcase}s" what abstraction -- self 
# 		{self.to_d.downcase}s
# 	end 

# #abstraction -- a measurement of detail something made less detail.  opposite is reified -- many details and made more literal. Move away from hardcoding interpolate. 

# #when? Whenever you're repeating something a lot. 
	
# 	def self.find(id)
# 		sql = <<-SQL
# 			SELECT * FROM  #{self.table_name}
# 		SQL

# 		rows = DB:[:conn].execute(sql, id)
# 		self.reify_from_row(row.first) #reify = make real. return an instance of the post from a row, always a nested array 
# 	end

# 	def self.reify_from_row(row))
# 		self.new.tap do |p|
# 			ATTRIBUTES.keys.each_with_index do |attribute_name, i|
# 				p.send("#{attribute_name}=", row[i])
# 			p.id = row[0]
# 			p.title = row[1]
# 			p.content = row[3]
# 		end
# 	end


# 	def ==( other_post)
# 		self.id == other_post.id
# 	end 
# 	# end  grab the row, iterate it, pass data into attributes of the instance


# 	def self.create_table
# 		sql  <<- SQL #this was post, trying to introspect it is 
# 			# CREATE TABLE IF NOT EXISTS #{self.table_name} (
# 			# 	id INTEGER PRIMARY KEY,
# 			# 	title TEXT,
# 			# 	content TEXT
# 			# 	)
# 			# SQL

# 			CREATE TABLE IF NOT EXISTS #{self.table_name} (
# 				self.create_sql

# 			DB[:conn].execute(sql)

# 	end 

# 	def self.create_sql
# 	#We want to create these four rows, but abstractly: 
# 		# :id => "INTEGER PRIMARY KEY",
# 		# :title => "TEXT",
# 		# :content => "TEXT",
# 		# :author_name => "TEXT"

# 		ATTRIBUTES.collect {|attribute_name, schema|
# 			"#{attribute_name} #{schema}"}.join(",")

# 	end 
# 		# # goal: copy it into author class and not have to copy it. build a big portion of active record 
# 		# --Goal: everytime I see "post" I can substitute self.table_name -- that's the metaprogramming abstraction. 

# def save 
# 	# if post has been saved before, call save, otherwise call insert 
# 	persisted? update : insert
# end 

# def persisted?
# 	!!self.id # why the double bang? Don't return a number when you can return a boolean?! self.id = 1, !self.id = false, !!self.id = true Cool pattern. 
# end 

# def self.attribute_names_for_insert 
# 		 # every key in attribute hash except for id 
# 		 ATTRIBUTES.keys[1..-1].join(",")
# end 

# def self.question_marks_for_inserts
# 	ATTRIBUTES.keys.size-1.times.collect{"?"}.join(",") #keys.size -1 because we dont' want the id  
# 	#

# end 

# def attribute_values 
# 	#goal: Post title, post content, post author 
# 	ATTRIBUTES.keys[1..-1].collect{|attribute_name| self.send(attribute_name)}
# end 
# # send -- sends a message to an object instance -- send means self.title, self. author, etc. 

# def self.sql_for_update
# 	ATTRIBUTES.keys[1..-1].collect{|attribute_name| "#{attribute_name}=?".join(",")}
# end 

# private
# 	def insert #but this isnt' saving, it's actually just insertng, so change name. 
# 		sql = <<-SQL
# 			# INSERT INTO #{self.class.table_name} (title, content) VALUES (?,?) #create abstracction for these question marks -- change them to self.class.question_marks_for_insert
# 	INSERT INTO #{self.class.table_name} (title, content) VALUES (#{self.,?)

# 		SQL

# 		# replace: DB[:conn].execute(sql, self.title, self.content)
# 		DB[:conn].execute(sql, *attribute_values)
# 	end 
# 	# teach what the tablename for the class is 
# 	#splatting an array 

# #teach a post how to update itself "
# 	def update
# 		sql = <<- SQL
# 			UPDATE posts SET title = ?, content = ?
# 			WHERE id = ?
# 			SQL

# 			DB[:conn].execute(sql, self.title, self.content, self.id)
# 		end 
# #This stuff is impossible for beginners to program by themselves. 
# #It's about seeing the patterns 

# end 
