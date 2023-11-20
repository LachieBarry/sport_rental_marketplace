class UsersController < ApplicationController
  def new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      # Handle a successful save.
      redirect_to root_path
    else
      render 'new'
    end
  end
  def show
    @user = User.find(params[:id])
  end
  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :phone_number, :email, :password)
    end
end
