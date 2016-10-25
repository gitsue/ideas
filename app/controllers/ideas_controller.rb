class IdeasController < ApplicationController
	def index
		#Like.first.user.alias
		#Like.all
		@user = User.where(id: session[:curr_user]).first
		@ideas = Idea.top
		render "index"
	end

	def addidea
		if params[:content] !="Post something witty here..."
			Idea.create(content: params[:content], user_id: session[:curr_user])
			redirect_to "/bright_ideas/"
		else
			flash[:invalid] = "You did not submit an idea!"
			redirect_to "/bright_ideas/"
		end
	end

	def destroy
		@idea = Idea.where(id: params[:id]).first
		@idea.delete if @idea.user_id == session[:curr_user]
		redirect_to "/bright_ideas/"
	end
end
