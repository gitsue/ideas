class UsersController < ApplicationController
	def show
		#User.second.ideas.count
		#User.first.likes.count
		@user = User.where(id: params[:id]).first
	end
end
