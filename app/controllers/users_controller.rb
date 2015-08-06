class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@proposals = Proposal.where(user: @user)
		@schools = School.where(user: @user)
		@messages_received = Message.where(receiver_id: @user)
		@messages_sent = Message.where(sender_id: @user)
	end

	private 
	def user_params
		params.require(:user).permit(:username, :email, :password, :name, :location, :password_confirmation, :photo)
	end
end