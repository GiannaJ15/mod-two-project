class CommentsController < ApplicationController

def new
  @comment = Comment.new
end

#
# def show
#   @pictures = Picture.all
# end

# def show
#   @user = User.find(params[:id])
#   @comment = @picture.commment
# end

def create
  @comment = Comment.create(comment_params)
  @picture = Picture.find(comment_params[:picture_id])
  @user = User.find(comment_params[:user_id])
  redirect_to picture_path(@picture)
end


private

def  comment_params
  params.require(:comment).permit(:content, :user_id, :picture_id)
end

end
