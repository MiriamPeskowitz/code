# README
Author(name) has many books(title, author_id)
Book(title) belongs to author(name)

Book(title, author_id) has many categories(title)
Categories(title) has many books(title, author_id) 

