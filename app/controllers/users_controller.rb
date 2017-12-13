class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(user_params)

    if @user.save
      flash[:notice] = "Your changes have been saved."
      redirect_to @user
    else
      flash.now[:alert] = "There was an error saving your changes. Please try again."
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:bio, :role)
    end
end
