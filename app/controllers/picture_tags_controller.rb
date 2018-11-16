class PictureTagsController < ApplicationController

  def new
    @picture_tag = PictureTag.new
  end

  def create
    @picture_tag = PictureTag.create(picture_tag_params)
      redirect_to @picture_tag.picture
  end


  private

  def picture_tag_params
    params.require(:picture_tag).permit(:picture_id, :tag_id)
  end
end
