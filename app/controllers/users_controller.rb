class UsersController < ApplicationController
  before_filter :set_params, only: [:show, :destroy]
  def index
    @users=User.all
  end

  def show

  end

  def destroy
    @user.destroy

    redirect_to root_path
  end

  private

  def set_params
    @user=User.find(params[:id])
  end
end
