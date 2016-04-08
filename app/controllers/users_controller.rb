class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
  end

  def create
    @user = User.create(
      first_name: params[:input_form_first_name], 
      last_name: params[:input_form_last_name], 
      email: params[:input_form_email]
    )
    redirect_to "/users/#{@user.id}"
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(
      first_name: params[:input_form_first_name], 
      last_name: params[:input_form_last_name], 
      email: params[:input_form_email]
    )
    redirect_to "/users/#{@user.id}"
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to "/users"
  end
end
