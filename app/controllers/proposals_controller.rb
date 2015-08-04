class ProposalsController < ApplicationController
	before_action :authenticate_user!
	def index
		@proposals = Proposal.all
	end

	def show
		@proposal  = Proposal.find(params[:id])
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
			@proposal.schoolss << @school
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
end