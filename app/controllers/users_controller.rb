class UsersController < ApplicationController


  def new
    @user = User.new(user_params)
  end

  def create
    @user = User.create(user_params)
  if @user.save
    sessions[:user_id] = @user.id
    redirect_to user_path
  else
    flash[:errors] = @user.errors.full_messages
    redirect_to new_user_path
    end
  end


  def show
    @user = User.find(params[:id])
    @pictures = @user.pictures
    @tags = Tag.all
  end

  def edit
    @user = User.find(params[:id])

  end



  def update
    @user = User.find(params[:id])
    @user.update(user_params)
      redirect_to @user
  end

private

  def user_params
    params.require(:user).permit(:username, :password,
    pictures_attributes: [
      :img_url,
      :title,
      :user_id
    ]
    )
  end

end
