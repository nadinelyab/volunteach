class School < ActiveRecord::Base
	has_and_belongs_to_many :proposals
	belongs_to :user
end
