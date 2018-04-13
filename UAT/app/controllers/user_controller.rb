class UserController < ApplicationController
  def index
  	@users = User.all

  end

  def new
  	@user = User.new # stub this out so I can use form_for. giving my form an AR instance to wrap around. 
  end

  def create
  	# raise params.inspect
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to @user # users/@users.id
  	else
  		render :new
  end 

  def show
  end

  private
  def user_params
  	params.require(:user).permit(:email)
  end 
end
