class MessagesController < ApplicationController
	def show
		@message  = Message.find(params[:id])
		@new_message = Message.new
	end

	def new
		@new_message = Message.new
	end

	def create 
		@message = Message.new(message_params)

		@message.sender_id = current_user

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

	private
	def message_params
		params.require(:message).permit(:sender_id, :receiver_id, :body, :text)
	end
end