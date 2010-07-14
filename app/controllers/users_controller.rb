class UsersController < ApplicationController
  before_filter :authenticate, :except => [:show, :new, :create] #Only authenticated users can see these actions
  before_filter :correct_user, :only => [:edit, :update]					#Only the logged in user can see these actions
  before_filter :admin_user,   :only => :destroy							#Only the administrator can see/use this action

  def new
    @user = User.new
    @title = "Sign up"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
	  #UserMailer.deliver_welcome_email(@user)             #Breaks
	  sign_in @user
	  flash[:success] = "Successfully registered! Welcome to Scribelix!"
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
	@microposts = @user.microposts.paginate(:page => params[:page])
    @title = CGI.escapeHTML(@user.name)
  end
  
  def index
    @title = "All users"
	@users = User.paginate(:page => params[:page])
  end
  
  def edit
    @title = "Edit user"
  end
  
  def update
    if @user.update_attributes(params[:user])
	  #@user.save
	  flash[:success] = "Profile updated."
	  redirect_to @user
	else
	  @title = "Edit user"
	  render 'edit'
	end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end
  
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(:page => params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(:page => params[:page])
    render 'show_follow'
  end
  
  private
  
	
	def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
	
	def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
  
end
