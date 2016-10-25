class SessionsController < ApplicationController
  def index
  	render "index"
  end

  def register
  	@user = User.new(user_params)
  	if @user.save
  		session[:curr_user] = @user.id
  		redirect_to "/bright_ideas/"
  	else
  		flash[:register_errors] = @user.errors.full_messages
  		redirect_to "/main/"
  	end
  end

  def login
  	@user = User.where(email: params[:email]).first
  	if @user && @user.authenticate(params[:password])
  		session[:curr_user] = @user.id
  		redirect_to "/bright_ideas/"
  	else
  		flash[:login_errors] = "Invalid Email/Password!"
  		redirect_to "/main/"
  	end
  end 

  def logout
  	reset_session
  	redirect_to "/main/"
  end

  private
  def user_params
  	params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
  end
end
