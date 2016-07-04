class UsersController < ApplicationController
  load_and_authorize_resource

  before_filter :set_params, only: [:show, :destroy, :update]
  before_filter :authenticate_user!

  def index
    @users=User.all
  end

  def show

  end

  def destroy
    @user.destroy

    redirect_to users_path
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, :success=> "User updated"
    else
      redirect_to users_path, :alert => "Unable to update user"
    end
  end

  private

  def set_params
    @user=User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:role)
  end
end
