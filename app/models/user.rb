class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :proposals, :dependent => :delete_all
  has_many :schools, :dependent => :delete_all
  has_many :messages

  geocoded_by :location
  after_validation :geocode
end
