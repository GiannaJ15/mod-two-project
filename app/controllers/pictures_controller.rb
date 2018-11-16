class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new(picture_params)
    @user = User.find(picture_params[:user_id])

  end

  def create

    @picture = Picture.create(picture_params)
    redirect_to @picture

  end

  def show
    @tags = Tag.all
    @tag = Tag.new
    @picture_tag = PictureTag.new
    @picture = Picture.find(params[:id])
    @user = User.find(@picture.user.id)
    @loggeduser = User.find(logged_in_user_id)
    @comment = Comment.new()


  end

  def destroy
    @picture = Picture.find(params[:id])

    if authorized?(@picture.user_id)
        @picture.destroy
        redirect_to @picture.user
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
