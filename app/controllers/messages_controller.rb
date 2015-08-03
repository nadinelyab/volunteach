class MessagesController < ApplicationController
	def show
		@message  = Message.find(params[:id])
	end

	def new
		@message = Message.new
	end

	def create 
		@message = current_user.messages.build(message_params
			)

		if @message.save
			redirect_to user_message_path(@message)
		else
			render :new
		end
	end

	def destroy
		@message = Message.find(params[:id])

		if(current_user != @message.receiver_id)
			redirect_to user_message_path(@message), alert: "You can't delete this message."
		end
		
		@message.destroy

		redirect_to user_messages_path
	end
end