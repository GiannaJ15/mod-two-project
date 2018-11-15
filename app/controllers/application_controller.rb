class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  

  def log_in_user(user)
     session[:user_id] = user.id
   end

   def log_out
     session[:user_id] = nil
   end

   def logged_in_user_id
     session[:user_id]
   end

   def logged_in?
     !!logged_in_user_id
   end

   # def current_user
   #   User.find(logged_in_user_id)
   # end

   def current_user
   if session[:user_id]
     @current_user ||= User.find_by(id: session[:user_id])
   end
 end


   def authorized?(user_id)
     current_user && logged_in_user_id == user_id
   end




end
