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
    # @picture = Picture.find(picture_params[:id])
    # byebug
    # @user = User.find(picture_params[:user_id])

  end

  private

  def picture_params
    params.require(:picture).permit(:img_url, :title, :user_id)
  end


end
