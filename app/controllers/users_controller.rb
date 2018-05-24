class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show; end

  def edit; end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
      flash[:notice] = 'Fill in all fields before submitting!'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'User was successfully updated.'
    else
      render :edit
      flash[:notice] = 'Fill in all fields before submitting!'
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: 'Sad to see you go. Rejoin anytime!'
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
