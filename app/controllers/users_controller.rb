class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@proposals = Proposal.where(user: @user)
	end
end