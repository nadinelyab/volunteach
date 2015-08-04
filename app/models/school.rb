class School < ActiveRecord::Base
	has_and_belongs_to_many :proposals
	belongs_to :user
	geocoded_by :location
	after_validation :geocode

	validates :school_name, :location, :needs, presence: true
end
