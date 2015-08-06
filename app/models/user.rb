class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :proposals, :dependent => :delete_all
  has_many :schools, :dependent => :delete_all
  has_many :messages

  has_attached_file :photo, styles: { medium: "300x300#", thumbnail: "60x60#" },
                  :url  => "/assets/users/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension"
  
 do_not_validate_attachment_file_type :photo 

  geocoded_by :location
  after_validation :geocode

end
