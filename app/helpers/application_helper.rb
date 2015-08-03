module ApplicationHelper

	def create_link(school, proposal)
		proposal.schools << school
		proposal.save
	end
	
end
