class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit,:update,:destroy]
  before_action :correct_user, only: [:edit,:update]
  before_action :admin_user, only: [:destroy]
  before_action :exist_user?, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'TheroyAppへようこそ'
      @user.create_cart
      redirect_to @user
    else
      flash[:notice] = 'ユーザー登録に失敗しました'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'Profileを更新しました'
      redirect_to @user
    else
      flash[:nnotice] = 'Profileを更新できませんでした'
      render :edit
    end
  end

  def destroy
    User.find(params[:id]).destroy!
    flash[:success] = "ユーザーを削除しました"
    redirect_to users_url
  end



  private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:notice] = 'ログインしてください'
      redirect_to sessions/new
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  def exist_user?
    unless User.find_by(id: params[:id])
      flash[:notice] = "ユーザーが存在しません"
      redirect_to users_path
    end
  end
end
