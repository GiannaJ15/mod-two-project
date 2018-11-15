class UsersController < ApplicationController
# before_action :logged_in_user, only: [:index, :show]
 # before_action :correct_user,   only: [:show, :index]
  #
  def index
    # @user_id = logged_in_user_id
    @users = User.all
  
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @pictures = @user.pictures
    @tags = Tag.all
  end



  def create
    @user = User.new(user_params)
      # params[:email, :username, :password_digest])
  if @user.save
    # sessions[:user_id] = @user.id
    redirect_to user_path(@user)
  else
    flash[:errors] = @user.errors.full_messages
    redirect_to new_user_path
  end
  end




  #
  # def edit
  #   @user = User.find(params[:id])
  #
  # end
  #
  #
  #
  # def update
  #   @user = User.find(params[:id])
  #   @user.update(user_params)
  #     redirect_to @user
  # end



private

  def user_params
    params.require(:user).permit(:email, :username, :password)
  end



  def logged_in_user
       unless logged_in?
         store_location
         flash[:danger] = "Please log in."
         redirect_to login_url
       end
     end

  #   def correct_user
  #   @user = User.find(params[:id])
  #   redirect_to(user_path) unless current_user?(@user)
  # end


end
