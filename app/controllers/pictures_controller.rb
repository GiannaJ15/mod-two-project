class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new(picture_params)
    @user = User.find(picture_params[:user_id])

    @tags = Tag.all
  end

  def create
    @picture = Picture.create(picture_params)
    @user = User.find(picture_params[:user_id])
    redirect_to user_path(@user)
  end

  def show
    @picture = Picture.find(params[:id])
    @user = User.find(@picture.user_id)
    @comment = Comment.new()
  end

  def destroy
    @picture = Picture.find(params[:id])
  
    if authorized?(@picture.user_id)
        @picture.destroy
      else
        current_user
      end
  end

  private

  def picture_params
    params.require(:picture).permit(:img_url, :title, :user_id)
  end

  # def  comment_params
  #   params.require(:comment).permit(:content, :user_id, :picture_id)
  # end


end
