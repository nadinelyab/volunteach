class Proposal < ActiveRecord::Base
	has_and_belongs_to_many :schools
	belongs_to :user

	validates :topic, :language, :description, presence: true
end
