class UsersController < ApplicationController
	skip_before_action :verify_authenticity_token


  def index
      user = User.find_by(email: params[:user][:email])
  
     if user && user.authenticate(params[:user][:password])
     	render json: {responseCode: 200, responseMessage: "Users find successfully.",users: user.as_json(only: [:id,:name])}
     else
         render json: {errors: user.errors}, status: 422 
      end
  end

  def show
  	user = User.find(params[:id])
  	render json: user, status: 201
  end

  def create
    
     user = User.find_by(email: params[:user][:email])
  
     if user && user.authenticate(params[:user][:password])
     	render json: {responseCode: 200, responseMessage: "Users find successfully.",users: user.as_json(only: [:id,:name])}
     else
         render json: {errors: user.errors}, status: 422 
      end

  end
end
