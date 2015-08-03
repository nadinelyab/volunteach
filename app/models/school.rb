class School < ActiveRecord::Base
	has_and_belongs_to_many :proposals
	belongs_to :user

	validates :school_name, :location, :needs, presence: true
end
