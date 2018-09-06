class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]
  
  # GET /users -- what do we want to show first?
  def index
    @users = User.all
  end

  # GET /users/:id -- this method already knows what to do because of the set_user method
  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      # redirect_to user_path(@user.id)
      # redirect_to user_path(@user)
      redirect_to @user
    else

      #goes back to the "new" page to show what errors occured
      render :new
    end
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    redirect_to users_path
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name)
    end
end