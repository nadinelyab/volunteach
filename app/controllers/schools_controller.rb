class SchoolsController < ApplicationController
	before_action :authenticate_user!
	def index
		@query = params[:query]

		if @query
			@schools = School.advanced_search(@query)
		else
			@schools = School.all
		end
	end

	def search
		@query = params[:query]
		@schools = School.advanced_search(@query)
	end

	def show
		@school  = School.find(params[:id])
		@proposals = @school.proposals
		@receiver = @school.user.name
		@message = Message.new
	end	

	def edit
		@school = School.find(params[:id])

		if(current_user != @school.user)
			redirect_to school_path(@school), alert:"You can't edit this school."
		end
	end

	def update
		@school = School.find(params[:id])

		if @school.update(school_params)
			redirect_to school_path(@school)
		else
			render :edit
		end
	end

	def new
		@school = School.new

		if current_user.category == "volunteer"
			redirect_to schools_path, alert: "You can't add a school because your user is of type volunteer."
		end
	end

	def create 
		@school = current_user.schools.build(school_params)

		if @school.save
			redirect_to school_path(@school)
		else
			render :new
		end
	end

	def create_link
		@school = School.find(params[:id])
		@proposal = Proposal.find(params[:proposal_id])
		if !@school.proposals.include?(@proposal)
			@school.proposals << @proposal
		end

		redirect_to school_path(@school)
	end

	def destroy
		@school = School.find(params[:id])

		if(current_user != @school.user)
			redirect_to school_path(@school), alert: "You can't delete this school."
		end
		
		@school.destroy

		redirect_to schools_path
	end

	def link_form
		@school = School.find(params[:id])
		@proposals = current_user.proposals
	end

	private
	def school_params
		params.require(:school).permit(:school_name, :location, :needs, :students_age)
	end
end