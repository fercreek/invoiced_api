module V1
  class UserController < ApplicationController
    def create
      @user = User.new(user_params)

      if @user.save
        render :create
      else
        head(:unprocessable_entity)
      end
    end

    private
    
    def user_params
      params.require(:user).require(:email, :password, :password_confirmation)
    end
    
  end
end