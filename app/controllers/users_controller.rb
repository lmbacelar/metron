class UsersController < ApplicationController

  respond_to :html

  skip_before_action :require_login, only: [:index, :new, :create]

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    respond_with @users
  end

  def show
  end

  def new
    @user ||= User.new
  end

  def edit
    respond_with @user
  end

  def create
    @user = User.new(user_params)
    if @user.save_and_retry_on_unique && login(user_params[:email], user_params[:password])
      flash[:notice] = 'User was successfully created and logged in'
    end
    respond_with @user, location: root_url
  end

  def update
    flash[:notice] = 'User was successfully updated' if @user.update_attributes(user_params)
    respond_with @user
  end

  def destroy
    @user.destroy
    flash[:notice] = 'User was successfully destroyed' 
    respond_with @user, location: root_url
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
