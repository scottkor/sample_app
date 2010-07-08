class UsersController < ApplicationController

  def new
    @user = User.new
    @title = "Sign up"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
	  #UserMailer.deliver_registration_confirmation(@user)
	  sign_in @user
	  flash[:success] = "Successfully registered! Welcome to the Scribelix!"
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
	@title = @user.name
  end
end