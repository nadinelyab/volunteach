class Proposal < ActiveRecord::Base
	has_and_belongs_to_many :schools
	belongs_to :user

	validates :teacher_name, :teacher_location, :topic, :language, :description, presence: true
end
