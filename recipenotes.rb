
# From Luisa study group. it seems like this stuff should be easy, simple, replicable, but it isn't. 

class RecipesController << ApplicationController 

	def new
		@recipe - Recipe.new
		10.times { @recipe.ingredients.build }
	end
	# n = number of ingredients
# or n.times   OR: start with 5, and the button to add ingredients. plain ruby, hard to do, but you would do it with jscript 

	def create 
		@recipe = Recipe.create(recipe_params)
		redirect_to(@recipe)
	end

	def show 
		@recipe = Recipe.find(params[:recipe_id])
	private
	def recipe_params
		params.require(:recipe).permit(:name, :ingredients_attributes => [:name, :recipe_ingredients => [:quantity)
	end 
end 

class Recipe << ApplicationRecord
has_many :recipe_ingredients
has_many :ingredients, through: :recipe_ingredients

def ingredients_attributes=(ingredients_attributes)
	ingredients_attributes.values.each do |ingredients_attribute|
		if !ingredient_attribute["name"].empty?
			# raise ingredients_attribute["name"].inspect
			ingredient = Ingredient.find_or_create_by(name: ingredients_attribute["name"])
			# raise ingredients_attribute["recipe_ingredients"]["quantity"].inspect
			self.recipe_ingredients.build(recipe: self, ingredient: ingredient, quantity: ingredients_attribute ["recipe_ingredients"]["quantity"] )
			# raise recipe.recipe_ingredients
		end 
	end
end 

def self.most_recently_updated
	order("updated_at desc").first
end 
# build, because recipe hasn't yet been persisted. 
# Luisa 
# raise inspect -- so you can see what's coming up, solve problems early on. Also know 

It will show in the show page 
 @recipe.name 
  @recipe.recipe_ingredients.each do |recipe_ingredient| 
  	recipe_ingredient.ingredient.name
  	recipe_ingredient.quantity


Really know the schema and the relationships 
Visual Studio Code -- she loves it 

Why thejoin tables? because quantity is not an attributes of a singl object -- it's part of the relationship between two objects 
join tables 
stores => name: "whatever"
how many of a tshirt does th store have: in a join table -store_shirt => store:  "whatever", shirt: "shirt_id" quantity: 20
tshirts => color: "blue", brand: "Nike"

