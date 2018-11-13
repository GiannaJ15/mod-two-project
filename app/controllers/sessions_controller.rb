class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && BCrypt::Password.new(@user.password_digest) ==
      params[:password]
        session[:user_id] = user.id
        redirect_to user_path
      else
        flash[:errors] = "Wrong password.Try again"
        redirect_to new_session_path
    # return head(:forbidden) unless @user.authenticate(params[:password])

  end
end

  def destroy
    session.delete :username
  end

end
