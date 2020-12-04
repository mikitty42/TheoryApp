class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    redirect_to user_path(@user.id)
    if @user.save
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
