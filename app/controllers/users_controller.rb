class UsersController < ApplicationController
  def index
    @users = Unirest.get("http://localhost:3000/api/v1/users").body
  end

  def show
    @user = Unirest.get("http://localhost:3000/api/v1/users/#{params[:id]}").body
  end

  def new
  end

  def create
    @user = Unirest.post(
      "http://localhost:3000/api/v1/users",
      headers: { "Accept" => "application/json" },
      parameters: { 
        first_name: params[:input_form_first_name], 
        last_name: params[:input_form_last_name], 
        email: params[:input_form_email]
      }
    ).body
    redirect_to "/users/#{@user['id']}"
  end

  def edit
    @user = Unirest.get("http://localhost:3000/api/v1/users/#{params[:id]}").body
  end

  def update
    @user = Unirest.patch(
      "http://localhost:3000/api/v1/users/#{params[:id]}",
      headers: { "Accept" => "application/json" },
      parameters: { 
        first_name: params[:input_form_first_name], 
        last_name: params[:input_form_last_name], 
        email: params[:input_form_email]
      }
    ).body
    redirect_to "/users/#{params[:id]}"
  end
end
