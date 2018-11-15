class SessionsController < ApplicationController
  def new

  end

     def create
       @user = User.find_by(username: params[:username])

       if @user && @user.authenticate(params[:password])


         log_in_user(@user)
         redirect_to @user

       else
         flash[:errors] = ["Username or password didn't match"]
         redirect_to new_session_path
      end
     end

     def destroy
       log_out
       byebug
       redirect_to login_path
     end
    end





    # @user = User.find_by(username: params[:session][:username].downcase)
    # if @user && BCrypt::Password.new(@user.password_digest) ==
    #   params[:password]
    #     session[:user_id] = user.id
    #     redirect_to user_path
    #   else
    #     flash[:errors] = "Wrong password.Try again"
    #     redirect_to new_session_path
    # # return head(:forbidden) unless @user.authenticate(params[:password])

#   end
# end
#
#   def destroy
#     session.delete :username
#   end
