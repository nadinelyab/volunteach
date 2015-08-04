class ProposalsController < ApplicationController
	before_action :authenticate_user!
	def index
		@query = params[:query]

		if @query
			@proposals = Proposal.advanced_search(@query)
		else
			@proposals = Proposal.all
		end
	end

	def show
		@proposal  = Proposal.find(params[:id])
		@message = Message.new
		@receiver = @proposal.user.name
	end

	def search
		@query = params[:query]
		@proposals = Proposal.advanced_search(@query)
	end

	def edit
		@proposal = Proposal.find(params[:id])

		if(current_user != @proposal.user)
			redirect_to proposal_path(@proposal), alert:"You can't edit this proposal."
		end
	end

	def link_form
		@proposal = Proposal.find(params[:id])
		@schools = School.all
	end

	def create_link
		@proposal = Proposal.find(params[:id])
		@school = School.find(params[:school_id])
		if !@proposal.schools.include?(@school)
			@proposal.schools << @school
		end

		redirect_to proposal_path(@proposal)
	end

	def update
		@proposal = Proposal.find(params[:id])

		if @proposal.update(proposal_params)
			redirect_to proposal_path(@proposal)
		else
			render :edit
		end
	end

	def new
		@proposal = Proposal.new

		if current_user.category == "school"
			redirect_to proposals_path, alert: "Sorry, you can't add a proposal because
			your user is of type school. However, you can add a class to your needs by 
			editing your school."
		end
	end

	def create 
		@proposal = current_user.proposals.build(proposal_params
			)

		if @proposal.save
			redirect_to proposal_path(@proposal)
		else
			render :new
		end
	end

	def destroy
		@proposal = Proposal.find(params[:id])

		if(current_user != @proposal.user)
			redirect_to proposal_path(@proposal), alert: "You can't delete this proposal."
		end
		
		@proposal.destroy

		redirect_to proposals_path
	end

	private 
	def proposal_params
		params.require(:proposal).permit(:description, :topic, :duration, :target_age, :language, :user_id)
	end
end