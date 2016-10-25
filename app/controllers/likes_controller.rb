class LikesController < ApplicationController
	def index
		#User.second.likes.count
		@poster = Idea.where(id: params[:id]).first
		@users_liked = Idea.where(id: params[:id]).first.likes
		render "index"
	end

	def addlike
		@user = User.where(id: session[:curr_user]).first
		@idea = Idea.where(id: params[:id]).first
		Like.create(user_id: @user.id, idea_id: @idea.id)
		redirect_to "/bright_ideas/"
	end
end
