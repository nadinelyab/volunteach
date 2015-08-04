class MessagesController < ApplicationController
	def index
		redirect_to user_path(current_user)
	end

	def show
		@message  = Message.find(params[:id])
		@new_message = Message.new

		@receiver = User.find(@message.receiver_id)
		@sender = User.find(@message.sender_id)
	end

	def new
		@message = Message.new
	end

	def create 
		@message = Message.new(message_params)
		@user = User.find_by(name: message_params[:receiver_id])
  		@message.receiver_id = @user.id
  		@message.sender_id = current_user.id
  		@message.save
		

		respond_to do |format|
	      if @message.save
		      format.html { redirect_to user_message_path(current_user, @message), notice: 'Message was successfully created.' }
		      format.js   {}
		      format.json { render json: @message, status: :created, location: @message }
	      else
	        format.html { render action: "new" }
	        format.json { render json: @message.errors, status: :unprocessable_entity }
	      end
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
		params.require(:message).permit(:sender_id, :receiver_id, :body, :title)
	end
end