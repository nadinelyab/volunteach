class SchoolsController < ApplicationController
	before_action :authenticate_user!
	def index
		@schools = School.all
	end

	def show
		@school  = School.find(params[:id])
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
	end

	def create 
		@school = current_user.schools.build(school_params
			)

		if @school.save
			redirect_to school_path(@school)
		else
			render :new
		end
	end

	def destroy
		@school = School.find(params[:id])

		if(current_user != @school.user)
			redirect_to school_path(@school), alert: "You can't delete this school."
		end
		
		@school.destroy

		redirect_to schools_path
	end
end